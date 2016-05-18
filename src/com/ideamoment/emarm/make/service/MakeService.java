/**
 * 
 */
package com.ideamoment.emarm.make.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.mail.HtmlEmail;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.copyright.CopyrightException;
import com.ideamoment.emarm.copyright.CopyrightExceptionCode;
import com.ideamoment.emarm.make.MakeException;
import com.ideamoment.emarm.make.MakeExceptionCode;
import com.ideamoment.emarm.make.dao.MakeDao;
import com.ideamoment.emarm.model.EmailSetting;
import com.ideamoment.emarm.model.MakeContract;
import com.ideamoment.emarm.model.MakeContractDoc;
import com.ideamoment.emarm.model.MakeTask;
import com.ideamoment.emarm.model.MakeTaskAudio;
import com.ideamoment.emarm.model.MakeTaskAudioAudit;
import com.ideamoment.emarm.model.MakeTaskAudioFile;
import com.ideamoment.emarm.model.MakeTaskCopyrightFile;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductAudio;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.MakeContractState;
import com.ideamoment.emarm.model.enumeration.MakeTaskState;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadp.appcontext.IdeaApplicationContext;
import com.ideamoment.ideadp.exception.IdeaDataException;
import com.ideamoment.ideadp.exception.IdeaDataExceptionCode;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @author Chinakite
 *
 */
@Service
public class MakeService {
    @Autowired
    private MakeDao makeDao;
    
    /**
     * @return the makeDao
     */
    public MakeDao getMakeDao() {
        return makeDao;
    }
    
    /**
     * @param makeDao the makeDao to set
     */
    public void setMakeDao(MakeDao makeDao) {
        this.makeDao = makeDao;
    }

