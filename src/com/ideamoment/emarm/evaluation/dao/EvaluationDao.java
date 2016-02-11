/**
 * 
 */
package com.ideamoment.emarm.evaluation.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Evaluation;
import com.ideamoment.emarm.model.FinalEvaluation;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.model.enumeration.RoleType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 *
 */
@Component
public class EvaluationDao {

    public Page<Product> pageProducts(int curPage, int pageSize, String role, String userId, HashMap condition) {
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
                   + " AND p.C_STATE in (:states) ";
        
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
        
        String[] states = new String[]{
                ProductState.APPROVE_WAITING,
                ProductState.APPROVE_REJECT,
                ProductState.EVALUATE_FINISH,
                ProductState.EVALUATE_WAITING,
                ProductState.EVALUATED
        };
        
        Query query = IdeaJdbc.query(sql)
                                .setParameter("type", ProductType.TEXT)
                                .setParameter("states", states)
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
    
    public ProductSample queryProductSample(String productId, String fileUrl) {
        String sql = "select * from t_product_sample where c_product_id = :productId and c_file_url = :fileUrl";
        
        return (ProductSample)IdeaJdbc.query(sql)
                                        .setParameter("productId", productId)
                                        .setParameter("fileUrl", fileUrl)
                                        .uniqueTo(ProductSample.class);
    }

    public List<Evaluation> listEvaluations(String productId) {
        String sql = "SELECT "
                   + "t.C_ID AS t$id, "
                   + "t.C_PRODUCT_ID AS t$productId, "
                   + "t.C_STORY_FRAME AS t$storyFrame, "
                   + "t.C_STORY_TEXT AS t$storyText, "
                   + "t.C_STORY_ROLE AS t$storyRole, "
                   + "t.C_STORY_TARGET AS t$storyTarget, "
                   + "t.C_STORY_SUGGEST AS t$storySuggest, "
                   + "t.C_MAKE_AUDIO_EDIT AS t$storyFrame, "
                   + "t.C_MAKE_PLAY_TYPE AS t$storyText, "
                   + "t.C_MAKE_PLAY_STYLE AS t$storyRole, "
                   + "t.C_MAKE_SUGGEST AS t$storySuggest, "
                   + "u.C_ID AS u$id, "
                   + "u.C_NAME AS u$name "
                   + "FROM " 
                   + "T_EVALUATION t "
                   + "LEFT JOIN T_USER u "
                   + "ON t.C_USER_ID = u.C_ID "
                   + "WHERE t.C_PRODUCT_ID = :productId";
        
        List<Evaluation> evaluations = IdeaJdbc.query(sql)
                                                .setParameter("productId", productId)
                                                .populate("user", "u")
                                                .listTo(Evaluation.class, "t");
        
        return evaluations;
    }

    public FinalEvaluation findFinalEvaluation(String productId) {
        
        String sql = "SELECT fe.C_ID as fe$id, "
                   + "fe.C_PRODUCT_ID as fe$productId, "
                   + "fe.C_REF_PRICE as fe$refPrice, "
                   + "fe.C_PRODUCT_LEVEL as fe$productLevel, "
                   + "fe.C_AUTHOR_LEVEL as fe$authorLevel, "
                   + "fe.C_STORY_VALUE as fe$storyValue, "
                   + "fe.C_MAKE_VALUE as fe$makeValue, "
                   + "fe.C_ONLY_WEB_CAST as fe$onlyWebCast, "
                   + "fe.C_HOT_SUBJECT as fe$hotSubject, "
                   + "u.C_ID as u$id, "
                   + "u.C_NAME as u$name "
                   + "FROM T_FINAL_EVALUATION fe, T_USER u WHERE fe.C_PRODUCT_ID = :productId and fe.C_CREATOR = u.C_ID";
        
        List<FinalEvaluation> finalEvas = IdeaJdbc.query(sql)
                                                   .setParameter("productId", productId)
                                                   .populate("createUser", "u")
                                                   .listTo(FinalEvaluation.class, "fe");
        
        if(finalEvas != null && finalEvas.size() > 0) {
            return finalEvas.get(0);
        }else{
            return null;
        }
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
                + " AND p.C_TYPE = :type "
                + " AND p.C_STATE in (:states)";
        
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
        
        String[] states = new String[]{
                ProductState.DRAFT,
                ProductState.APPROVE_WAITING,
                ProductState.APPROVE_REJECT,
                ProductState.EVALUATE_FINISH,
                ProductState.EVALUATE_WAITING,
                ProductState.EVALUATED
        };
        
        Query query = IdeaJdbc.query(sql)
                              .setParameter("userId", userId)
                              .setParameter("type", ProductType.TEXT)
                              .setParameter("states", states)
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
}
