/**
 * 
 */
package com.ideamoment.emarm.task.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.model.enumeration.TaskState;
import com.ideamoment.ideajdbc.IdeaJdbc;

/**
 * @author Chinakite
 *
 */
@Component
public class TaskDao {

    public List<Task> listTasks(String[] roles, int size) {
        String sql = "SELECT * "
                    + " FROM T_TASK "
                    + " WHERE C_ROLE_ID in (:roles) "
                    + " AND C_STATE <> :state "
                    + " ORDER BY C_CREATETIME DESC ";
        
        if(size > -1) {
            sql += " LIMIT 0," + size;
        }
        
        return IdeaJdbc.query(sql)
                        .setParameter("roles", roles)
                        .setParameter("state", TaskState.FINISHED)
                        .listTo(Task.class);
    }

}
