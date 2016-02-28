/**
 * 
 */

package com.ideamoment.emarm.product.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.ideajdbc.IdeaJdbc;
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
}
