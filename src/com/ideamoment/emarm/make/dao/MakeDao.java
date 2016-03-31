/**
 * 
 */

package com.ideamoment.emarm.make.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.MakeContract;
import com.ideamoment.emarm.model.MakeContractDoc;
import com.ideamoment.emarm.model.MakeTask;
import com.ideamoment.emarm.model.MakeTaskAudio;
import com.ideamoment.emarm.model.MakeTaskAudioAudit;
import com.ideamoment.emarm.model.MakeTaskAudioFile;
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
public class MakeDao {

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

        String[] states = new String[] { 
                ProductState.MK, ProductState.MK_FINISH,
                ProductState.MK_CONTRACT, ProductState.MK_WAITING, 
                ProductState.SALED};

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

    public Map<String, Long> countTaskByProduct(List<String> productIds) {
        Map<String, Long> result = new HashMap<String, Long>();
        String sql = "SELECT t.C_PRODUCT_ID prodId, COUNT(C_ID) cnt"
                     + " FROM T_MAKE_TASK t"
                     + " WHERE t.C_PRODUCT_ID IN (:productIds) group by prodId";

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

    public List<MakeTask> listMakeTasks(String productId) {
        String sql = "SELECT t.C_ID as t$id, "
                     + "t.C_PRODUCT_ID as t$productId, "
                     + "t.C_CONTRACT_ID as t$contractId, "
                     + "t.C_MAKER_ID as t$makerId, "
                     + "t.C_TIME_SECTION as t$timePerSection, "
                     + "t.C_MAKE_TIME as t$makeTime, "
                     + "t.C_SHOW_TYPE as t$showType, "
                     + "t.C_STATE as t$state, "
                     + "u.C_ID as u$id, "
                     + "u.C_NAME as u$name, "
                     + "u.C_EMAIL as u$email "
                     + " FROM T_MAKE_TASK t, T_USER u "
                     + " WHERE t.C_PRODUCT_ID = :productId "
                     + " AND t.C_MAKER_ID = u.C_ID "
                     + " ORDER BY t.C_MODIFYTIME DESC";

        return IdeaJdbc.query(sql).setParameter("productId", productId)
                .populate("maker", "u").listTo(MakeTask.class, "t");
    }

    public MakeTask findMakeTask(String id) {
        String sql = "SELECT t.C_ID as t$id, "
                     + "t.C_PRODUCT_ID as t$productId, "
                     + "t.C_CONTRACT_ID as t$contractId, "
                     + "t.C_MAKER_ID as t$makerId, "
                     + "t.C_TIME_SECTION as t$timePerSection, "
                     + "t.C_MAKE_TIME as t$makeTime, "
                     + "t.C_SHOW_TYPE as t$showType, "
                     + "t.C_STATE as t$state, "
                     + "t.C_SHOW_EXPECTION as t$showExpection, "
                     + "t.C_DESC as t$desc, "
                     + "t.C_TOTAL_SECTION as t$totalSection, "
                     + "u.C_ID as u$id, "
                     + "u.C_NAME as u$name, "
                     + "u.C_EMAIL as u$email, "
                     + "p.C_ID as p$id, "
                     + "p.C_NAME as p$name, "
                     + "mc.C_ID as mc$id, "
                     + "mc.C_CODE as mc$code "
                     + " FROM T_MAKE_TASK t "
                     + " INNER JOIN T_USER u ON t.C_MAKER_ID = u.C_ID "
                     + " INNER JOIN T_PRODUCT p ON t.C_PRODUCT_ID = p.C_ID "
                     + " LEFT JOIN T_MAKE_CONTRACT mc ON t.C_CONTRACT_ID = mc.C_ID "
                     + " WHERE t.C_ID = :id ";

        List<MakeTask> tasks = IdeaJdbc.query(sql).setParameter("id", id)
                .populate("maker", "u").populate("product", "p")
                .populate("makeContract", "mc").listTo(MakeTask.class, "t");

        if (tasks != null && tasks.size() > 0) {
            return tasks.get(0);
        } else {
            return null;
        }
    }

    public String queryMaxContractCode(String prefix) {
        String sql = "select C_CODE from T_MAKE_CONTRACT where C_CODE like :code order by C_CODE desc limit 0,1";
        String code = (String) IdeaJdbc.query(sql)
                .setParameter("code", prefix + "%").uniqueValue();

        return code;
    }

    public MakeContract findMakeContract(String productId) {
        String sql = "select * from T_MAKE_CONTRACT where C_PRODUCT_ID = :productId order by C_MODIFYTIME desc limit 0,1";

        return (MakeContract) IdeaJdbc.query(sql)
                .setParameter("productId", productId)
                .uniqueTo(MakeContract.class);
    }

    public List<MakeContractDoc> listContractDocs(String contractId) {
        String sql = "SELECT * " + "FROM T_MAKE_CTRT_DOC "
                     + "WHERE C_CONTRACT_ID = :contractId "
                     + "ORDER BY C_CREATETIME DESC";
        return IdeaJdbc.query(sql).setParameter("contractId", contractId)
                .listTo(MakeContractDoc.class);
    }

    public List<MakeTask> listExtMyMakeTasks(String userId) {
        String sql = "SELECT t.C_ID as t$id, "
                     + "t.C_NAME as t$name, "
                     + "t.C_PRODUCT_ID as t$productId, "
                     + "t.C_CONTRACT_ID as t$contractId, "
                     + "t.C_MAKER_ID as t$makerId, "
                     + "t.C_TIME_SECTION as t$timePerSection, "
                     + "t.C_MAKE_TIME as t$makeTime, "
                     + "t.C_SHOW_TYPE as t$showType, "
                     + "t.C_STATE as t$state, "
                     + "u.C_ID as u$id, "
                     + "u.C_NAME as u$name, "
                     + "u.C_EMAIL as u$email "
                     + " FROM T_MAKE_TASK t, T_USER u "
                     + " WHERE t.C_MAKER_ID = :userId "
                     + " AND t.C_MAKER_ID = u.C_ID "
                     + " AND t.C_STATE <> '0' "
                     + " ORDER BY t.C_MODIFYTIME DESC";

        return IdeaJdbc.query(sql).setParameter("userId", userId)
                .populate("maker", "u").listTo(MakeTask.class, "t");
    }

    public Page<MakeTask> pageExtMyMakeTasks(int curPage,
                                             int pageSize,
                                             String userId)
    {
        String sql = "SELECT t.C_ID as t$id, "
                     + "t.C_NAME as t$name, "
                     + "t.C_PRODUCT_ID as t$productId, "
                     + "t.C_CONTRACT_ID as t$contractId, "
                     + "t.C_MAKER_ID as t$makerId, "
                     + "t.C_TIME_SECTION as t$timePerSection, "
                     + "t.C_MAKE_TIME as t$makeTime, "
                     + "t.C_SHOW_TYPE as t$showType, "
                     + "t.C_STATE as t$state, "
                     + "u.C_ID as u$id, "
                     + "u.C_NAME as u$name, "
                     + "u.C_EMAIL as u$email "
                     + " FROM T_MAKE_TASK t, T_USER u "
                     + " WHERE t.C_MAKER_ID = :userId "
                     + " AND t.C_MAKER_ID = u.C_ID "
                     + " AND t.C_STATE <> '0' "
                     + " ORDER BY t.C_MODIFYTIME DESC";

        return IdeaJdbc.query(sql).setParameter("userId", userId)
                .populate("maker", "u").pageTo(MakeTask.class, "t", curPage, pageSize);
    }

    public List<MakeTaskAudio> listMakeTaskAudioes(String id) {
        String sql = "SELECT * FROM T_MAKE_TASK_AUDIO WHERE C_MAKE_TASK_ID = :id";
        return IdeaJdbc.query(sql).setParameter("id", id).listTo(MakeTaskAudio.class);
    }

    public List<MakeTaskAudioFile> listMakeTaskAudioFiles(String makeTaskAudioId) {
        String sql = "SELECT * FROM T_MAKE_TASK_AUDIO_FILE WHERE C_MAKE_TASK_AUDIO_ID = :id ORDER BY C_CREATETIME DESC";
        return IdeaJdbc.query(sql).setParameter("id", makeTaskAudioId).listTo(MakeTaskAudioFile.class);
    }

    public List<MakeTaskAudioAudit> listMakeTaskAudioAudits(String makeTaskAudioId) {
        String sql = "SELECT mtaa.C_ID as mtaa$id, "
                    + "      mtaa.C_REMARK as mtaa$remark, "
                    + "      mtaa.C_CREATETIME as mtaa$createTime, "
                    + "      mtaa.C_RESULT as mtaa$result, "
                    + "      u.C_ID as u$id, "
                    + "      u.C_NAME as u$name "
                    + "FROM T_MAKE_TASK_AUDIO_AUDIT mtaa, T_USER u "
                    + "WHERE mtaa.C_MAKE_TASK_AUDIO_ID = :id "
                    + "AND mtaa.C_CREATOR = u.C_ID "
                    + "ORDER BY mtaa.C_CREATETIME DESC";
        return IdeaJdbc.query(sql)
                       .setParameter("id", makeTaskAudioId)
                       .populate("auditor", "u")
                       .listTo(MakeTaskAudioAudit.class, "mtaa");
    }

    public List<MakeContract> listMakeContractsByProduct(String productId) {
        String sql = "select * from T_MAKE_CONTRACT where C_PRODUCT_ID = :productId order by C_MODIFYTIME desc limit 0,1";

        return IdeaJdbc.query(sql)
                        .setParameter("productId", productId)
                        .listTo(MakeContract.class);
    }

    public List<MakeContract> listAvaliableMakeContracts() {
        String sql = "select mc.C_ID as mc$id,"
                + " mc.C_CODE as mc$code, "
                + " p.C_ID as p$id,"
                + " p.C_NAME as p$name "
                + " from t_make_contract mc, t_product p "
                + " where mc.C_STATE <> 10 and mc.C_ID not in (select C_CONTRACT_ID from t_make_task) ORDER BY mc.C_CODE DESC";
        
        return IdeaJdbc.query(sql)
                        .populate("product", "p")
                        .listTo(MakeContract.class, "mc");
    }

    public Long queryUnfinishedAudioCount(String contractId) {
        String sql = "select count(mta.C_ID) from t_make_task mt, t_make_task_audio mta"
                + " where mt.C_CONTRACT_ID = :contractId "
                + " and mta.C_MAKE_TASK_ID = mt.C_ID "
                + " and mta.C_STATE = '0'";
        return (Long)IdeaJdbc.query(sql)
                                .setParameter("contractId", contractId)
                                .uniqueValue();
    }

    public List<MakeTask> queryTasksByContract(String contractId) {
        String sql = "select * from t_make_task where c_contract_id = :contractId";
        
        return IdeaJdbc.query(sql).setParameter("contractId", contractId).listTo(MakeTask.class);
    }

}
