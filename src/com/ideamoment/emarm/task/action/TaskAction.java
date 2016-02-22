/**
 * 
 */
package com.ideamoment.emarm.task.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.task.service.TaskService;
import com.ideamoment.ideadp.restful.json.JsonData;

/**
 * @author Chinakite
 *
 */
@Controller
public class TaskAction {
    @Autowired
    private TaskService taskService;

    /**
     * @return the taskService
     */
    public TaskService getTaskService() {
        return taskService;
    }
    
    /**
     * @param taskService the taskService to set
     */
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }
    
    @RequestMapping(value="/task/myTasks", method=RequestMethod.GET)
    public JsonData listMyTasks() {
        List<Task> tasks = taskService.listMyTasks();
        return JsonData.success(tasks);
    }
    
    @RequestMapping(value="/task/myTasksDashboard", method=RequestMethod.GET)
    public JsonData listMyTasksDashboard() {
        List<Task> tasks = taskService.listMyTasksDashboard();
        return JsonData.success(tasks);
    }
}
