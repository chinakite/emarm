/**
 * 
 */

package com.ideamoment.emarm.product.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 */
@Component
public class ProductDao {

    public List<Product> listProducts(String[] idArray) {
        String sql = "SELECT " + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " p.C_ISBN AS p$isbn,"
                     + " p.C_SUMMARY AS p$summary,"
                     + " p.C_WORD_COUNT AS p$wordCount,"
                     + " p.C_PRESS AS p$press,"
                     + " p.C_WEBSITE AS p$website,"
                     + " p.C_ISBN AS p$isbn,"
                     + " p.C_HAS_AUDIO AS p$hasAudio,"
                     + " p.C_AUDIO_COPYRIGHT AS p$audioCopyright,"
                     + " p.C_AUDIO_DESC AS p$audioDesc,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " a.C_PSEUDONYM AS a$pseudonym,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name, "
                     + " sp.C_ID as sp$id, "
                     + " sp.C_FILE_URL as sp$fileUrl "
                     + " FROM "
                     + " t_product p "
                     + " LEFT JOIN t_author a "
                     + " ON p.C_AUTHOR_ID = a.C_ID "
                     + " LEFT JOIN t_subject s "
                     + " ON s.C_ID = p.C_SUBJECT_ID "
                     + " LEFT JOIN t_product_sample sp "
                     + " ON sp.C_PRODUCT_ID = p.C_ID "
                     + " WHERE p.C_ID in (:ids) "
                     + " ORDER BY p.C_MODIFYTIME DESC ";

        List<Product> products = IdeaJdbc.query(sql)
                .setParameter("ids", idArray).populate("author", "a")
                .populate("subject", "s").populate("samples", "sp")
                .listTo(Product.class, "p");

        return products;
    }

    public List<Product> listLastProducts() {
        String sql = "SELECT " + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " p.C_ISBN AS p$isbn,"
                     + " p.C_SUMMARY AS p$summary,"
                     + " p.C_WORD_COUNT AS p$wordCount,"
                     + " p.C_PRESS AS p$press,"
                     + " p.C_WEBSITE AS p$website,"
                     + " p.C_ISBN AS p$isbn,"
                     + " p.C_HAS_AUDIO AS p$hasAudio,"
                     + " p.C_AUDIO_COPYRIGHT AS p$audioCopyright,"
                     + " p.C_AUDIO_DESC AS p$audioDesc,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " a.C_PSEUDONYM AS a$pseudonym,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name, "
                     + " sp.C_ID as sp$id, "
                     + " sp.C_FILE_URL as sp$fileUrl "
                     + " FROM "
                     + " t_product p "
                     + " LEFT JOIN t_author a "
                     + " ON p.C_AUTHOR_ID = a.C_ID "
                     + " LEFT JOIN t_subject s "
                     + " ON s.C_ID = p.C_SUBJECT_ID "
                     + " LEFT JOIN t_product_sample sp "
                     + " ON sp.C_PRODUCT_ID = p.C_ID "
                     + " WHERE p.C_STATE <> :state "
                     + " ORDER BY p.C_MODIFYTIME DESC "
                     + " limit 0,5";
        
        List<Product> products = IdeaJdbc.query(sql)
                .setParameter("state", ProductState.DRAFT)
                .populate("author", "a")
                .populate("subject", "s")
                .populate("samples", "sp")
                .listTo(Product.class, "p");

        return products;
    }

    public List<Product> checkIsbnDuplicated(String isbn, String id) {
        String sql = "select C_ID from T_PRODUCT where C_ISBN = :isbn ";
        if(id != null) {
            sql += " AND C_ID <> :id";
        }
        Query query = IdeaJdbc.query(sql).setParameter("isbn", isbn);
        if(id != null) {
            query.setParameter("id", id);
        }
        return query.listTo(Product.class);
    }

