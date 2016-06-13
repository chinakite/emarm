/**
 * 
 */
package com.ideamoment.emarm.reserved.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductReservedInfo;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.reserved.dao.ReservedDao;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class ReservedService {
    @Autowired
    private ReservedDao reservedDao;

    
    /**
     * @return the reservedDao
     */
    public ReservedDao getReservedDao() {
        return reservedDao;
    }

    
    /**
     * @param reservedDao the reservedDao to set
     */
    public void setReservedDao(ReservedDao reservedDao) {
        this.reservedDao = reservedDao;
    }

    @IdeaJdbcTx
    public List<Product> listReservedProducts() {
        List<String> ids = reservedDao.listCanBeReservedProductIds();
        
        if(ids == null || ids.size() == 0) {
            return new ArrayList();
        }
        
        return reservedDao.listReservedProducts(ids);
    }


    @IdeaJdbcTx
    public void reservedProduct(String id, String desc) {
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = optUser.getId();
        
        ProductReservedInfo pri = new ProductReservedInfo();
        pri.setCreateTime(new Date());
        pri.setCreator(userId);
        pri.setModifier(userId);
        pri.setModifyTime(new Date());
        pri.setProductId(id);
        pri.setDesc(desc);
        pri.setState("0");
        
        IdeaJdbc.save(pri);
        
        IdeaJdbc.update(Product.class, id)
                .setProperty("state", ProductState.RESERVED)
                .execute();
    }


    @IdeaJdbcTx
    public List<Product> listToMakeProductsWithoutReserved() {
        return reservedDao.listToMakeProductsWithoutReserved();
    }

    @IdeaJdbcTx
    public void withoutReservedToMake() {
        List<Product> products = reservedDao.listToMakeProductsWithoutReserved();
        for(Product prod : products) {
            prod.setState(ProductState.MK_WAITING);
            IdeaJdbc.update(prod);
        }
    }
    
    @IdeaJdbcTx
    public void reservedToMake() {
        List<Product> products = reservedDao.listReservedToMakeProducts();
        for(Product prod : products) {
            prod.setState(ProductState.MK_WAITING);
            IdeaJdbc.update(prod);
        }
    }
}
