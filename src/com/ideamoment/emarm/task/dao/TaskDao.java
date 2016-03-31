/**
 * 
 */

package com.ideamoment.emarm.task.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.model.enumeration.TaskState;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 */
@Component
public class TaskDao {

    public List<Task> listTasks(String[] roles, int size) {
        String sql = "SELECT * " + " FROM T_TASK "
                     + " WHERE C_ROLE_ID in (:roles) "
                     + " AND C_STATE <> :state "
                     + " ORDER BY C_CREATETIME DESC ";

        if (size > -1) {
            sql += " LIMIT 0," + size;
        }

        return IdeaJdbc.query(sql).setParameter("roles", roles)
                .setParameter("state", TaskState.FINISHED).listTo(Task.class);
    }

    public Page<Task> pageMyTasks(int curPage,
                                  int pageSize,
                                  String[] roles,
                                  HashMap<String, String> condition)
    {
        String sql = "SELECT * " 
                     + " FROM T_TASK "
                     + " WHERE C_ROLE_ID in (:roles) "
                     + " AND C_STATE <> :state ";
        
        if(condition != null) {
            if(condition.get("taskName") != null) {
                sql += " AND C_TITLE LIKE :title ";
            }
            
            if(condition.get("targetType") != null && !condition.get("targetType").equals("-1")) {
                sql += " AND C_TARGET_TYPE = :targetType ";
            }
        }
        
        sql += " ORDER BY C_CREATETIME DESC ";
        
        Query query =  IdeaJdbc.query(sql)
                               .setParameter("roles", roles)
                               .setParameter("state", TaskState.FINISHED);
        
        if(condition != null) {
            if(condition.get("taskName") != null) {
                query.setParameter("title", "%"+condition.get("taskName")+"%");
            }
            
            if(condition.get("targetType") != null && !condition.get("targetType").equals("-1")) {
                query.setParameter("targetType", condition.get("targetType"));
            }
        }
        
        return query.pageTo(Task.class, curPage, pageSize);
    }

}