    public List<Product> checkProductDuplicated(String name, String id) {
        String sql = "select C_ID from T_PRODUCT where C_NAME = :name ";
        if(id != null) {
            sql += " AND C_ID <> :id";
        }
        Query query = IdeaJdbc.query(sql).setParameter("name", name);
        if(id != null) {
            query.setParameter("id", id);
        }
        return query.listTo(Product.class);
    }
    
    public Page<Product> pageProductsByUser(int curPage,
                                            int pageSize,
                                            String userId, 
                                            HashMap<String, String> condition)
    {
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
                + " WHERE p.C_CREATOR = :userId "
                + " AND p.C_TYPE = :type ";
        
        if(condition.get("productName") != null) {
            sql += " AND p.C_NAME like :productName ";
        }
        if(condition.get("authorName") != null) {
            sql += " AND a.C_NAME like :authorName ";
        }
        if(condition.get("isbn") != null) {
            sql += " AND p.C_ISBN = :isbn ";
        }
        if(condition.get("subject") != null) {
            sql += " AND p.C_SUBJECT_ID = :subject ";
        }
        if(condition.get("publishState") != null) {
            sql += " AND p.C_PUBLISH_STATE like :publishState ";
        }
        if(condition.get("state") != null) {
            sql += " AND p.C_STATE like :state ";
        }
        
        sql += " ORDER BY p.C_MODIFYTIME DESC ";
        
        Query query = IdeaJdbc.query(sql)
                              .setParameter("userId", userId)
                              .setParameter("type", ProductType.TEXT)
                              .populate("author", "a")
                              .populate("subject", "s");
        
        if(condition.get("productName") != null) {
            query.setParameter("productName", "%"+condition.get("productName")+"%");
        }
        if(condition.get("authorName") != null) {
            query.setParameter("authorName", "%"+condition.get("authorName")+"%");
        }
        if(condition.get("isbn") != null) {
            query.setParameter("isbn", condition.get("isbn"));
        }
        if(condition.get("subject") != null) {
            query.setParameter("subject", condition.get("subject"));
        }
        if(condition.get("publishState") != null) {
            query.setParameter("publishState", condition.get("publishState"));
        }
        if(condition.get("state") != null) {
            query.setParameter("state", condition.get("state"));
        }
        
        Page<Product> products = query.pageTo(Product.class, "p", curPage, pageSize);
        
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
                   +     " p.C_PRESS AS p$press,"
                   +     " p.C_WEBSITE AS p$website,"
                   +     " p.C_ISBN AS p$isbn,"
                   +     " p.C_HAS_AUDIO AS p$hasAudio,"
                   +     " p.C_AUDIO_COPYRIGHT AS p$audioCopyright,"
                   +     " p.C_AUDIO_DESC AS p$audioDesc,"
                   +     " p.C_LOGO_URL AS p$logoUrl,"
                   +     " a.C_ID AS a$id,"
                   +     " a.C_NAME AS a$name,"
                   +     " a.C_PSEUDONYM AS a$pseudonym,"
                   +     " s.C_ID AS s$id, "
                   +     " s.C_NAME AS s$name, "
                   +     " sp.C_ID as sp$id, "
                   +     " sp.C_FILE_URL as sp$fileUrl "
                   + " FROM "
                   +     " t_product p "
                   +   " LEFT JOIN t_author a "
                   +     " ON p.C_AUTHOR_ID = a.C_ID "
                   +   " LEFT JOIN t_subject s "
                   +     " ON s.C_ID = p.C_SUBJECT_ID "
                   +   " LEFT JOIN t_product_sample sp "
                   +     " ON sp.C_PRODUCT_ID = p.C_ID "
                   + " WHERE p.C_ID = :id "
                   + " ORDER BY p.C_MODIFYTIME DESC ";
        
        List<Product> products = IdeaJdbc.query(sql)
                                            .setParameter("id", id)
                                            .populate("author", "a")
                                            .populate("subject", "s")
                                            .populate("samples", "sp")
                                            .listTo(Product.class, "p");
        
        if(products != null && products.size() > 0) {
            return products.get(0);
        }else{
            return null;
        }
    }
}
