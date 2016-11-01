/**
 * 
 */
package com.ideamoment.emarm.product.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.author.dao.AuthorDao;
import com.ideamoment.emarm.evaluation.EvaluationException;
import com.ideamoment.emarm.evaluation.EvaluationExceptionCode;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductCopyrightFile;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.product.dao.ProductDao;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;
    
    @Autowired
    private AuthorDao authorDao;
    
    /**
     * @return the productDao
     */
    public ProductDao getProductDao() {
        return productDao;
    }
    
    /**
     * @param productDao the productDao to set
     */
    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
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
    public List<Product> listProducts(String ids) {
        String[] idArray = ids.split(",");
        return productDao.listProducts(idArray);
    }

    @IdeaJdbcTx
    public List<Product> listLastProducts() {
        return productDao.listLastProducts();
    }
    
    @IdeaJdbcTx
    public Product findProductById(String id) {
        return IdeaJdbc.find(Product.class, id);
    }
    
    @IdeaJdbcTx
    public Product saveProduct(Product product, String submit, boolean withoutEva) {
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
            if(withoutEva) {
                product.setState(ProductState.NEW_WITHOUT_EVA);
            }else{
                product.setState(ProductState.DRAFT);
            }
            
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
            if(withoutEva) {
                product.setState(ProductState.NEW_WITHOUT_EVA);
            }else{
                product.setState(ProductState.APPROVE_WAITING);
            }
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
            if(withoutEva) {
                product.setState(ProductState.NEW_WITHOUT_EVA);
            }else{
                product.setState(ProductState.DRAFT);
            }
            
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
    
    private void checkDuplicated(Product product, String id) {
        List<Product> prods = productDao.checkProductDuplicated(product.getName(), id);
        if(prods != null && prods.size() > 0) {
             throw new EvaluationException(EvaluationExceptionCode.PRODUCT_DUPLICATED, "同名作品已存在。");    
        }
        
        if(product.getIsbn() != null && product.getIsbn().trim().length() > 0) {
            prods = productDao.checkIsbnDuplicated(product.getIsbn(), id);
            if(prods != null && prods.size() > 0) {
                 throw new EvaluationException(EvaluationExceptionCode.ISBN_DUPLICATED, "作品ISBN号系统中已存在。");    
            }
        }
    }

    private EvaluationException nameRequired() {
        return new EvaluationException(EvaluationExceptionCode.NAME_REQUIRED, "作品名称不能为空。");
    }

    @IdeaJdbcTx
    public Page<Product> pageMyProducts(int curPage, int pageSize, HashMap<String, String> condition) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        return productDao.pageProductsByUser(curPage,
                                             pageSize,
                                             curUser.getId(), 
                                             condition);
    }

    @IdeaJdbcTx
    public Product findProduct(String id) {
        return productDao.findProduct(id);
    }

    @IdeaJdbcTx
    public Long countProductCurMonth() {
        DateTime curDate = new DateTime();
        int year = curDate.getYear();
        int month = curDate.getMonthOfYear();
        
        DateTime startDate = new DateTime(year, month, 1, 0, 0, 0, 0);
        DateTime endDate = new DateTime(year, month+1, 1, 0, 0, 0, 0);
        
        return productDao.countProductByTime(startDate.toDate(), endDate.toDate());
    }

    @IdeaJdbcTx
    public List<Product> quickQuery(String name) {
        return productDao.quickQuery(name);
    }

    @IdeaJdbcTx
    public void uploadCopyrightFile(String productId, String fileUrl) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        ProductCopyrightFile copyrightFile = new ProductCopyrightFile();
        copyrightFile.setFileUrl(fileUrl);
        copyrightFile.setCreateTime(new Date());
        copyrightFile.setCreatorId(curUser.getId());
        copyrightFile.setName(getFileNameFromUploadUrl(fileUrl));
        copyrightFile.setProductId(productId);
        
        IdeaJdbc.save(copyrightFile);
    }
    
    private String getFileNameFromUploadUrl(String url) {
        int dirPos = url.lastIndexOf("\\");
        if(dirPos == -1)
            dirPos = url.lastIndexOf("/");
        
        if(dirPos > -1) {
            String fileName = url.substring(dirPos+1);
            int namePos = fileName.lastIndexOf("_");
            int extNamePos = fileName.indexOf(".");
            
            String extName = "";
            if(extNamePos > -1) {
            	extName = fileName.substring(extNamePos);
            }
            
            if(namePos > -1) {
                return fileName.substring(0, namePos) + extName;
            }else{
                return fileName + extName;
            }
        }
        
        return url;
    }
}
