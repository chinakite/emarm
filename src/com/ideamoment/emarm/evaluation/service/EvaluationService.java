/**
 * 
 */
package com.ideamoment.emarm.evaluation.service;

import java.util.Date;
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
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
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
    public Page<Product> pageProducts(int curPage, int pageSize) {
        return evaluationDao.pageProducts(curPage, pageSize);
    }

    @IdeaJdbcTx
    public Product findProduct(String id) {
        return evaluationDao.findProduct(id);
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
                email.setMsg("<p>请您评价：</p><a href='http://localhost:8080" + contextPath + "evalogin?productId=" + id + "'>侯卫东官场笔记</a>");  
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
            
            product.setCreateTime(curTime);
            product.setCreator(curUser.getId());
            product.setModifier(curUser.getId());
            product.setModifyTime(curTime);
            
            product.setType(ProductType.TEXT);
            product.setState(ProductState.DRAFT);
            
            IdeaJdbc.save(product);
            
            List<ProductSample> samples = product.getSamples();
            for(ProductSample sample : samples) {
                sample.setProductId(product.getId());
                IdeaJdbc.save(sample);
            }
            
        }
        
        return null;
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
}
