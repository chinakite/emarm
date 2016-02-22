/**
 * 
 */

package com.ideamoment.emarm.reserved.dao;

import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 */
@Component
public class ReservedDao {

    public List<Product> listReservedProducts(List<String> ids) {

        String sql = "SELECT " 
                     + " p.C_ID AS p$id,"
                     + " p.C_NAME AS p$name,"
                     + " p.C_PUBLISH_STATE AS p$publishState,"
                     + " p.C_PUBLISH_YEAR AS p$publishYear,"
                     + " p.C_FINISH_YEAR AS p$finishYear,"
                     + " p.C_STATE AS p$state,"
                     + " p.C_LOGO_URL AS p$logoUrl,"
                     + " a.C_ID AS a$id,"
                     + " a.C_NAME AS a$name,"
                     + " s.C_ID AS s$id, "
                     + " s.C_NAME AS s$name "
                     + " FROM "
                     + " t_product p, t_author a, t_subject s "
                     + " WHERE p.C_ID in (:ids) "
                     + " AND p.C_TYPE = :type "
                     + " AND p.C_STATE in (:states) "
                     + " AND p.C_AUTHOR_ID = a.C_ID "
                     + " AND s.C_ID = p.C_SUBJECT_ID";

        sql += " ORDER BY p.C_MODIFYTIME DESC ";
        
        String[] states = new String[]{
                ProductState.CP_CONTRACT_FINISH
        };
        
        Query query = IdeaJdbc.query(sql)
                                .setParameter("ids", ids)
                                .setParameter("type", ProductType.TEXT)
                                .setParameter("states", states)
                                .populate("author", "a")
                                .populate("subject", "s");
        
        return query.listTo(Product.class, "p");
    }

    public List<String> listCanBeReservedProductIds() {
        
        String sql = "SELECT p.C_ID "
                    + " FROM T_COPYRIGHT_CONTRACT cc, T_COPYRIGHT_CTRT_PROD ccp, T_PRODUCT p "
                    + " WHERE cc.C_ID = ccp.C_CONTRACT_ID "
                    + " AND ccp.C_PRODUCT_ID = p.C_ID "
                    + " AND ((cc.C_FINISH_TIME > :aStartTime AND p.C_RESERVED = '1') OR (cc.C_FINISH_TIME > :bStartTime AND p.C_RESERVED = '0'))";
        
        DateTime curTime = new DateTime();
        int year = curTime.getYear();
        int month = curTime.getMonthOfYear();
        int day = curTime.getDayOfMonth();
        
        DateTime curDate = new DateTime(year, month, day, 23, 59, 59);
        Date aStartTime = curDate.minusMonths(1).toDate();
        Date bStartTime = curDate.minusDays(5).toDate();
        
        List<String> ids = IdeaJdbc.query(sql)
                                    .setParameter("aStartTime", aStartTime)
                                    .setParameter("bStartTime", bStartTime)
                                    .listValue();
        
        return ids;
    }

}
