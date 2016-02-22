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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.copyright.CopyrightException;
import com.ideamoment.emarm.copyright.CopyrightExceptionCode;
import com.ideamoment.emarm.make.dao.MakeDao;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.MakeContract;
import com.ideamoment.emarm.model.MakeContractDoc;
import com.ideamoment.emarm.model.MakeTask;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.ideadp.appcontext.IdeaApplicationContext;
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
            task.setContractId(contractId);
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
            
            IdeaJdbc.save(task);
            
            return task;
        }else{
            MakeTask task = IdeaJdbc.find(MakeTask.class, id);
            task.setContractId(contractId);
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
    public void uploadContractDoc(String id, String fileUrl, String version) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        MakeContractDoc mcd = new MakeContractDoc();
        mcd.setContractId(id);
        mcd.setCreateTime(new Date());
        mcd.setCreatorId(curUser.getId());
        mcd.setVersion(version);
        mcd.setFileUrl(fileUrl);
        
        IdeaJdbc.save(mcd);
    }

    @IdeaJdbcTx
    public List<MakeContractDoc> listContractDocs(String contractId) {
        return makeDao.listContractDocs(contractId);
    }

    @IdeaJdbcTx
    public void finishContract(String contractId) {
        if(checkCanFinish()) {
            UserContext uc = UserContext.getCurrentContext();
            User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
            
            MakeContract mc = IdeaJdbc.find(MakeContract.class, contractId);
            String productId = mc.getProductId();
            IdeaJdbc.update(Product.class, productId)
                    .setProperty("state", ProductState.MK_FINISH)
                    .setProperty("modifyTime", new Date())
                    .setProperty("modifier", curUser.getId())
                    .execute();
        }
    }
    
    private boolean checkCanFinish() {
        return true;
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
}
