/**
 * 
 */
package com.ideamoment.emarm.copyright.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.CopyrightContract;
import com.ideamoment.emarm.model.CopyrightContractAudit;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 *
 */
@Component
public class CopyrightDao {

    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      String role,
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
                +   " LEFT JOIN t_copyright_ctrt_prod ccp "
                +     " ON p.C_ID = ccp.C_PRODUCT_ID "
                +   " LEFT JOIN t_copyright_contract cc "
                +     " ON cc.C_ID = ccp.C_CONTRACT_ID "
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
         if(condition.get("auditState") != null) {
             sql += " AND p.C_PUBLISH_STATE = :auditState ";
         }
         if(condition.get("state") != null) {
             sql += " AND p.C_STATE = :state ";
         }
         
         sql += " ORDER BY p.C_MODIFYTIME DESC ";
         
         String[] states = new String[]{
                 ProductState.EVALUATE_FINISH,
                 ProductState.CP_CONTRACT_INFLOW,
                 ProductState.CP_CONTRACT_FINISH
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
    
    public void deleteContractProduct(String contractId) {
        String sql = "delete from T_COPYRIGHT_CTRT_PROD where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql)
                .setParameter("contractId", contractId)
                .execute();
    }

    public Page<CopyrightContract> pageMyContracts(int curPage,
                                                   int pageSize,
                                                   String userId,
                                                   HashMap<String, String> condition)
    {
        String sql = "SELECT C_ID,"
                   + " C_CODE,"
                   + " C_OWNER,"
                   + " C_BUYER_CONTACT,"
                   + " C_PRIVILEGES,"
                   + " C_PRIVILEGE_TYPE,"
                   + " C_PRIVILEGE_RANGE,"
                   + " C_PRIVILEGE_DEADLINE,"
                   + " C_AUDIT_STATE "
                   + "FROM t_copyright_contract cc "
                   + "WHERE cc.C_CREATOR = :userId ";
        
        if(condition.get("code") != null) {
            sql += " AND C_CODE = :code ";
        }
        if(condition.get("owner") != null) {
            sql += " AND C_OWNER like :owner ";
        }
        if(condition.get("auditState") != null) {
            sql += " AND C_AUDIT_STATE = :auditState ";
        }
        
        Query query = IdeaJdbc.query(sql).setParameter("userId", userId);
        
        if(condition.get("code") != null) {
            query.setParameter("code", condition.get("code"));
        }
        if(condition.get("owner") != null) {
            query.setParameter("owner", "%" + condition.get("owner") + "%");
        }
        if(condition.get("auditState") != null) {
            query.setParameter("auditState", condition.get("auditState"));
        }
        
        sql += "ORDER BY cc.C_MODIFYTIME DESC";
        
        Page<CopyrightContract> contracts = query.pageTo(CopyrightContract.class, curPage, pageSize);
        
        return contracts;
    }

    public String queryMaxContractCode(String prefix) {
        String sql = "select C_CODE from T_COPYRIGHT_CONTRACT where C_CODE like :code order by C_CODE desc limit 1,1";
        String code = (String)IdeaJdbc.query(sql)
                                        .setParameter("code", prefix+"%")
                                        .uniqueValue();
        
        return code;
    }

    public Page<CopyrightContract> pageAuditContracts(int curPage,
                                                      int pageSize,
                                                      List<String> auditStates,
                                                      HashMap<String, String> condition)
    {
        String sql = "SELECT C_ID,"
                    + " C_CODE,"
                    + " C_OWNER,"
                    + " C_BUYER_CONTACT,"
                    + " C_PRIVILEGES,"
                    + " C_PRIVILEGE_TYPE,"
                    + " C_PRIVILEGE_RANGE,"
                    + " C_PRIVILEGE_DEADLINE,"
                    + " C_AUDIT_STATE "
                    + "FROM t_copyright_contract cc "
                    + "WHERE cc.C_AUDIT_STATE in (:auditStates) ";
         
         if(condition.get("code") != null) {
             sql += " AND C_CODE = :code ";
         }
         if(condition.get("owner") != null) {
             sql += " AND C_OWNER like :owner ";
         }
         if(condition.get("auditState") != null) {
             sql += " AND C_AUDIT_STATE = :auditState ";
         }
         
         Query query = IdeaJdbc.query(sql).setParameter("auditStates", auditStates);
         
         if(condition.get("code") != null) {
             query.setParameter("code", condition.get("code"));
         }
         if(condition.get("owner") != null) {
             query.setParameter("owner", "%" + condition.get("owner") + "%");
         }
         if(condition.get("auditState") != null) {
             query.setParameter("auditState", condition.get("auditState"));
         }
         
         sql += "ORDER BY cc.C_MODIFYTIME DESC";
         
         Page<CopyrightContract> contracts = query.pageTo(CopyrightContract.class, curPage, pageSize);
         
         return contracts;
    }

    public List<Product> listContractProducts(String id) {
        String sql = "SELECT p.C_ID AS p$id,"
                   + "  p.C_NAME AS p$name,"
                   + "  p.C_ISBN AS p$isbn,"
                   + "  p.C_WORD_COUNT as p$wordCount,"
                   + "  ccp.C_ID AS ccp$id,"
                   + "  ccp.C_PRICE AS ccp$price,"
                   + "  a.C_ID as a$id,"
                   + "  a.C_NAME as a$name,"
                   + "  a.C_IDCARD as a$idcard,"
                   + "  a.C_PSEUDONYM as a$pseudonym  "
                   + "FROM t_product p, t_copyright_ctrt_prod ccp, t_author a "
                   + "WHERE ccp.C_CONTRACT_ID = :contractId "
                   + "  AND p.C_ID = ccp.C_PRODUCT_ID "
                   + "  AND p.C_AUTHOR_ID = a.C_ID";
        
        return IdeaJdbc.query(sql)
                        .setParameter("contractId", id)
                        .populate("crcProduct", "ccp")
                        .populate("author", "a")
                        .listTo(Product.class, "p");
    }

    public List<CopyrightContractAudit> listContractAudits(String contractId) {
        String sql = "SELECT cca.C_ID AS cca$id, "
                   + "cca.C_CONTRACT_ID AS cca$contractId, "
                   + "cca.C_AUDIT_REMARK AS cca$auditRemark, "
                   + "cca.C_AUDIT_TIME AS auditTime, "
                   + "cca.C_AUDIT_RESULT AS cca$auditResult, "
                   + "u.C_ID AS u$id, "
                   + "u.C_NAME AS u$name "
                   + "FROM t_copyright_ctrt_audit cca, t_user u "
                   + "WHERE cca.C_CONTRACT_ID = :contractId "
                   + "AND cca.c_auditor_id = u.c_id";
        
        return IdeaJdbc.query(sql)
                        .setParameter("contractId", contractId)
                        .populate("auditor", "u")
                        .listTo(CopyrightContractAudit.class, "cca");
    }

    public List<CopyrightContractDoc> listContractDocs(String contractId) {
        String sql = "SELECT * "
                   + "FROM T_COPYRIGHT_CTRT_DOC "
                   + "WHERE C_CONTRACT_ID = :contractId "
                   + "ORDER BY C_CREATETIME DESC";
        return IdeaJdbc.query(sql)
                       .setParameter("contractId", contractId)
                       .listTo(CopyrightContractDoc.class);
    }
}
