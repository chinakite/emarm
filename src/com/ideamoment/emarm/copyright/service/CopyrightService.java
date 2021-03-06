/**
 * 
 */
package com.ideamoment.emarm.copyright.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.copyright.CopyrightException;
import com.ideamoment.emarm.copyright.CopyrightExceptionCode;
import com.ideamoment.emarm.copyright.dao.CopyrightDao;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.CopyrightContract;
import com.ideamoment.emarm.model.CopyrightContractAudit;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.CopyrightContractProduct;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductCopyrightOprtor;
import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.CopyrightContractState;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.RoleType;
import com.ideamoment.emarm.model.enumeration.TaskState;
import com.ideamoment.emarm.model.enumeration.TaskTargetType;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.emarm.util.CnUpperCase;
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
public class CopyrightService {
    @Autowired
    private CopyrightDao copyrightDao;

    /**
     * @return the copyrightDao
     */
    public CopyrightDao getCopyrightDao() {
        return copyrightDao;
    }
    
    /**
     * @param copyrightDao the copyrightDao to set
     */
    public void setCopyrightDao(CopyrightDao copyrightDao) {
        this.copyrightDao = copyrightDao;
    }

    @IdeaJdbcTx
    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      HashMap<String, String> condition)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        boolean mgr = false;
        
        String userRole = curUser.getRole();
        List<String> roles = new ArrayList<String>();
        if(userRole.indexOf(RoleType.SUPER_ADMIN) > -1) {
            roles.add(RoleType.SUPER_ADMIN);
        }
        if(userRole.indexOf(RoleType.CEO) > -1) {
            roles.add(RoleType.CEO);
        }
        if(userRole.indexOf(RoleType.COPYRIGHT_MANAGER) > -1){
            roles.add(RoleType.COPYRIGHT_MANAGER);
            mgr = true;
        }
        if(userRole.indexOf(RoleType.COPYRIGHT_DIRECTOR) > -1){
            roles.add(RoleType.COPYRIGHT_DIRECTOR);
            mgr = true;
        }
        if(userRole.indexOf(RoleType.COPYRIGHT_OPR) > -1){
            roles.add(RoleType.COPYRIGHT_OPR);
        }
        if(userRole.indexOf(RoleType.LAWYER) > -1){
            roles.add(RoleType.LAWYER);
        }
        
        if(mgr) {
            return copyrightDao.pageMgrProducts(curPage, pageSize, roles, userId, condition);
        }
        return copyrightDao.pageProducts(curPage, pageSize, roles, userId, condition);
    }
    
    @IdeaJdbcTx
    public CopyrightContract findCopyContract(String id) {
        return IdeaJdbc.find(CopyrightContract.class, id);
    }

    @IdeaJdbcTx
    public void saveCopyrightContract(CopyrightContract cc,
                                      String[] productIdArr,
                                      String[] priceArr,
                                      int submit)
    {
        if(submit == 0) {
            
        }else{
            
        }
        
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curTime = new Date();
        
        Task task = new Task();
        
        if(cc.getId() != null) {
            cc.setModifier(userId);
            cc.setModifyTime(curTime);
            
            cc.setAuditState(CopyrightContractState.MANAGER_AUDIT);
            task.setRoleId(RoleType.COPYRIGHT_MANAGER);
            
//            if(cc.getTotalPrice().floatValue() < 5000) {
//                cc.setAuditState(CopyrightContractState.AUDIT_FINISH);
//            }else{
//                cc.setAuditState(CopyrightContractState.DIRECTOR_AUDIT);
//                task.setRoleId(RoleType.COPYRIGHT_DIRECTOR);
//            }
            
            IdeaJdbc.update(cc);
        }else{
            String code = createCode(cc);
            cc.setCode(code);
            
            cc.setCreator(userId);
            cc.setCreateTime(curTime);
            cc.setModifier(userId);
            cc.setModifyTime(curTime);
            
            cc.setAuditState(CopyrightContractState.MANAGER_AUDIT);
            task.setRoleId(RoleType.COPYRIGHT_MANAGER);
            
//            if(cc.getTotalPrice().floatValue() < 5000) {
//                cc.setAuditState(CopyrightContractState.AUDIT_FINISH);
//            }else{
//                cc.setAuditState(CopyrightContractState.DIRECTOR_AUDIT);
//                task.setRoleId(RoleType.COPYRIGHT_DIRECTOR);
//            }
            IdeaJdbc.save(cc);
        }
        
        String ccId = cc.getId();
        copyrightDao.deleteContractProduct(ccId);
        int i=0;
        for(String productId : productIdArr) {
            CopyrightContractProduct ccp = new CopyrightContractProduct();
            ccp.setProductId(productId);
            ccp.setContactId(ccId);
            ccp.setPrice(new BigDecimal(priceArr[i]));
            i++;
            IdeaJdbc.save(ccp);
            
            IdeaJdbc.update(Product.class, productId)
                    .setProperty("state", ProductState.CP_CONTRACT_INFLOW)
                    .execute();
        }
        
        
        task.setCreateTime(curTime);
        task.setCreator(curUser.getId());
        task.setModifier(curUser.getId());
        task.setModifyTime(curTime);
        task.setState(TaskState.UNREAD);
        task.setTargetId(ccId);
        task.setTargetType(TaskTargetType.COPYRIGHT_CONTRACT);
        task.setTitle("版权合同《"+cc.getCode()+"》需要您进行审核，请办理。");
        if(task.getRoleId() != null) {
            IdeaJdbc.save(task);
        }
    }

    private synchronized String createCode(CopyrightContract cc) {
        Date curDate = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String dateStr = df.format(curDate);
        String prefix = "C" + dateStr;
        String maxCode = copyrightDao.queryMaxContractCode(prefix);
        
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
    public Page<CopyrightContract> pageMyContracts(int curPage,
                                                   int pageSize,
                                                   HashMap<String, String> condition)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Page<CopyrightContract> contracts = copyrightDao.pageMyContracts(curPage, pageSize, userId, condition);
        
        return contracts;
    }

    @IdeaJdbcTx
    public Page<CopyrightContract> pageAuditContracts(int curPage,
                                                      int pageSize,
                                                      HashMap<String, String> condition)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userRole = curUser.getRole();
        
        List<String> auditStates = new ArrayList<String>(); 
        if(userRole.contains(RoleType.COPYRIGHT_DIRECTOR)) {
            auditStates.add(CopyrightContractState.DIRECTOR_AUDIT);
        }
        if(userRole.contains(RoleType.COPYRIGHT_MANAGER)) {
            auditStates.add(CopyrightContractState.MANAGER_AUDIT);
        }
        if(userRole.contains(RoleType.CEO)) {
            auditStates.add(CopyrightContractState.CEO_AUDIT);
        }
        if(userRole.contains(RoleType.LAWYER)) {
            auditStates.add(CopyrightContractState.LAWYER_AUDIT);
            auditStates.add(CopyrightContractState.LAWYER_CONFIRM);
            auditStates.add(CopyrightContractState.FINISH_CONFIRM);
        }
        
        if(auditStates.size() == 0) {
            Page<CopyrightContract> nullResult = new Page<CopyrightContract>();
            nullResult.setCurrentPage(curPage);
            nullResult.setPageSize(pageSize);
            nullResult.setTotalRecord(0L);
            nullResult.setData(new ArrayList());
            return nullResult;
        }else{
            Page<CopyrightContract> contracts = copyrightDao.pageAuditContracts(curPage, pageSize, auditStates, condition);
            return contracts;
        }
    }

    @IdeaJdbcTx
    public CopyrightContract findContract(String id) {
        return IdeaJdbc.find(CopyrightContract.class, id);
    }

    @IdeaJdbcTx
    public List<Product> listContractProducts(String id) {
        return copyrightDao.listContractProducts(id);
    }

    @IdeaJdbcTx
    public void passContract(String id, String remark) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        Date curTime = new Date();
        
        CopyrightContractAudit cca = new CopyrightContractAudit();
        cca.setAuditorId(curUser.getId());
        cca.setAuditRemark(remark);
        cca.setAuditResult(YesOrNo.YES);
        cca.setAuditTime(curTime);
        cca.setContractId(id);
        
        IdeaJdbc.save(cca);
        
        Task task = new Task();
        
        CopyrightContract cc = IdeaJdbc.find(CopyrightContract.class, id);
        if(cc.getAuditState().equals(CopyrightContractState.DIRECTOR_AUDIT)) {
            if(cc.getTotalPrice().floatValue() < 10000) {
                cc.setAuditState(CopyrightContractState.AUDIT_FINISH);
            }else{
                cc.setAuditState(CopyrightContractState.MANAGER_AUDIT);
                task.setRoleId(RoleType.COPYRIGHT_MANAGER);
            }
        }else if(cc.getAuditState().equals(CopyrightContractState.MANAGER_AUDIT)) {
        	cc.setAuditState(CopyrightContractState.LAWYER_AUDIT);
            task.setRoleId(RoleType.LAWYER);
        	
//            if(cc.getTotalPrice().floatValue() < 20000) {
//                cc.setAuditState(CopyrightContractState.AUDIT_FINISH);
//            }else{
//                cc.setAuditState(CopyrightContractState.CEO_AUDIT);
//                task.setRoleId(RoleType.CEO);
//            }
        }else if(cc.getAuditState().equals(CopyrightContractState.CEO_AUDIT)) {
//            cc.setAuditState(CopyrightContractState.AUDIT_FINISH);
        	cc.setAuditState(CopyrightContractState.FINISH_CONFIRM);
            task.setRoleId(RoleType.LAWYER);
        }else if(cc.getAuditState().equals(CopyrightContractState.LAWYER_AUDIT)) {
//            cc.setAuditState(CopyrightContractState.LAWYER_CONFIRM);
//            task.setRoleId(RoleType.LAWYER);
        	
        	cc.setAuditState(CopyrightContractState.CEO_AUDIT);
            task.setRoleId(RoleType.CEO);
        }else if(cc.getAuditState().equals(CopyrightContractState.FINISH_CONFIRM)) {
            cc.setAuditState(CopyrightContractState.FINISH);
        }
        
        IdeaJdbc.update(cc);
        
        if(cc.getAuditState().equals(CopyrightContractState.FINISH)) {
            List<Product> products = copyrightDao.listContractProducts(id);
            
            for(Product product : products) {
                IdeaJdbc.update(Product.class, product.getId())
                        .setProperty("state", ProductState.CP_CONTRACT_FINISH)
                        .setProperty("modifier", curUser.getId())
                        .setProperty("modifyTime", curTime)
                        .execute();
            }
        }
        
        task.setCreateTime(curTime);
        task.setCreator(curUser.getId());
        task.setModifier(curUser.getId());
        task.setModifyTime(curTime);
        if(task.getRoleId() == null)
        	task.setRoleId(RoleType.COPYRIGHT_DIRECTOR);
        task.setState(TaskState.UNREAD);
        task.setTargetId(cc.getId());
        task.setTargetType(TaskTargetType.COPYRIGHT_CONTRACT);
        task.setTitle("版权合同《"+cc.getCode()+"》需要您进行审核，请办理。");
        if(task.getRoleId() != null) {
            IdeaJdbc.save(task);
        }
    }

    @IdeaJdbcTx
    public void rejectContract(String id, String remark) {
    	Date curTime = new Date();
    	
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        CopyrightContractAudit cca = new CopyrightContractAudit();
        cca.setAuditorId(curUser.getId());
        cca.setAuditRemark(remark);
        cca.setAuditResult(YesOrNo.NO);
        cca.setAuditTime(new Date());
        cca.setContractId(id);
        
        IdeaJdbc.save(cca);
        
        CopyrightContract cc = IdeaJdbc.find(CopyrightContract.class, id);
        if(cc.getAuditState().equals(CopyrightContractState.FINISH_CONFIRM)) {
            cc.setAuditState(CopyrightContractState.LAWYER_CONFIRM);
        }else{
            cc.setAuditState(CopyrightContractState.REJECTED);
        }
        cc.setModifier(curUser.getId());
        cc.setModifyTime(curTime);
        
        IdeaJdbc.update(cc);
        
        Task task = new Task();
        task.setCreateTime(curTime);
        task.setCreator(curUser.getId());
        task.setModifier(curUser.getId());
        task.setModifyTime(curTime);
        task.setState(TaskState.UNREAD);
        task.setTargetId(cc.getId());
        task.setTargetType(TaskTargetType.COPYRIGHT_CONTRACT);
        task.setTitle("版权合同《"+cc.getCode()+"》信息审核未通过，请处理后重新提交审核。");
        task.setUserId(cc.getCreator());
        
        IdeaJdbc.save(task);
        
    }

    @IdeaJdbcTx
    public List<CopyrightContractAudit> listContractAudits(String contractId) {
        return copyrightDao.listContractAudits(contractId);
    }

    @IdeaJdbcTx
    public void generateDoc(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        CopyrightContract cc = IdeaJdbc.find(CopyrightContract.class, id);
        String privilegeType = cc.getPrivilegeType();
        
        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/");
        try {
            Template tmpl = cfg.getTemplate("com/ideamoment/emarm/copyright/service/copyright_exclusive.ftl");
//            Template tmpl = cfg.getTemplate("com/ideamoment/emarm/copyright/service/test.ftl");
        
            Map root = new HashMap();
            root.put("code", cc.getCode());
            root.put("owner", cc.getOwner());
            root.put("ownerContact", cc.getOwnerContact());
            root.put("ownerContactPhone", cc.getOwnerContactPhone());
            root.put("ownerContactAddress", cc.getOwnerContactAddress());
            root.put("ownerContactEmail", cc.getOwnerContactEmail());
            root.put("buyer", cc.getBuyer());
            root.put("buyerContact", cc.getBuyerContact());
            root.put("buyerContactPhone", cc.getBuyerContactPhone());
            root.put("buyerContactAddress", cc.getBuyerContactAddress());
            root.put("buyerContactEmail", cc.getBuyerContactEmail());
            root.put("privileges", cc.getPrivilegesText());
            root.put("privilegeType", cc.getPrivilegeTypeText());
            root.put("privilegeRange", cc.getPrivilegeRangeText());
            CnUpperCase cuc = new CnUpperCase(cc.getPrivilegeDeadline());
            root.put("privilegeDeadline", cuc.getCnString());
            root.put("bank", cc.getBank());
            root.put("bankAccountName", cc.getBankAccountName());
            root.put("bankAccountNo", cc.getBankAccountNo());
            root.put("totalPrice", cc.getTotalPrice());
            
            List<Product> products = copyrightDao.listContractProducts(id);
            root.put("products", products);
            
            String webRoot = IdeaApplicationContext.getInstance().getWebRoot();
            if(!webRoot.endsWith("/") && !webRoot.endsWith("\\")) {
                webRoot += File.separator;
            }
            
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String dateStr = sdf.format(date);
            
            String outputDirStr = webRoot + "cc" + File.separator + dateStr;
            File outputDir = new File(outputDirStr);
            if(!outputDir.exists()) {
                outputDir.mkdirs();
            }
            
            String fileId = UUID.randomUUID().toString().replaceAll("\\-", "");
            String outputPath = outputDirStr + File.separator + fileId + ".doc";
            String fileUrl = "/cc" + File.separator + dateStr + File.separator + fileId + ".doc";
            fileUrl = fileUrl.replaceAll("\\\\", "/");
            
            Writer out = new OutputStreamWriter(new FileOutputStream(new File(outputPath)), "UTF-8");
            tmpl.process(root, out);
            out.flush();
            
            out.close();
            
            CopyrightContractDoc ccd = new CopyrightContractDoc();
            ccd.setContractId(id);
            ccd.setCreateTime(new Date());
            ccd.setCreatorId(curUser.getId());
            ccd.setVersion("1.0");
            ccd.setFileUrl(fileUrl);
            
            IdeaJdbc.save(ccd);
        } catch (IOException e) {
            e.printStackTrace();
            throw new CopyrightException(CopyrightExceptionCode.FREEMARKER_ERR, "Freemarker error : " + e.getMessage(), e);
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
    
    @IdeaJdbcTx
    public List<CopyrightContractDoc> listContractDocs(String contractId) {
        return copyrightDao.listContractDocs(contractId);
    }

    @IdeaJdbcTx
    public void uploadContractDoc(String id, String fileUrl, String version, String finishedDoc, String type) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        CopyrightContractDoc ccd = new CopyrightContractDoc();
        ccd.setContractId(id);
        ccd.setCreateTime(new Date());
        ccd.setCreatorId(curUser.getId());
        ccd.setVersion(version);
        ccd.setFileUrl(fileUrl);
        ccd.setType(type);
        
        IdeaJdbc.save(ccd);
        
        if(finishedDoc.equals("1")) {
            IdeaJdbc.update(CopyrightContract.class, id)
                    .setProperty("auditState", CopyrightContractState.FINISH_CONFIRM)
                    .execute();
        }
    }
    
    public static void main(String[] args) {
        CopyrightService crs = new CopyrightService();
        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(crs.getClass(), "/");
        
        try {
            Template tmpl = cfg.getTemplate("com/ideamoment/emarm/copyright/service/test.ftl");
        
            Author a = new Author();
            a.setName("maoni");
            a.setPseudonym("maoning");
            a.setIdcard("1234567890");
            
            Product p1 = new Product();
            p1.setName("Product1");
            p1.setWordCount(new BigDecimal(30));
            p1.setIsbn("11111111");
            p1.setAuthor(a);
            
            List ps = new ArrayList();
            ps.add(p1);
            
            Map root = new HashMap();
            root.put("products", ps);
            
            StringWriter writer = new StringWriter(); 
            tmpl.process(root, writer);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }

    @IdeaJdbcTx
    public List<CopyrightContract> listProductContracts(String productId) {
        return copyrightDao.listProductContracts(productId);
    }

    @IdeaJdbcTx
    public void toLawyer(String id) {
        IdeaJdbc.update(CopyrightContract.class, id)
                .setProperty("auditState", CopyrightContractState.LAWYER_AUDIT)
                .execute();
    }

    @IdeaJdbcTx
    public void finish(String id) {
        
        
    }

    @IdeaJdbcTx
    public Product findProduct(String id) {
        return copyrightDao.findProduct(id);
    }

    @IdeaJdbcTx
    public Page<Product> pageMgrProducts(int curPage,
                                         int pageSize,
                                         HashMap<String, String> condition)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        String userRole = curUser.getRole();
        List<String> roles = new ArrayList<String>();
        if(userRole.indexOf(RoleType.SUPER_ADMIN) > -1) {
            roles.add(RoleType.SUPER_ADMIN);
        }
        if(userRole.indexOf(RoleType.CEO) > -1) {
            roles.add(RoleType.CEO);
        }
        if(userRole.indexOf(RoleType.COPYRIGHT_MANAGER) > -1){
            roles.add(RoleType.COPYRIGHT_MANAGER);
        }
        if(userRole.indexOf(RoleType.COPYRIGHT_DIRECTOR) > -1){
            roles.add(RoleType.COPYRIGHT_DIRECTOR);
        }
        if(userRole.indexOf(RoleType.COPYRIGHT_OPR) > -1){
            roles.add(RoleType.COPYRIGHT_OPR);
        }
        if(userRole.indexOf(RoleType.LAWYER) > -1){
            roles.add(RoleType.LAWYER);
        }
        
        return copyrightDao.pageMgrProducts(curPage, pageSize, roles, userId, condition);
    }

    @IdeaJdbcTx
    public void assignedOptor(String productId, String userId) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String curUserId = curUser.getId();
        
        Date curTime = new Date();
        
        ProductCopyrightOprtor pco = new ProductCopyrightOprtor();
        pco.setUserId(userId);
        pco.setProductId(productId);
        pco.setCreateTime(curTime);
        pco.setCreator(curUserId);
        pco.setModifier(curUserId);
        pco.setModifyTime(curTime);
        
        IdeaJdbc.save(pco);
        
        Product product = IdeaJdbc.find(Product.class, productId);
        
        Task task = new Task();
        task.setCreateTime(curTime);
        task.setCreator(curUser.getId());
        task.setModifier(curUser.getId());
        task.setModifyTime(curTime);
        task.setRoleId(RoleType.COPYRIGHT_OPR);
        task.setState(TaskState.UNREAD);
        task.setTargetId(productId);
        task.setTargetType(TaskTargetType.EVALUATION);
        task.setTitle("作品《"+product.getName()+"》的版权合同已分配给您办理。");
        IdeaJdbc.save(task);
    }

    @IdeaJdbcTx
    public Long countCopyrightCurMonth() {
        DateTime curDate = new DateTime();
        int year = curDate.getYear();
        int month = curDate.getMonthOfYear();
        
        DateTime startDate = new DateTime(year, month, 1, 0, 0, 0, 0);
        DateTime endDate = new DateTime(year, month+1, 1, 0, 0, 0, 0);
        
        return copyrightDao.countCopyrightByTime(startDate.toDate(), endDate.toDate());
    }

    @IdeaJdbcTx
    public void deleteCopyrightContract(String contractId) {
        copyrightDao.deleteContractAudit(contractId);
        copyrightDao.deleteContractDoc(contractId);
        copyrightDao.deleteContractProduct(contractId);
        IdeaJdbc.delete(CopyrightContract.class, contractId);
    }
    
    @IdeaJdbcTx
    public String findProductOptorId(String productId) {
        return copyrightDao.findProductOptorId(productId);
    }
    
}
