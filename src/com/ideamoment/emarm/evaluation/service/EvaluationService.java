/**
 * 
 */
package com.ideamoment.emarm.evaluation.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.author.dao.AuthorDao;
import com.ideamoment.emarm.evaluation.EvaluationException;
import com.ideamoment.emarm.evaluation.EvaluationExceptionCode;
import com.ideamoment.emarm.evaluation.dao.EvaluationDao;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.Evaluation;
import com.ideamoment.emarm.model.FinalEvaluation;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.model.enumeration.RoleType;
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
                
                // 这里是SMTP发送服务器的名字：163的如下："smtp.163.com"  
                email.setHostName("smtp.163.com");  
                // 字符编码集的设置  
                email.setCharset("UTF-8");  
                // 收件人的邮箱  
                email.addTo(emailAddr);  
                // 发送人的邮箱  
                email.setFrom("piaostudio@163.com", "悦库时光");  
                // 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码  
                email.setAuthentication("piaostudio", "kn4944428");  
                // 要发送的邮件主题  
                email.setSubject("邀请您评价");  
                // 要发送的信息，由于使用了HtmlEmail，可以在邮件内容中使用HTML标签  
                email.setMsg("<p>请您评价：</p><a href='http://www.6wanr.com" + contextPath + "evalogin?productId=" + id + "'>" + product.getName() + "</a>");  
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
        
        if("1".equals(submit)) {
            String name = product.getName();
            if(name == null || "".equals(name.trim())) {
                throw nameRequired();
            }
            
            Date curTime = new Date();
            
            Author author = product.getAuthor();
            String authorName = author.getName();
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
            
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            product.setState(ProductState.APPROVE_WAITING);
            
            if(product.getId() != null) {
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
        }else if("2".equals(submit)) {
            String name = product.getName();
            if(name == null || "".equals(name.trim())) {
                throw nameRequired();
            }
            
            Date curTime = new Date();
            
            Author author = product.getAuthor();
            String authorName = author.getName();
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
            
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            
            if(product.getId() != null) {
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
        }else{
            String name = product.getName();
            if(name == null || "".equals(name.trim())) {
                throw nameRequired();
            }
            
            Date curTime = new Date();
            
            Author author = product.getAuthor();
            String authorName = author.getName();
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
            
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            product.setState(ProductState.DRAFT);
            
            if(product.getId() != null) {
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
            
        }
        
        return product;
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
        
        IdeaJdbc.update(Product.class, eva.getProductId())
                .setProperty("state", ProductState.EVALUATED)
                .execute();
    }

    @IdeaJdbcTx
    public int passProduct(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        Product product = IdeaJdbc.find(Product.class, id);
        
        if(product == null) {
            throw dataNotFoundException(id);
        }else{
            return IdeaJdbc.update(Product.class, id)
                            .setProperty("state", ProductState.EVALUATE_WAITING)
                            .setProperty("modifier", curUser.getId())
                            .setProperty("modifyTime", new Date())
                            .execute();
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
            //更新作家等级
            String authorId = product.getAuthorId();
            IdeaJdbc.update(Author.class, authorId)
                    .setProperty("famous", finalEva.getAuthorLevel())
                    .execute();
            
            finalEva.setCreator(curUser.getId());
            finalEva.setCreateTime(new Date());
            
            IdeaJdbc.save(finalEva);
            
            IdeaJdbc.update(Product.class, productId)
                    .setProperty("state", ProductState.EVALUATE_FINISH)
                    .execute();
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
}
