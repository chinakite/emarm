/**
 * 
 */
package com.ideamoment.emarm.evaluation.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.author.dao.AuthorDao;
import com.ideamoment.emarm.evaluation.EvaluationException;
import com.ideamoment.emarm.evaluation.EvaluationExceptionCode;
import com.ideamoment.emarm.evaluation.dao.EvaluationDao;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.EmailSetting;
import com.ideamoment.emarm.model.Evaluation;
import com.ideamoment.emarm.model.EvaluationInvitation;
import com.ideamoment.emarm.model.FinalEvaluation;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductCopyrightFile;
import com.ideamoment.emarm.model.ProductImage;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductImageType;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.model.enumeration.RoleType;
import com.ideamoment.emarm.model.enumeration.TaskState;
import com.ideamoment.emarm.model.enumeration.TaskTargetType;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadp.exception.IdeaDataException;
import com.ideamoment.ideadp.exception.IdeaDataExceptionCode;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class EvaluationService {
    @Autowired
    private EvaluationDao evaluationDao;
    
    @Autowired
    private AuthorDao authorDao;

    /**
     * @return the evaluationDao
     */
    public EvaluationDao getEvaluationDao() {
        return evaluationDao;
    }
    
    /**
     * @param evaluationDao the evaluationDao to set
     */
    public void setEvaluationDao(EvaluationDao evaluationDao) {
        this.evaluationDao = evaluationDao;
    }
    
    /**
     * @return the authorDao
     */
    public AuthorDao getAuthorDao() {
        return authorDao;
    }
    
    /**
     * @param authorDao the authorDao to set
     */
    public void setAuthorDao(AuthorDao authorDao) {
        this.authorDao = authorDao;
    }

    @IdeaJdbcTx
    public Page<Product> pageProducts(int curPage, int pageSize, HashMap condition) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        String userRole = curUser.getRole();
        String role = null;
        if(userRole.indexOf(RoleType.SUPER_ADMIN) > -1) {
            role = RoleType.SUPER_ADMIN;
        }else if(userRole.indexOf(RoleType.EVALUATOR_MGR) > -1) {
            role = RoleType.EVALUATOR_MGR;
        }else if(userRole.indexOf(RoleType.EVALUATOR_OPR) > -1){
            role = RoleType.EVALUATOR_OPR;
        }else if(userRole.indexOf(RoleType.LAWYER) > -1){
            role = RoleType.LAWYER;
        }else{
            role = RoleType.NORMAL;
        }
        
        return evaluationDao.pageProducts(curPage, pageSize, role, userId, condition);
    }

    @IdeaJdbcTx
    public Product findProduct(String id) {
        return evaluationDao.findProduct(id);
    }
    
    @IdeaJdbcTx
    public Product findProductById(String id) {
        return IdeaJdbc.find(Product.class, id);
    }

    @IdeaJdbcTx
    public void inviteEvaluation(String id, String userIds) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String contextPath = uc.getRequest().getContextPath();
        if(!contextPath.endsWith("/")) {
            contextPath += "/";
        }
        
        String[] userIdArray = userIds.split(",");
        
        try {
            for(String userId : userIdArray) {
                User user = IdeaJdbc.find(User.class, userId);
                Product product = IdeaJdbc.find(Product.class, id);
                String emailAddr = user.getEmail();
                HtmlEmail email = new HtmlEmail(); 
                
                EmailSetting emailSetting = IdeaJdbc.find(EmailSetting.class, "1");
                
                Date curDate = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String dateStr = sdf.format(curDate);
                String emailContent = "<p>尊敬的评审老师，您好！</p><p></p><p>&nbsp;&nbsp;公司拟采购作品《" + product.getName() + "》的相关音频权利，特邀您进行内容审核，您的意见将成为我们制定购买决策的重要依据！</p><p></p><p>&nbsp;&nbsp;<a href='http://www.euphonymedia.com" + contextPath + "evalogin?productId=" + id + "'>点击此处</a>开始评价，在此感谢您的参与！</p><p></p><p>&nbsp;&nbsp;祝好！</p><p></p><p>评审小组</p><p>" + dateStr + "</p>";
                
                try{
                    EvaluationInvitation evaInvitation = new EvaluationInvitation();
                    evaInvitation.setUserId(userId);
                    evaInvitation.setProductId(id);
                    evaInvitation.setContent(emailContent);
                    evaInvitation.setCreateTime(curDate);
                    evaInvitation.setCreator(curUser.getId());
                    IdeaJdbc.save(evaInvitation);
                }catch(Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException(e);
                }
                
                // 这里是SMTP发送服务器的名字：163的如下："smtp.163.com"  
                email.setHostName(emailSetting.getHostName());  
                email.setSmtpPort(Integer.parseInt(emailSetting.getPort()));
                // 字符编码集的设置  
                email.setCharset("UTF-8");  
                // 收件人的邮箱  
                email.addTo(emailAddr);  
                // 发送人的邮箱  
                email.setFrom(emailSetting.getFromEmail(), emailSetting.getFromName());  
                // 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码  
                email.setAuthentication(emailSetting.getUserName(), emailSetting.getPassword());  
                // 要发送的邮件主题  
                email.setSubject("邀请您评价");  
                
                // 要发送的信息，由于使用了HtmlEmail，可以在邮件内容中使用HTML标签  
                email.setMsg(emailContent);  
                // 发送  
                email.send();  
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    @IdeaJdbcTx
    public Product saveProduct(Product product, String submit) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        if("0".equals(submit)) {
            String name = product.getName();
            if(name == null || "".equals(name.trim())) {
                throw nameRequired();
            }
            
            checkDuplicated(product, product.getId());
            
            Date curTime = new Date();
            
            Author author = product.getAuthor();
            String authorName = author.getName();
            if(StringUtils.isNotEmpty(authorName)) {
                Author existsAuthor = authorDao.queryAuthor(authorName, null);
                if(existsAuthor != null) {
                    product.setAuthorId(existsAuthor.getId());
                }else{
                    author.setCreateTime(curTime);
                    author.setCreator(curUser.getId());
                    author.setModifier(curUser.getId());
                    author.setModifyTime(curTime);
                    
                    IdeaJdbc.save(author);
                    product.setAuthorId(author.getId());
                }
            }
            
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            product.setState(ProductState.DRAFT);
            if(!StringUtils.isEmpty(product.getId())) {
                IdeaJdbc.update(product);
            }else{
                product.setCreateTime(curTime);
                product.setCreator(curUser.getId());
                IdeaJdbc.save(product);
            }
            
            List<ProductSample> samples = product.getSamples();
            for(ProductSample sample : samples) {
                sample.setProductId(product.getId());
                IdeaJdbc.save(sample);
            }
            
            if(product.getLogoUrl() != null) {
                ProductImage prodImg = new ProductImage();
                prodImg.setCreateTime(curTime);
                prodImg.setCreator(curUser.getId());
                prodImg.setFileUrl(product.getLogoUrl());
                prodImg.setModifier(curUser.getId());
                prodImg.setModifyTime(curTime);
                prodImg.setName("封面");
                prodImg.setProductId(product.getId());
                prodImg.setType(ProductImageType.COVER);
                IdeaJdbc.save(prodImg);
            }
            
            List<ProductCopyrightFile> copyrightFiles = product.getCopyrightFiles();
            if(copyrightFiles != null) {
                for(ProductCopyrightFile cpFile : copyrightFiles) {
                    cpFile.setProductId(product.getId());
                    cpFile.setCreatorId(curUser.getId());
                    cpFile.setCreateTime(curTime);
                    String fileUrl = cpFile.getFileUrl();
                    cpFile.setName(getFileNameFromUploadUrl(fileUrl));
                    IdeaJdbc.save(cpFile);
                }
            }
        }else if("1".equals(submit)) {
            String name = product.getName();
            if(name == null || "".equals(name.trim())) {
                throw nameRequired();
            }
            
            checkDuplicated(product, product.getId());
            
            Date curTime = new Date();
            
            Author author = product.getAuthor();
            String authorName = author.getName();
            
            if(StringUtils.isNotEmpty(authorName)) {
                Author existsAuthor = authorDao.queryAuthor(authorName, null);
                if(existsAuthor != null) {
                    product.setAuthorId(existsAuthor.getId());
                }else{
                    author.setCreateTime(curTime);
                    author.setCreator(curUser.getId());
                    author.setModifier(curUser.getId());
                    author.setModifyTime(curTime);
                    
                    IdeaJdbc.save(author);
                    product.setAuthorId(author.getId());
                }
            }
            
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            product.setState(ProductState.APPROVE_WAITING);
            if(StringUtils.isNotEmpty(product.getId())) {
                IdeaJdbc.update(product);
            }else{
                product.setCreateTime(curTime);
                product.setCreator(curUser.getId());
                IdeaJdbc.save(product);
            }
            
            List<ProductSample> samples = product.getSamples();
            for(ProductSample sample : samples) {
                sample.setProductId(product.getId());
                IdeaJdbc.save(sample);
            }
            
            List<ProductCopyrightFile> copyrightFiles = product.getCopyrightFiles();
            if(copyrightFiles != null) {
                for(ProductCopyrightFile cpFile : copyrightFiles) {
                    cpFile.setProductId(product.getId());
                    cpFile.setCreatorId(curUser.getId());
                    cpFile.setCreateTime(curTime);
                    IdeaJdbc.save(cpFile);
                }
            }
            
            Task task = new Task();
            task.setCreateTime(curTime);
            task.setCreator(curUser.getId());
            task.setModifier(curUser.getId());
            task.setModifyTime(curTime);
            task.setRoleId(RoleType.EVALUATOR_MGR);
            task.setState(TaskState.UNREAD);
            task.setTargetId(product.getId());
            task.setTargetType(TaskTargetType.EVALUATION);
            task.setTitle("作品《"+product.getName()+"》已提交申请内容审核，请进行审核。");
            IdeaJdbc.save(task);
        }else{
            String name = product.getName();
            if(name == null || "".equals(name.trim())) {
                throw nameRequired();
            }
            
            checkDuplicated(product, product.getId());
            
            Date curTime = new Date();
            
            Author author = product.getAuthor();
            String authorName = author.getName();
            
            if(StringUtils.isNotEmpty(authorName)) {
                Author existsAuthor = authorDao.queryAuthor(authorName, null);
                if(existsAuthor != null) {
                    product.setAuthorId(existsAuthor.getId());
                }else{
                    author.setCreateTime(curTime);
                    author.setCreator(curUser.getId());
                    author.setModifier(curUser.getId());
                    author.setModifyTime(curTime);
                    
                    IdeaJdbc.save(author);
                    product.setAuthorId(author.getId());
                }
            }
            
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            product.setState(ProductState.DRAFT);
            
            if(StringUtils.isNotEmpty(product.getId())) {
                IdeaJdbc.update(product);
            }else{
                product.setCreateTime(curTime);
                product.setCreator(curUser.getId());
                IdeaJdbc.save(product);
            }
            
            List<ProductSample> samples = product.getSamples();
            for(ProductSample sample : samples) {
                sample.setProductId(product.getId());
                IdeaJdbc.save(sample);
            }
            
            List<ProductCopyrightFile> copyrightFiles = product.getCopyrightFiles();
            for(ProductCopyrightFile cpFile : copyrightFiles) {
                cpFile.setProductId(product.getId());
                cpFile.setCreatorId(curUser.getId());
                cpFile.setCreateTime(curTime);
                IdeaJdbc.save(cpFile);
            }
        }
        
        return product;
    }
    
    private void checkDuplicated(Product product, String id) {
        List<Product> prods = evaluationDao.checkProductDuplicated(product.getName(), id);
        if(prods != null && prods.size() > 0) {
             throw new EvaluationException(EvaluationExceptionCode.PRODUCT_DUPLICATED, "同名作品已存在。");    
        }
        
        if(product.getIsbn() != null && product.getIsbn().trim().length() > 0) {
            prods = evaluationDao.checkIsbnDuplicated(product.getIsbn(), id);
            if(prods != null && prods.size() > 0) {
                 throw new EvaluationException(EvaluationExceptionCode.ISBN_DUPLICATED, "作品ISBN号系统中已存在。");    
            }
        }
    }

    private EvaluationException nameRequired() {
        return new EvaluationException(EvaluationExceptionCode.NAME_REQUIRED, "作品名称不能为空。");
    }

    @IdeaJdbcTx
    public void saveEvaluation(Evaluation eva) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = curUser.getId();
        eva.setUserId(userId);
        eva.setCreator(userId);
        Date curTime = new Date();
        eva.setCreateTime(curTime);
        eva.setModifier(userId);
        eva.setModifyTime(curTime);
        
        IdeaJdbc.save(eva);
        
        evaluationDao.updateEvaluationInvitation(userId, eva.getProductId(), YesOrNo.YES);
        
        IdeaJdbc.update(Product.class, eva.getProductId())
                .setProperty("state", ProductState.EVALUATED)
                .execute();
    }

    @IdeaJdbcTx
    public int passProduct(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        try {
            Product product = IdeaJdbc.find(Product.class, id);
        
            Date curTime = new Date();
            
            if(product == null) {
                throw dataNotFoundException(id);
            }else{
//                if(product.getState().equals(ProductState.APPROVE_WAITING)) {
//                    Task task = new Task();
//                    task.setCreateTime(curTime);
//                    task.setCreator(curUser.getId());
//                    task.setModifier(curUser.getId());
//                    task.setModifyTime(curTime);
//                    task.setRoleId(RoleType.LAWYER);
//                    task.setState(TaskState.UNREAD);
//                    task.setTargetId(product.getId());
//                    task.setTargetType(TaskTargetType.EVALUATION);
//                    task.setTitle("作品《"+product.getName()+"》已申请权属审核，请进行审核。");
//                    IdeaJdbc.save(task);
//                    
//                    return IdeaJdbc.update(Product.class, id)
//                            .setProperty("state", ProductState.CPFILE_APPROVE_WAITING)
//                            .setProperty("modifier", curUser.getId())
//                            .setProperty("modifyTime", curTime)
//                            .execute();
//                }else if(product.getState().equals(ProductState.CPFILE_APPROVE_WAITING)) {
                    Task task = new Task();
                    task.setCreateTime(curTime);
                    task.setCreator(curUser.getId());
                    task.setModifier(curUser.getId());
                    task.setModifyTime(curTime);
                    task.setRoleId(RoleType.EVALUATOR_MGR);
                    task.setState(TaskState.UNREAD);
                    task.setTargetId(product.getId());
                    task.setTargetType(TaskTargetType.EVALUATION);
                    task.setTitle("作品《"+product.getName()+"》已审核通过，请邀请专家评价。");
                    IdeaJdbc.save(task);
                    
                    return IdeaJdbc.update(Product.class, id)
                                .setProperty("state", ProductState.EVALUATE_WAITING)
                                .setProperty("modifier", curUser.getId())
                                .setProperty("modifyTime", curTime)
                                .execute();
//                }else{
//                    return 0;
//                }
            }
        }catch(Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    @IdeaJdbcTx
    public int rejectProduct(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        Product product = IdeaJdbc.find(Product.class, id);
        
        if(product == null) {
            throw dataNotFoundException(id);
        }else{
            Date curTime = new Date();
            
            Task task = new Task();
            task.setCreateTime(curTime);
            task.setCreator(curUser.getId());
            task.setModifier(curUser.getId());
            task.setModifyTime(curTime);
            task.setRoleId(RoleType.EVALUATOR_MGR);
            task.setState(TaskState.UNREAD);
            task.setTargetId(product.getId());
            task.setTargetType(TaskTargetType.EVALUATION);
            task.setTitle("作品《"+product.getName()+"》已被拒绝，请联系评价主管或重新填写相关信息。");
            IdeaJdbc.save(task);
            
            return IdeaJdbc.update(Product.class, id)
                            .setProperty("state", ProductState.APPROVE_REJECT)
                            .setProperty("modifier", curUser.getId())
                            .setProperty("modifyTime", new Date())
                            .execute();
        }
    }
    
    private IdeaDataException dataNotFoundException(String id) {
        return new IdeaDataException(IdeaDataExceptionCode.DATA_NOU_FOUND, String.format("Product[%s] is not found.", id));
    }

    @IdeaJdbcTx
    public int deleteProduct(String id) {
        IdeaJdbc.delete(Product.class, id);
        return 1;
    }

    @IdeaJdbcTx
    public List<Evaluation> listEvaluations(String productId) {
        List<Evaluation> evaluations = evaluationDao.listEvaluations(productId);
        return evaluations;
    }

    @IdeaJdbcTx
    public void finishEvaluation(FinalEvaluation finalEva) {
        String productId = finalEva.getProductId();
        
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        Product product = IdeaJdbc.find(Product.class, productId);
        
        if(product == null) {
            throw dataNotFoundException(productId);
        }else{
            Date curTime = new Date();
            
            //更新作家等级
            String authorId = product.getAuthorId();
            IdeaJdbc.update(Author.class, authorId)
                    .setProperty("famous", finalEva.getAuthorLevel())
                    .execute();
            
            finalEva.setCreator(curUser.getId());
            finalEva.setCreateTime(curTime);
            
            IdeaJdbc.save(finalEva);
            
            IdeaJdbc.update(Product.class, productId)
                    .setProperty("state", ProductState.EVALUATE_FINISH)
                    .execute();
            
            Task task = new Task();
            task.setCreateTime(curTime);
            task.setCreator(curUser.getId());
            task.setModifier(curUser.getId());
            task.setModifyTime(curTime);
            task.setRoleId(RoleType.COPYRIGHT_DIRECTOR);
            task.setState(TaskState.UNREAD);
            task.setTargetId(product.getId());
            task.setTargetType(TaskTargetType.EVALUATION);
            task.setTitle("作品《"+product.getName()+"》已评价完成，请分配可办理的专员。");
            IdeaJdbc.save(task);
        }
        
    }

    @IdeaJdbcTx
    public FinalEvaluation findFinalEvaluation(String productId) {
        FinalEvaluation finalEva = evaluationDao.findFinalEvaluation(productId);
        return finalEva;
    }

    @IdeaJdbcTx
    public Page<Product> pageMyProducts(int curPage, int pageSize, HashMap<String, String> condition) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = curUser.getId();
        
        return evaluationDao.pageProductsByUser(curPage, pageSize, userId, condition);
    }

    @IdeaJdbcTx
    public void batchDeleteProducts(String[] idArray) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = curUser.getId();
        
        evaluationDao.batchDeleteProducts(idArray);
    }

    @IdeaJdbcTx
    public List<ProductCopyrightFile> listProductCopyrightFiles(String productId) {
        return evaluationDao.listProductCopyrightFiles(productId);
    }
    
    private String getFileNameFromUploadUrl(String url) {
        int dirPos = url.lastIndexOf("\\");
        if(dirPos == -1)
            dirPos = url.lastIndexOf("/");
        
        if(dirPos > -1) {
            String fileName = url.substring(dirPos+1);
            int namePos = fileName.indexOf("_");
            if(namePos > -1) {
                return fileName.substring(namePos+1);
            }else{
                return fileName;
            }
        }
        
        return url;
    }

    @IdeaJdbcTx
    public Page<Product> pageExtEvaluationProducts(int curPage,
                                                   int pageSize,
                                                   HashMap<String, String> condition)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = curUser.getId();
        
        return evaluationDao.pageExtEvaluationProductsByUser(curPage, pageSize, userId, condition);
    }

    @IdeaJdbcTx
    public void deleteCopyrightFile(String id) {
        IdeaJdbc.delete(ProductCopyrightFile.class, id);
    }
}
