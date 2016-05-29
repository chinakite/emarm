/**
 * 
 */

package com.ideamoment.emarm.sale.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.SaleContract;
import com.ideamoment.emarm.model.SaleContractDoc;
import com.ideamoment.emarm.model.SaleContractProduct;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 */
@Component
public class SaleDao {

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
                     + " p.C_ISBN AS p$isbn,"
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

        String[] states = new String[] { ProductState.CP_CONTRACT_FINISH,
                ProductState.MK, ProductState.MK_FINISH,
                ProductState.MK_CONTRACT, ProductState.SALED};

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

    public Map<String, Long> countContractByProduct(List<String> productIds) {
        Map<String, Long> result = new HashMap<String, Long>();
        String sql = "SELECT t.C_PRODUCT_ID prodId, COUNT(C_ID) cnt"
                     + " FROM T_SALE_CTRT_PROD t"
                     + " WHERE t.C_PRODUCT_ID IN (:productIds) GROUP BY prodId";

        List<Map<String, Object>> queryResult = IdeaJdbc.query(sql)
                .setParameter("productIds", productIds).list();

        if (queryResult.size() == 0) {
            return result;
        }

        for (Map<String, Object> map : queryResult) {
            result.put((String) map.get("prodId"), (Long) map.get("cnt"));
        }

        return result;
    }

    public String queryMaxContractCode(String prefix) {
        String sql = "select C_CODE from T_SALE_CONTRACT where C_CODE like :code order by C_CODE desc limit 0,1";
        String code = (String) IdeaJdbc.query(sql)
                .setParameter("code", prefix + "%").uniqueValue();

        return code;
    }

    public void deleteContractProduct(String contractId) {
        String sql = "delete from T_SALE_CTRT_PROD where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).execute();
    }
    
    public void deleteContractProduct(String contractId, String productId) {
        String sql = "delete from T_SALE_CTRT_PROD where C_CONTRACT_ID = :contractId and C_PRODUCT_ID = :productId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).setParameter("productId", productId).execute();
    }
    
    public SaleContractProduct findSaleContractProduct(String contractId, String productId) {
        String sql = "select * from T_SALE_CTRT_PROD WHERE C_CONTRACT_ID = :contractId and C_PRODUCT_ID = :productId";
        return (SaleContractProduct)IdeaJdbc.query(sql).setParameter("contractId", contractId).setParameter("productId", productId).uniqueTo(SaleContractProduct.class);
    }

    public List<SaleContract> listProductContracts(String productId) {
        String sql = "SELECT sc.C_ID," + " sc.C_CODE,"
                     + " sc.C_OWNER,"
                     + " sc.C_BUYER_CONTACT,"
                     + " sc.C_PRIVILEGES,"
                     + " sc.C_PRIVILEGE_TYPE,"
                     + " sc.C_PRIVILEGE_RANGE,"
                     + " sc.C_PRIVILEGE_DEADLINE, "
                     + " sc.C_STATE "
                     + "FROM T_SALE_CONTRACT sc, T_SALE_CTRT_PROD scp "
                     + "WHERE scp.C_PRODUCT_ID = :productId "
                     + " AND scp.C_CONTRACT_ID = sc.C_ID";

        Query query = IdeaJdbc.query(sql).setParameter("productId", productId);

        sql += "ORDER BY cc.C_MODIFYTIME DESC";

        List<SaleContract> contracts = query.listTo(SaleContract.class);

        return contracts;
    }

    public Page<SaleContract> pageContracts(int curPage, int pageSize, HashMap condition) {
        String sql = "SELECT sc.C_ID," + " sc.C_CODE,"
                     + " sc.C_OWNER,"
                     + " sc.C_BUYER_CONTACT,"
                     + " sc.C_PRIVILEGES,"
                     + " sc.C_PRIVILEGE_TYPE,"
                     + " sc.C_PRIVILEGE_RANGE,"
                     + " sc.C_PRIVILEGE_DEADLINE, "
                     + " sc.C_STATE "
                     + "FROM T_SALE_CONTRACT sc ";

        sql += "ORDER BY sc.C_MODIFYTIME DESC";

        Page<SaleContract> contracts = IdeaJdbc.query(sql).pageTo(SaleContract.class, curPage, pageSize);

        return contracts;
    }

    public List<Product> listContractProducts(String contractId) {
        String sql = "SELECT p.C_ID AS p$id," + "  p.C_NAME AS p$name,"
                + "  p.C_ISBN AS p$isbn,"
                + "  p.C_WORD_COUNT as p$wordCount,"
                + "  scp.C_ID AS scp$id,"
                + "  scp.C_PRICE AS scp$price,"
                + "  a.C_ID as a$id,"
                + "  a.C_NAME as a$name,"
                + "  a.C_IDCARD as a$idcard,"
                + "  a.C_PSEUDONYM as a$pseudonym  "
                + "FROM t_product p, t_sale_ctrt_prod scp, t_author a "
                + "WHERE scp.C_CONTRACT_ID = :contractId "
                + "  AND p.C_ID = scp.C_PRODUCT_ID "
                + "  AND p.C_AUTHOR_ID = a.C_ID";

        return IdeaJdbc.query(sql).setParameter("contractId", contractId)
           .populate("scProduct", "scp").populate("author", "a")
           .listTo(Product.class, "p");
    }

    public List<SaleContractDoc> listContractDocs(String contractId) {
        String sql = "SELECT * " 
                + "FROM T_SALE_CTRT_DOC "
                + "WHERE C_CONTRACT_ID = :contractId "
                + "ORDER BY C_CREATETIME DESC";
        return IdeaJdbc.query(sql).setParameter("contractId", contractId)
                        .listTo(SaleContractDoc.class);
    }

    public Long countSaleByTime(Date startTime, Date endTime) {
        String sql = "SELECT COUNT(c_id) FROM T_SALE_CONTRACT WHERE C_MODIFYTIME BETWEEN :startTime AND :endTime AND C_STATE = '10'";
        return (Long)IdeaJdbc.query(sql)
                               .setParameter("startTime", startTime)
                               .setParameter("endTime", endTime)
                               .uniqueValue();
    }

    public void deleteContractAudit(String contractId) {
        String sql = "delete from T_SALE_CTRT_AUDIT where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).execute();
    }

    public void deleteContractDoc(String contractId) {
        String sql = "delete from T_SALE_CTRT_DOC where C_CONTRACT_ID = :contractId";
        IdeaJdbc.sql(sql).setParameter("contractId", contractId).execute();
    }
}
