/**
 * 
 */

package com.ideamoment.emarm.copyright.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.CopyrightContract;
import com.ideamoment.emarm.model.CopyrightContractAudit;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.model.enumeration.RoleType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 */
@Component
public class CopyrightDao {

    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      List<String> roles,
                                      String userId,
                                      HashMap<String, String> condition)
    {
        String sql = "SELECT " + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " p.C_LOGO_URL AS p$logoUrl,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name, "
                     + " u.C_ID AS u$id, "
                     + " u.C_NAME AS u$name, "
                     + " u.C_ACCOUNT AS u$account "
                     + " FROM "
                     + " t_product p, t_copyright_prod_optor cpo, t_author a, t_subject s, t_user u "
                     + " WHERE cpo.C_USER_ID = :userId "
                     + " AND cpo.C_PRODUCT_ID = p.C_ID "
                     + " AND p.C_CREATOR = u.C_ID "
                     + " AND p.C_TYPE = :type "
                     + " AND p.C_STATE in (:states) "
                     + " AND p.C_AUTHOR_ID = a.C_ID "
                     + " AND s.C_ID = p.C_SUBJECT_ID "
                     ;

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
        if (condition.get("auditState") != null) {
            sql += " AND p.C_PUBLISH_STATE = :auditState ";
        }
        if (condition.get("state") != null) {
            sql += " AND p.C_STATE = :state ";
        }

        sql += " ORDER BY p.C_MODIFYTIME DESC ";

        Set<String> states = new HashSet<String>();
        states.add(ProductState.EVALUATE_FINISH);
        states.add(ProductState.CP_CONTRACT_INFLOW);
        states.add(ProductState.CP_CONTRACT_FINISH);

        Query query = IdeaJdbc.query(sql).setParameter("type", ProductType.TEXT)
                .setParameter("states", states).populate("author", "a").setParameter("userId", userId)
                .populate("subject", "s").populate("createUser", "u");

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

    public void deleteContractProduct(String contractId) {
        String sql = "delete from T_COPYRIGHT_CTRT_PROD where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).execute();
    }

    public Page<CopyrightContract> pageMyContracts(int curPage,
                                                   int pageSize,
                                                   String userId,
                                                   HashMap<String, String> condition)
    {
        String sql = "SELECT C_ID," + " C_CODE,"
                     + " C_OWNER,"
                     + " C_BUYER_CONTACT,"
                     + " C_PRIVILEGES,"
                     + " C_PRIVILEGE_TYPE,"
                     + " C_PRIVILEGE_RANGE,"
                     + " C_PRIVILEGE_DEADLINE,"
                     + " C_AUDIT_STATE "
                     + "FROM t_copyright_contract cc "
                     + "WHERE cc.C_CREATOR = :userId ";

        if (condition.get("code") != null) {
            sql += " AND C_CODE = :code ";
        }
        if (condition.get("owner") != null) {
            sql += " AND C_OWNER like :owner ";
        }
        if (condition.get("auditState") != null) {
            sql += " AND C_AUDIT_STATE = :auditState ";
        }

        Query query = IdeaJdbc.query(sql).setParameter("userId", userId);

        if (condition.get("code") != null) {
            query.setParameter("code", condition.get("code"));
        }
        if (condition.get("owner") != null) {
            query.setParameter("owner", "%" + condition.get("owner") + "%");
        }
        if (condition.get("auditState") != null) {
            query.setParameter("auditState", condition.get("auditState"));
        }

        sql += "ORDER BY cc.C_MODIFYTIME DESC";

        Page<CopyrightContract> contracts = query
                .pageTo(CopyrightContract.class, curPage, pageSize);

        return contracts;
    }

    public String queryMaxContractCode(String prefix) {
        String sql = "select C_CODE from T_COPYRIGHT_CONTRACT where C_CODE like :code order by C_CODE desc limit 0,1";
        String code = (String) IdeaJdbc.query(sql)
                .setParameter("code", prefix + "%").uniqueValue();

        return code;
    }

    public Page<CopyrightContract> pageAuditContracts(int curPage,
                                                      int pageSize,
                                                      List<String> auditStates,
                                                      HashMap<String, String> condition)
    {
        String sql = "SELECT C_ID," + " C_CODE,"
                     + " C_OWNER,"
                     + " C_BUYER_CONTACT,"
                     + " C_PRIVILEGES,"
                     + " C_PRIVILEGE_TYPE,"
                     + " C_PRIVILEGE_RANGE,"
                     + " C_PRIVILEGE_DEADLINE,"
                     + " C_AUDIT_STATE "
                     + "FROM t_copyright_contract cc "
                     + "WHERE cc.C_AUDIT_STATE in (:auditStates) ";

        if (condition.get("code") != null) {
            sql += " AND C_CODE = :code ";
        }
        if (condition.get("owner") != null) {
            sql += " AND C_OWNER like :owner ";
        }
        if (condition.get("auditState") != null) {
            sql += " AND C_AUDIT_STATE = :auditState ";
        }

        Query query = IdeaJdbc.query(sql).setParameter("auditStates",
                                                       auditStates);

        if (condition.get("code") != null) {
            query.setParameter("code", condition.get("code"));
        }
        if (condition.get("owner") != null) {
            query.setParameter("owner", "%" + condition.get("owner") + "%");
        }
        if (condition.get("auditState") != null) {
            query.setParameter("auditState", condition.get("auditState"));
        }

        sql += "ORDER BY cc.C_MODIFYTIME DESC";

        Page<CopyrightContract> contracts = query
                .pageTo(CopyrightContract.class, curPage, pageSize);

        return contracts;
    }

    public List<Product> listContractProducts(String id) {
        String sql = "SELECT p.C_ID AS p$id," + "  p.C_NAME AS p$name,"
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

        return IdeaJdbc.query(sql).setParameter("contractId", id)
                .populate("crcProduct", "ccp").populate("author", "a")
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
                     + "AND cca.c_auditor_id = u.c_id "
                     + " ORDER BY C_AUDIT_TIME DESC ";

        return IdeaJdbc.query(sql).setParameter("contractId", contractId)
                .populate("auditor", "u")
                .listTo(CopyrightContractAudit.class, "cca");
    }

    public List<CopyrightContractDoc> listContractDocs(String contractId) {
        String sql = "SELECT * " + "FROM T_COPYRIGHT_CTRT_DOC "
                     + "WHERE C_CONTRACT_ID = :contractId "
                     + "ORDER BY C_CREATETIME DESC";
        return IdeaJdbc.query(sql).setParameter("contractId", contractId)
                .listTo(CopyrightContractDoc.class);
    }

    public List<CopyrightContract> listProductContracts(String productId) {
        String sql = "SELECT cc.C_ID as cc$id," + " cc.C_CODE as cc$code,"
                     + " cc.C_OWNER as cc$owner,"
                     + " cc.C_BUYER_CONTACT as cc$buyerContact,"
                     + " cc.C_PRIVILEGES as cc$privileges,"
                     + " cc.C_PRIVILEGE_TYPE as cc$privilegeType,"
                     + " cc.C_PRIVILEGE_RANGE as cc$privilegeRange,"
                     + " cc.C_PRIVILEGE_DEADLINE as cc$privilegeDeadline,"
                     + " cc.C_AUDIT_STATE as cc$auditState, "
                     + " cc.C_CREATETIME as cc$createTime "
                     + " FROM t_copyright_contract cc, t_copyright_ctrt_prod ccp "
                     + " WHERE ccp.C_PRODUCT_ID = :productId "
                     + " AND ccp.C_CONTRACT_ID = cc.C_ID "
                     + " ORDER BY cc.C_CREATETIME DESC ";

        return IdeaJdbc.query(sql).setParameter("productId", productId)
                .listTo(CopyrightContract.class, "cc");
    }

    public Product findProduct(String id) {
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
                     + " sp.C_FILE_URL as sp$fileUrl, "
                     + " u.C_ID as u$id, "
                     + " u.C_NAME as u$name, "
                     + " u.C_ACCOUNT as u$account "
                     + " FROM "
                     + " t_product p "
                     + " LEFT JOIN t_author a "
                     + " ON p.C_AUTHOR_ID = a.C_ID "
                     + " LEFT JOIN t_subject s "
                     + " ON s.C_ID = p.C_SUBJECT_ID "
                     + " LEFT JOIN t_product_sample sp "
                     + " ON sp.C_PRODUCT_ID = p.C_ID "
                     + " LEFT JOIN t_user u "
                     + " ON p.C_CREATOR = u.C_ID "
                     + " WHERE p.C_ID = :id "
                     + " ORDER BY p.C_MODIFYTIME DESC ";

        List<Product> products = IdeaJdbc.query(sql).setParameter("id", id)
                .populate("author", "a").populate("subject", "s")
                .populate("samples", "sp").populate("createUser", "u").listTo(Product.class, "p");

        if (products != null && products.size() > 0) {
            return products.get(0);
        } else {
            return null;
        }
    }

    public Page<Product> pageMgrProducts(int curPage,
                                         int pageSize,
                                         List<String> roles,
                                         String userId,
                                         HashMap<String, String> condition)
    {
        String sql = "SELECT " + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " p.C_LOGO_URL AS p$logoUrl,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name, "
                     + " u.C_ID AS u$id, "
                     + " u.C_NAME AS u$name, "
                     + " u.C_ACCOUNT AS u$account "
                     + " FROM "
                     + " t_product p "
                     + " LEFT JOIN t_author a "
                     + " ON p.C_AUTHOR_ID = a.C_ID "
                     + " LEFT JOIN t_subject s "
                     + " ON s.C_ID = p.C_SUBJECT_ID "
                     + " LEFT JOIN t_copyright_ctrt_prod ccp "
                     + " ON p.C_ID = ccp.C_PRODUCT_ID "
                     + " LEFT JOIN t_copyright_contract cc "
                     + " ON cc.C_ID = ccp.C_CONTRACT_ID "
                     + " LEFT JOIN t_user u "
                     + " ON p.C_CREATOR = u.C_ID "
                     + " WHERE p.C_TYPE = :type "
                     + " AND p.C_STATE in (:states) or (p.C_STATE = '50' and p.C_CREATOR = '"
                     + userId
                     + "')";

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
        if (condition.get("auditState") != null) {
            sql += " AND p.C_PUBLISH_STATE = :auditState ";
        }
        if (condition.get("state") != null) {
            sql += " AND p.C_STATE = :state ";
        }

        sql += " ORDER BY p.C_MODIFYTIME DESC ";

        Set<String> states = new HashSet<String>();
        states.add(ProductState.EVALUATE_FINISH);
        states.add(ProductState.CP_CONTRACT_INFLOW);
        states.add(ProductState.CP_CONTRACT_FINISH);

        Query query = IdeaJdbc.query(sql).setParameter("type", ProductType.TEXT)
                .setParameter("states", states).populate("author", "a")
                .populate("subject", "s").populate("createUser", "u");

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

    public Long countCopyrightByTime(Date startTime, Date endTime) {
        String sql = "SELECT COUNT(c_id) FROM T_COPYRIGHT_CONTRACT WHERE C_FINISH_TIME BETWEEN :startTime AND :endTime AND C_AUDIT_STATE = '99'";
        return (Long)IdeaJdbc.query(sql)
                               .setParameter("startTime", startTime)
                               .setParameter("endTime", endTime)
                               .uniqueValue();
    }

    public void deleteContractAudit(String contractId) {
        String sql = "delete from T_COPYRIGHT_CTRT_AUDIT where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).execute();
    }

    public void deleteContractDoc(String contractId) {
        String sql = "delete from T_COPYRIGHT_CTRT_DOC where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).execute();
    }

	public void deleteProductCopyrightFiles(String productId) {
		String sql = "delete from T_PRODUCT_COPYRIGHT_FILE where C_PRODUCT_ID = :productId";
        IdeaJdbc.sql(sql).setParameter("productId", productId).execute();
	}
}
