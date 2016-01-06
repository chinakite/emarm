/**
 * 
 */
package com.ideamoment.emarm.user.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.UserState;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 *
 */
@Component
public class UserDao {

    public User queryUser(String account, String ignoreId) {
        String sql = "select * from T_USER where C_ACCOUNT = :account AND C_STATUS <> '9'";
        
        if(ignoreId != null) {
            sql += " and C_ID <> :id";
        }
        
        Query query = IdeaJdbc.query(sql)
                                .setParameter("account", account);
        
        if(ignoreId != null) {
            query.setParameter("id", ignoreId);
        }
        
        User user = (User)query.uniqueTo(User.class);
        
        return user;
    }

    public User queryUserByEmail(String email, String ignoreId) {
        String sql = "select * from T_USER where C_EMAIL = :email AND C_STATUS <> '9'";
        
        if(ignoreId != null) {
            sql += " and C_ID <> :id";
        }
        
        Query query = IdeaJdbc.query(sql)
                                .setParameter("email", email);
        
        if(ignoreId != null) {
            query.setParameter("id", ignoreId);
        }
        
        User user = (User)query.uniqueTo(User.class);
        
        return user;
    }
    
    public User queryUserByMobile(String mobile, String ignoreId) {
        String sql = "select * from T_USER where C_MOBILE = :mobile AND C_STATUS <> '9'";
        
        if(ignoreId != null) {
            sql += " and C_ID <> :id";
        }
        
        Query query = IdeaJdbc.query(sql)
                                .setParameter("mobile", mobile);
        
        if(ignoreId != null) {
            query.setParameter("id", ignoreId);
        }
        
        User user = (User)query.uniqueTo(User.class);
        
        return user;
    }
    
    public List<User> queryUser(String key, String role, String status) {
        String sql = "select * from T_USER WHERE C_STATUS <> '9'";

        String maskkey = "%"+key+"%";
        String maskrole = "%"+role+"%";
        if(key != null) {
            sql += "AND (C_NAME like :maskkey or C_ACCOUNT like :maskkey or C_EMAIL = :key or C_MOBILE = :key) ";
        }
        
        if(role != null) {
            sql += "AND C_ROLE like :role ";
        }
        
        if(status != null) {
            sql += "AND C_STATUS = :status ";
        }
        
        Query query = IdeaJdbc.query(sql);
        if(key != null) {
            query.setParameter("maskkey", maskkey);
            query.setParameter("key", key);
        }
        if(role != null) {
            query.setParameter("role", maskrole);
        }
        if(status != null) {
            query.setParameter("status", status);
        }
        
        List<User> users = query.listTo(User.class);
        
        return users;
    }

    public void batchDeleteSubjects(String[] idArray) {
        String sql = "update t_user SET C_STATUS = :status WHERE c_id in (:ids)";
        IdeaJdbc.sql(sql).setParameter("status", UserState.DELETED).setParameter("ids", idArray).execute();
    }

}
