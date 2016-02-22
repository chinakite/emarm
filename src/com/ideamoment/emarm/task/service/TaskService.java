/**
 * 
 */
package com.ideamoment.emarm.task.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.TaskState;
import com.ideamoment.emarm.task.dao.TaskDao;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class TaskService {
    @Autowired
    private TaskDao taskDao;
    
    /**
     * @return the taskDao
     */
    public TaskDao getTaskDao() {
        return taskDao;
    }
    
    /**
     * @param taskDao the taskDao to set
     */
    public void setTaskDao(TaskDao taskDao) {
        this.taskDao = taskDao;
    }
    
    public Task createTask(Task task) {
        Date curTime = new Date();
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = optUser.getId();
        
        task.setCreator(userId);
        task.setCreateTime(curTime);
        task.setModifier(userId);
        task.setModifyTime(curTime);
        task.setState(TaskState.UNREAD);
        
        IdeaJdbc.save(task);
        
        return task;
    }
    
    public Task readTask(String id) {
        Date curTime = new Date();
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = optUser.getId();
        
        Task task = IdeaJdbc.find(Task.class, id);
        task.setModifier(userId);
        task.setModifyTime(curTime);
        task.setState(TaskState.READED);
        
        IdeaJdbc.update(task);
        
        return task;
    }
    
    public Task finishTask(String id) {
        Date curTime = new Date();
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = optUser.getId();
        
        Task task = IdeaJdbc.find(Task.class, id);
        task.setModifier(userId);
        task.setModifyTime(curTime);
        task.setState(TaskState.FINISHED);
        
        IdeaJdbc.update(task);
        
        return task;
    }

    @IdeaJdbcTx
    public List<Task> listMyTasks() {
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String role = optUser.getRole();
        String[] roles = role.split(",");
        
        return taskDao.listTasks(roles, -1);
    }

    @IdeaJdbcTx
    public List<Task> listMyTasksDashboard() {
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String role = optUser.getRole();
        String[] roles = role.split(",");
        
        return taskDao.listTasks(roles, 5);
    }
}
