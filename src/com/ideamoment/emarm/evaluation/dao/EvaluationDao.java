/**
 * 
 */
package com.ideamoment.emarm.evaluation.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;

/**
 * @author Chinakite
 *
 */
@Component
public class EvaluationDao {

    public Page<Product> pageProducts(int curPage, int pageSize) {
        String sql = "SELECT "
                   +     " p.C_ID AS p$id,"
                   +     " p.C_NAME AS p$name,"
                   +     " p.C_PUBLISH_STATE AS p$publishState,"
                   +     " p.C_PUBLISH_YEAR AS p$publishYear,"
                   +     " p.C_FINISH_YEAR AS p$finishYear,"
                   +     " p.C_STATE AS p$state,"
                   +     " a.C_ID AS a$id,"
                   +     " a.C_NAME AS a$name,"
                   +     " s.C_ID AS s$id, "
                   +     " s.C_NAME AS s$name "
                   + " FROM "
                   +     " t_product p "
                   +   " LEFT JOIN t_author a "
                   +     " ON p.C_AUTHOR_ID = a.C_ID "
                   +   " LEFT JOIN t_subject s "
                   +     " ON s.C_ID = p.C_SUBJECT_ID "
                   + " WHERE p.C_TYPE = :type "
                   + " ORDER BY p.C_MODIFYTIME DESC ";
        
        Page<Product> products = IdeaJdbc.query(sql)
                                            .setParameter("type", ProductType.TEXT)
                                            .populate("author", "a")
                                            .populate("subject", "s")
                                            .pageTo(Product.class, "p", curPage, pageSize);
                            
        return products;
    }

    public Product findProduct(String id) {
        String sql = "SELECT "
                   +     " p.C_ID AS p$id,"
                   +     " p.C_NAME AS p$name,"
                   +     " p.C_PUBLISH_STATE AS p$publishState,"
                   +     " p.C_PUBLISH_YEAR AS p$publishYear,"
                   +     " p.C_FINISH_YEAR AS p$finishYear,"
                   +     " p.C_STATE AS p$state,"
                   +     " p.C_ISBN AS p$isbn,"
                   +     " p.C_SUMMARY AS p$summary,"
                   +     " p.C_WORD_COUNT AS p$wordCount,"
                   +     " a.C_ID AS a$id,"
                   +     " a.C_NAME AS a$name,"
                   +     " a.C_PSEUDONYM AS a$pseudonym,"
                   +     " s.C_ID AS s$id, "
                   +     " s.C_NAME AS s$name "
                   + " FROM "
                   +     " t_product p "
                   +   " LEFT JOIN t_author a "
                   +     " ON p.C_AUTHOR_ID = a.C_ID "
                   +   " LEFT JOIN t_subject s "
                   +     " ON s.C_ID = p.C_SUBJECT_ID "
                   + " WHERE p.C_ID = :id "
                   + " ORDER BY p.C_MODIFYTIME DESC ";
        
        List<Product> products = IdeaJdbc.query(sql)
                                            .setParameter("id", id)
                                            .populate("author", "a")
                                            .populate("subject", "s")
                                            .listTo(Product.class, "p");
        
        if(products != null && products.size() > 0) {
            return products.get(0);
        }else{
            return null;
        }
    }
    
    public ProductSample queryProductSample(String productId, String fileUrl) {
        String sql = "select * from t_product_sample where c_product_id = :productId and c_file_url = :fileUrl";
        
        return (ProductSample)IdeaJdbc.query(sql)
                                        .setParameter("productId", productId)
                                        .setParameter("fileUrl", fileUrl)
                                        .uniqueTo(ProductSample.class);
    }
}
