/**
 * 
 */

package com.ideamoment.emarm.mediares.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductAudio;
import com.ideamoment.emarm.model.ProductImage;
import com.ideamoment.emarm.model.enumeration.ProductImageType;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 */
@Component
public class MediaResourceDao {

    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      HashMap<String, String> condition)
    {
        String sql = "SELECT " + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name "
                     + " FROM "
                     + " t_product p "
                     + " LEFT JOIN t_author a "
                     + " ON p.C_AUTHOR_ID = a.C_ID "
                     + " LEFT JOIN t_subject s "
                     + " ON s.C_ID = p.C_SUBJECT_ID "
                     + " WHERE p.C_TYPE = :type "
                     + " AND p.C_IN_MEDIARES = " + YesOrNo.YES
                     + " AND p.C_STATE in (:states) ";

        if (condition.get("productName") != null) {
            sql += " AND p.C_NAME like :productName ";
        }
        if (condition.get("authorName") != null) {
            sql += " AND a.C_NAME like :authorName ";
        }
        if (condition.get("isbn") != null) {
            sql += " AND p.C_ISBN = :isbn ";
        }
        if (condition.get("subject") != null) {
            sql += " AND p.C_SUBJECT_ID = :subject ";
        }
        if (condition.get("publishState") != null) {
            sql += " AND p.C_PUBLISH_STATE like :publishState ";
        }
        if (condition.get("state") != null) {
            sql += " AND p.C_STATE like :state ";
        }

        sql += " ORDER BY p.C_MODIFYTIME DESC ";

        String[] states = new String[] { ProductState.MK,
                ProductState.MK_FINISH, ProductState.SALED,
                ProductState.MK_WAITING, ProductState.RESERVED,
                ProductState.CP_CONTRACT_FINISH };

        Query query = IdeaJdbc.query(sql).setParameter("type", ProductType.TEXT)
                .setParameter("states", states).populate("author", "a")
                .populate("subject", "s");

        if (condition.get("productName") != null) {
            query.setParameter("productName",
                               "%" + condition.get("productName") + "%");
        }
        if (condition.get("authorName") != null) {
            query.setParameter("authorName",
                               "%" + condition.get("authorName") + "%");
        }
        if (condition.get("isbn") != null) {
            query.setParameter("isbn", condition.get("isbn"));
        }
        if (condition.get("subject") != null) {
            query.setParameter("subject", condition.get("subject"));
        }
        if (condition.get("publishState") != null) {
            query.setParameter("publishState", condition.get("publishState"));
        }
        if (condition.get("state") != null) {
            query.setParameter("state", condition.get("state"));
        }

        Page<Product> products = query.pageTo(Product.class, "p", curPage,
                                              pageSize);

        return products;
    }

    public List<ProductImage> listProductImages(String productId) {
        String sql = "SELECT * " + "FROM T_PRODUCT_IMAGE "
                     + "WHERE C_PRODUCT_ID = :productId";
        return IdeaJdbc.query(sql).setParameter("productId", productId)
                .listTo(ProductImage.class);
    }

    public List<ProductAudio> listProductAudioes(String productId) {
        String sql = "SELECT * " + "FROM T_PRODUCT_AUDIO "
                     + "WHERE C_PRODUCT_ID = :productId";
        return IdeaJdbc.query(sql).setParameter("productId", productId)
                .listTo(ProductAudio.class);
    }

    public Page<Product> pagePreProducts(int curPage,
                                         int pageSize,
                                         HashMap<String, String> condition)
    {
        String sql = "SELECT " + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name "
                     + " FROM "
                     + " t_product p "
                     + " LEFT JOIN t_author a "
                     + " ON p.C_AUTHOR_ID = a.C_ID "
                     + " LEFT JOIN t_subject s "
                     + " ON s.C_ID = p.C_SUBJECT_ID "
                     + " WHERE p.C_TYPE = :type "
                     + " AND p.C_IN_MEDIARES = " + YesOrNo.NO
                     + " AND p.C_STATE in (:states) ";

        if (condition.get("productName") != null) {
            sql += " AND p.C_NAME like :productName ";
        }
        if (condition.get("authorName") != null) {
            sql += " AND a.C_NAME like :authorName ";
        }
        if (condition.get("isbn") != null) {
            sql += " AND p.C_ISBN = :isbn ";
        }
        if (condition.get("subject") != null) {
            sql += " AND p.C_SUBJECT_ID = :subject ";
        }
        if (condition.get("publishState") != null) {
            sql += " AND p.C_PUBLISH_STATE like :publishState ";
        }
        if (condition.get("state") != null) {
            sql += " AND p.C_STATE like :state ";
        }

        sql += " ORDER BY p.C_MODIFYTIME DESC ";

        String[] states = new String[] { ProductState.MK,
                ProductState.MK_FINISH, 
                ProductState.MK_WAITING, ProductState.RESERVED,
                ProductState.CP_CONTRACT_FINISH };

        Query query = IdeaJdbc.query(sql).setParameter("type", ProductType.TEXT)
                .setParameter("states", states).populate("author", "a")
                .populate("subject", "s");

        if (condition.get("productName") != null) {
            query.setParameter("productName",
                               "%" + condition.get("productName") + "%");
        }
        if (condition.get("authorName") != null) {
            query.setParameter("authorName",
                               "%" + condition.get("authorName") + "%");
        }
        if (condition.get("isbn") != null) {
            query.setParameter("isbn", condition.get("isbn"));
        }
        if (condition.get("subject") != null) {
            query.setParameter("subject", condition.get("subject"));
        }
        if (condition.get("publishState") != null) {
            query.setParameter("publishState", condition.get("publishState"));
        }
        if (condition.get("state") != null) {
            query.setParameter("state", condition.get("state"));
        }

        Page<Product> products = query.pageTo(Product.class, "p", curPage,
                                              pageSize);

        return products;
    }

    public ProductImage findOldProductImage(String productId) {
        String sql = "SELECT * FROM T_PRODUCT_IMAGE WHERE C_PRODUCT_ID = :productId and C_TYPE = :type";
        return (ProductImage)IdeaJdbc.query(sql)
                                        .setParameter("productId", productId)
                                        .setParameter("type", ProductImageType.COVER)
                                        .uniqueTo(ProductImage.class);
    }

}
