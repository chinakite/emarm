/**
 * 
 */
package com.ideamoment.emarm.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.product.dao.ProductDao;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class ProductService {
    @Autowired
    private ProductDao productDao;
    
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

    @IdeaJdbcTx
    public List<Product> listProducts(String ids) {
        String[] idArray = ids.split(",");
        return productDao.listProducts(idArray);
    }
    
    
}
