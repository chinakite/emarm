/**
 * 
 */
package com.ideamoment.emarm.subject.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.Subject;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 *
 */
@Component
public class SubjectDao {

    public List<Subject> listSubjects(String type, String key) {
        String sql = "SELECT "
                   +   "* "
                   + "FROM "
                   +   "t_subject "
                   + "WHERE c_type = :type ";
        
        if(key != null) {
            sql += " AND c_name like :name";
        }
        
        sql += " ORDER BY c_order asc"; 
        
        Query query = IdeaJdbc.query(sql).setParameter("type", type);
        
        if(key != null) {
            query.setParameter("name", "%"+key+"%");
        }
        
        return query.listTo(Subject.class);
    }

    public List<Subject> querySubject(String type, String name, boolean mask) {
        String sql = "SELECT "
                   +   "* "
                   + "FROM "
                   +   "t_subject "
                   + "WHERE c_type = :type ";
        String param = name;
        if(mask) {
               sql += "AND c_name like :name";  
               param = "%"+name+"%";
        }else{
               sql += "AND c_name = :name";
        }
        
        return IdeaJdbc.query(sql).setParameter("type", type).setParameter("name", param).listTo(Subject.class);
    }
    
    public int queryMaxOrder(String type) {
        String sql = "SELECT "
                    +   "MAX(C_ORDER) "
                    + "FROM "
                    +   "t_subject "
                    + "WHERE c_type = :type";
        
        Integer result = (Integer)IdeaJdbc.query(sql).setParameter("type", type).uniqueValue();
        if(result == null) {
            return 0;
        }else{
            return result;
        }
    }
    
    public List<Subject> querySubjectExceptSelf(String type, String name, String id) {
        String sql = "SELECT "
                   +   "* "
                   + "FROM "
                   +   "t_subject "
                   + "WHERE c_type = :type "
                   +   "AND c_name = :name "
                   +   "AND c_id <> :id";
        
        return IdeaJdbc.query(sql)
                       .setParameter("type", type)
                       .setParameter("name", name)
                       .setParameter("id", id)
                       .listTo(Subject.class);
    }

    public boolean checkExistsProductsOfSubject(String id) {
        String sql = "SELECT 1 from T_PRODUCT_SUBJECT where C_SUBJECT_ID = :subject limit 1,1";
        
        Object obj = IdeaJdbc.query(sql)
                                .setParameter("subject", id)
                                .uniqueValue();
        
        if(obj == null) {
            return false;
        }else{
            return true;
        }
    }

    public void batchDeleteSubjects(String[] idArray) {
        String sql = "DELETE FROM t_subject WHERE c_id in (:ids)";
        IdeaJdbc.sql(sql).setParameter("ids", idArray).execute();
    } 
    
    public Subject querySubjectByOrder(String type, int order) {
        String sql = "select * from t_subject where c_type = :type and c_order = :order";
        
        return (Subject)IdeaJdbc.query(sql).setParameter("type", type)
                                       .setParameter("order", order)
                                       .uniqueTo(Subject.class);
    }
}