    @IdeaJdbcTx
    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      HashMap<String, String> condition)
    {
        Page<Product> products = makeDao.pageProducts(curPage, pageSize, condition);
    
        List<String> productIds = new ArrayList<String>();
        List<Product> prodList = products.getData();
        for(Product prod : prodList) {
            productIds.add(prod.getId());
        }
        
        Map<String, Long> taskCounts = makeDao.countTaskByProduct(productIds);
        for(Product prod : prodList) {
            if(taskCounts.get(prod.getId()) != null) {
                prod.setTaskCount(taskCounts.get(prod.getId()).intValue());
            }else{
                prod.setTaskCount(0);
            }
        }
        
        return products;
    }

    @IdeaJdbcTx
    public MakeTask saveMakeTask(String id,
                             String productId,
                             String makerId,
                             String contractId,
                             Integer timePerSection,
                             String showType,
                             String showExpection,
                             Integer makeTime,
                             String desc)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Product product = IdeaJdbc.find(Product.class, productId);
        
        Date curTime = new Date();
        
        if(StringUtils.isEmpty(id)) {
            MakeTask task = new MakeTask();
            if(!contractId.equals("-1")) {
                task.setContractId(contractId);
            }
            task.setCreateTime(curTime);
            task.setCreator(userId);
            task.setDesc(desc);
            task.setMakerId(makerId);
            task.setMakeTime(makeTime);
            task.setModifier(userId);
            task.setModifyTime(curTime);
            task.setName(product.getName());
            task.setProductId(productId);
            task.setShowExpection(showExpection);
            task.setShowType(showType);
            task.setTimePerSection(timePerSection);
            task.setState(MakeTaskState.NEW);
            
            IdeaJdbc.save(task);
            
            return task;
        }else{
            MakeTask task = IdeaJdbc.find(MakeTask.class, id);
            if(!contractId.equals("-1")) {
                task.setContractId(contractId);
            }
            task.setDesc(desc);
            task.setMakerId(makerId);
            task.setMakeTime(makeTime);
            task.setModifier(userId);
            task.setModifyTime(curTime);
            task.setName(product.getName());
            task.setProductId(productId);
            task.setShowExpection(showExpection);
            task.setShowType(showType);
            task.setTimePerSection(timePerSection);
            
            IdeaJdbc.update(task);
            
            return task;
        }
    }

    @IdeaJdbcTx
    public List<MakeTask> listMakeTasks(String productId) {
        return makeDao.listMakeTasks(productId);
    }

    @IdeaJdbcTx
    public MakeTask findMakeTask(String id) {
        MakeTask task = makeDao.findMakeTask(id);
        return task;
    }

    @IdeaJdbcTx
    public void saveMakeContract(MakeContract mc) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curDate = new Date();
        
        if(mc.getId() != null) {
            mc.setModifier(userId);
            mc.setModifyTime(curDate);
            IdeaJdbc.update(mc);
        }else{
            String code = createCode(mc);
            mc.setCode(code);
            
            mc.setCreator(userId);
            mc.setCreateTime(curDate);
            mc.setModifier(userId);
            mc.setModifyTime(curDate);
            
            IdeaJdbc.save(mc);
            
            String prodId = mc.getProductId();
            Product prod = IdeaJdbc.find(Product.class, prodId);
            prod.setState(ProductState.MK_CONTRACT);
            prod.setModifier(userId);
            prod.setModifyTime(curDate);
            
            IdeaJdbc.update(prod);
        }
    }
    
    @IdeaJdbcTx
    public MakeContract findMakeContractByProduct(String productId) {
        return makeDao.findMakeContract(productId);
    }
    
    private synchronized String createCode(MakeContract mc) {
        Date curDate = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String dateStr = df.format(curDate);
        String prefix = "M" + dateStr;
        String maxCode = makeDao.queryMaxContractCode(prefix);
        
        int intCode = 1;
        if(maxCode != null) {
            String[] codeParts = maxCode.split("-");
            intCode = Integer.parseInt(codeParts[1]);
            intCode++;
        }
        
        DecimalFormat nf = new DecimalFormat("000");
        String strCode = nf.format(intCode);
        
        return prefix + "-" + strCode;
    }

    @IdeaJdbcTx
    public void generateDoc(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        MakeContract mc = IdeaJdbc.find(MakeContract.class, id);
        String targetType = mc.getTargetType();
        
        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/");
        try {
            Template tmpl = cfg.getTemplate("com/ideamoment/emarm/make/service/make_personal.ftl");
//            Template tmpl = cfg.getTemplate("com/ideamoment/emarm/copyright/service/test.ftl");
        
            Map root = new HashMap();
            root.put("code", mc.getCode());
            root.put("owner", mc.getOwner());
            root.put("ownerContact", mc.getOwnerContact());
            root.put("ownerContactPhone", mc.getOwnerContactPhone());
            root.put("ownerContactAddress", mc.getOwnerContactAddress());
            root.put("ownerContactEmail", mc.getOwnerContactEmail());
            root.put("worker", mc.getWorker());
            root.put("workerContact", mc.getWorkerContact());
            root.put("workerContactPhone", mc.getWorkerContactPhone());
            root.put("workerContactAddress", mc.getWorkerContactAddress());
            root.put("workerContactEmail", mc.getWorkerContactEmail());
            root.put("bank", mc.getBank());
            root.put("bankAccountName", mc.getBankAccountName());
            root.put("bankAccountNo", mc.getBankAccountNo());
            root.put("totalPrice", mc.getTotalPrice());
            root.put("price", mc.getPrice());
            root.put("totalSection", mc.getTotalSection());
            root.put("penalty", mc.getPenalty());
            
            Product product = IdeaJdbc.find(Product.class, mc.getProductId());
            root.put("product", product);
            
            String webRoot = IdeaApplicationContext.getInstance().getWebRoot();
            if(!webRoot.endsWith("/") && !webRoot.endsWith("\\")) {
                webRoot += File.separator;
            }
            
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String dateStr = sdf.format(date);
            
            String outputDirStr = webRoot + "mc" + File.separator + dateStr;
            File outputDir = new File(outputDirStr);
            if(!outputDir.exists()) {
                outputDir.mkdirs();
            }
            
            String fileId = UUID.randomUUID().toString().replaceAll("\\-", "");
            String outputPath = outputDirStr + File.separator + fileId + ".doc";
            String fileUrl = "/mc" + File.separator + dateStr + File.separator + fileId + ".doc";
            fileUrl = fileUrl.replaceAll("\\\\", "/");
            
            Writer out = new OutputStreamWriter(new FileOutputStream(new File(outputPath)), "UTF-8");
            tmpl.process(root, out);
            out.flush();
            
            out.close();
            
            MakeContractDoc mcd = new MakeContractDoc();
            mcd.setContractId(id);
            mcd.setCreateTime(new Date());
            mcd.setCreatorId(curUser.getId());
            mcd.setVersion("1.0");
            mcd.setFileUrl(fileUrl);
            
            IdeaJdbc.save(mcd);
        } catch (IOException e) {
            e.printStackTrace();
            throw new CopyrightException(CopyrightExceptionCode.FREEMARKER_ERR, "Freemarker error : " + e.getMessage(), e);
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        
    }

    @IdeaJdbcTx
    public void uploadContractDoc(String id, String fileUrl, String version, String type) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        MakeContractDoc mcd = new MakeContractDoc();
        mcd.setContractId(id);
        mcd.setCreateTime(new Date());
        mcd.setCreatorId(curUser.getId());
        mcd.setVersion(version);
        mcd.setFileUrl(fileUrl);
        mcd.setType(type);
        
        IdeaJdbc.save(mcd);
    }

    @IdeaJdbcTx
    public List<MakeContractDoc> listContractDocs(String contractId) {
        return makeDao.listContractDocs(contractId);
    }

    @IdeaJdbcTx
    public void finishContract(String contractId) {
        if(checkCanFinish(contractId)) {
            UserContext uc = UserContext.getCurrentContext();
            User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
            
            MakeContract mc = IdeaJdbc.find(MakeContract.class, contractId);
            mc.setModifier(curUser.getId());
            mc.setModifyTime(new Date());
            mc.setState(MakeContractState.FINISHED);
            IdeaJdbc.update(mc);
            
            String productId = mc.getProductId();
            IdeaJdbc.update(Product.class, productId)
                    .setProperty("state", ProductState.MK_FINISH)
                    .setProperty("modifyTime", new Date())
                    .setProperty("modifier", curUser.getId())
                    .execute();
        }else{
            throw new MakeException(MakeExceptionCode.CANT_FINISH_CONTRACT, "Can not finish make contract.");
        }
    }
    
    private boolean checkCanFinish(String contractId) {
        List<MakeTask> tasks = makeDao.queryTasksByContract(contractId);
        if(tasks == null || tasks.size() == 0) {
            throw new MakeException(MakeExceptionCode.CONTRACT_NO_TASK, "Can not finish make contract.");
        }
        
        Long i = (Long)makeDao.queryUnfinishedAudioCount(contractId);
        if(i != null && i == 0)
            return true;
        else
            return false;
    }

    @IdeaJdbcTx
    public List<MakeTask> listExtMyMakeTasks() {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        return makeDao.listExtMyMakeTasks(userId);
    }

    @IdeaJdbcTx
    public Page<MakeTask> pageExtMyMakeTasks(int curPage, int pageSize) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        return makeDao.pageExtMyMakeTasks(curPage, pageSize, userId);
    }

    @IdeaJdbcTx
    public List<MakeTaskAudio> listMakeTaskAudioes(String id) {
        return makeDao.listMakeTaskAudioes(id);
    }

    @IdeaJdbcTx
    public void createSection(String name, String makeTaskId, String isSample) {
        MakeTask task = IdeaJdbc.find(MakeTask.class, makeTaskId);
        if(task == null) {
            throw new IdeaDataException(IdeaDataExceptionCode.DATA_NOU_FOUND, "MakeTask[" + makeTaskId + "] is not found.");
        }
        
        if(YesOrNo.YES.equals(task.getExtFinish())) {
            throw new MakeException(MakeExceptionCode.CANT_CREATE_SECTION, "MakeTask[" + makeTaskId + "] is finished yet.");
        }
        
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curTime = new Date();
        
        MakeTaskAudio mta = new MakeTaskAudio();
        mta.setCreateTime(curTime);
        mta.setCreator(userId);
        mta.setMakeTaskId(makeTaskId);
        mta.setModifier(userId);
        mta.setModifyTime(curTime);
        mta.setTitle(name);
        mta.setIsSample(isSample);
        
        IdeaJdbc.save(mta);
    }

    @IdeaJdbcTx
    public void createMakeTaskAudioFile(String makeTaskAudioId,
                                        String version,
                                        String fileUrl)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curTime = new Date();
        
        MakeTaskAudioFile mtaf = new MakeTaskAudioFile();
        mtaf.setCreateTime(curTime);
        mtaf.setCreator(userId);
        mtaf.setMakeTaskAudioId(makeTaskAudioId);
        mtaf.setModifier(userId);
        mtaf.setModifyTime(curTime);
        mtaf.setVersion(version);
        mtaf.setFileUrl(fileUrl);
        
        IdeaJdbc.save(mtaf);
        
    }

    @IdeaJdbcTx
    public List<MakeTaskAudioFile> listMakeTaskAudioFiles(String makeTaskAudioId) {
        return makeDao.listMakeTaskAudioFiles(makeTaskAudioId);
    }

    @IdeaJdbcTx
    public List<MakeTaskAudioAudit> listMakeTaskAudioAudits(String makeTaskAudioId) {
        return makeDao.listMakeTaskAudioAudits(makeTaskAudioId);
    }

    @IdeaJdbcTx
    public void createMakeTaskAudioAudit(String makeTaskAudioId,
                                         String remark,
                                         String result)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curTime = new Date();
        
        MakeTaskAudioAudit mtaa = new MakeTaskAudioAudit();
        mtaa.setCreateTime(curTime);
        mtaa.setCreator(userId);
        mtaa.setMakeTaskAudioId(makeTaskAudioId);
        mtaa.setModifier(userId);
        mtaa.setModifyTime(curTime);
        mtaa.setRemark(remark);
        mtaa.setResult(result);
        
        IdeaJdbc.save(mtaa);
        
    }

    @IdeaJdbcTx
    public List<MakeContract> listMakeContractsByProduct(String productId) {
        return makeDao.listMakeContractsByProduct(productId);
    }

    @IdeaJdbcTx
    public List<MakeContract> listAvaliableMakeContracts() {
        return makeDao.listAvaliableMakeContracts();
    }

    @IdeaJdbcTx
    public MakeTask publishTask(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        String contextPath = uc.getRequest().getContextPath();
        if(!contextPath.endsWith("/")) {
            contextPath += "/";
        }
        
        Date curTime = new Date();
        
        MakeTask task = IdeaJdbc.find(MakeTask.class, id);
        String productId = task.getProductId();
        
        Product prod = IdeaJdbc.find(Product.class, productId);
        
        String makerId = task.getMakerId();
        User maker = IdeaJdbc.find(User.class, makerId);
        
        HtmlEmail email = new HtmlEmail(); 
        
        EmailSetting emailSetting = IdeaJdbc.find(EmailSetting.class, "1");
        try {
            // 这里是SMTP发送服务器的名字：163的如下："smtp.163.com"  
            email.setHostName(emailSetting.getHostName());  
            email.setSmtpPort(Integer.parseInt(emailSetting.getPort()));
            // 字符编码集的设置  
            email.setCharset("UTF-8");  
            // 收件人的邮箱  
            email.addTo(maker.getEmail());  
            // 发送人的邮箱  
            email.setFrom(emailSetting.getFromEmail(), emailSetting.getFromName());  
            // 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码  
            email.setAuthentication(emailSetting.getUserName(), emailSetting.getPassword());  
            // 要发送的邮件主题  
            email.setSubject("制作任务-" + prod.getName());  
            // 要发送的信息，由于使用了HtmlEmail，可以在邮件内容中使用HTML标签  
            email.setMsg("<p>悦库时光给您发来了新的制作任务：</p><a href='http://www.6wanr.com" + contextPath + "mklogin'>" + prod.getName() + "</a>");  
            // 发送  
            email.send();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        
        task.setModifier(userId);
        task.setModifyTime(curTime);
        task.setState(MakeTaskState.PUBLISH);
        
        IdeaJdbc.update(task);
        
        return task;
    }

    @IdeaJdbcTx
    public void passTaskAudio(String audioId) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curTime = new Date();
        
        MakeTaskAudioFile file = IdeaJdbc.find(MakeTaskAudioFile.class, audioId);
        file.setState(YesOrNo.YES);
        file.setModifier(userId);
        file.setModifyTime(curTime);
        
        IdeaJdbc.update(file);
        
        String parentId = file.getMakeTaskAudioId();
        MakeTaskAudio mta = IdeaJdbc.find(MakeTaskAudio.class, parentId);
        mta.setModifier(userId);
        mta.setModifyTime(curTime);
        mta.setState(YesOrNo.YES);
        
        IdeaJdbc.update(mta);
        
        String taskId = mta.getMakeTaskId();
        MakeTask task = IdeaJdbc.find(MakeTask.class, taskId);
        
        ProductAudio pa = new ProductAudio();
        pa.setFileUrl(file.getFileUrl());
        pa.setName(mta.getTitle());
        pa.setCreateTime(curTime);
        pa.setCreator(userId);
        pa.setModifier(userId);
        pa.setModifyTime(curTime);
        pa.setProductId(task.getProductId());
        pa.setIsSample(mta.getIsSample());
        
        IdeaJdbc.save(pa);
    }

    @IdeaJdbcTx
    public Long countMakeCurMonth() {
        DateTime curDate = new DateTime();
        int year = curDate.getYear();
        int month = curDate.getMonthOfYear();
        
        DateTime startDate = new DateTime(year, month, 1, 0, 0, 0, 0);
        DateTime endDate = new DateTime(year, month+1, 1, 0, 0, 0, 0);
        
        return makeDao.countMakeByTime(startDate.toDate(), endDate.toDate());
    }

    @IdeaJdbcTx
    public void extFinishMakeTask(String makeTaskId) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        MakeTask task = IdeaJdbc.find(MakeTask.class, makeTaskId);
        if(task != null) {
            task.setExtFinish(YesOrNo.YES);
            task.setModifier(userId);
            task.setModifyTime(new Date());
        }
        IdeaJdbc.update(task);
    }

    @IdeaJdbcTx
    public void createMakeTaskCopyrightFile(String makeTaskId, String fileUrl) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        MakeTaskCopyrightFile mtcf = new MakeTaskCopyrightFile();
        mtcf.setCreateTime(new Date());
        mtcf.setCreatorId(userId);
        mtcf.setFileUrl(fileUrl);
        mtcf.setMakeTaskId(makeTaskId);
        
        IdeaJdbc.save(mtcf);
    }

    @IdeaJdbcTx
    public List<MakeTaskCopyrightFile> listMakeTaskCopyrightFiles(String makeTaskId) {
        List<MakeTaskCopyrightFile> files = makeDao.listMakeTaskCopyrightFiles(makeTaskId);
        return files;
    }
}
