/**
 * 
 */
package com.ideamoment.emarm.task.action;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.Task;
import com.ideamoment.emarm.model.enumeration.TaskTargetType;
import com.ideamoment.emarm.task.service.TaskService;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;

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
    
    @RequestMapping(value="/task/myTaskPage", method=RequestMethod.GET)
    public ModelAndView toMyTask() {
        return new ModelAndView("/WEB-INF/jsp/task/mytask.jsp");
    }
    
    @RequestMapping(value="/task/myTasks", method=RequestMethod.GET)
    public JsonData listMyTasks() {
        List<Task> tasks = taskService.listMyTasks();
        return JsonData.success(tasks);
    }
    
    @RequestMapping(value="/task/dtMyTasks", method=RequestMethod.GET)
    public JsonData dtMyTasks(int draw, 
                              int start, 
                              int length, 
                              String taskName,
                              String targetType) {
        int curPage = start/length + 1;
        int pageSize = length;
        
        HashMap<String, String> condition = new HashMap<String, String>();
        if(taskName != null)
            condition.put("taskName", taskName);
        if(targetType != null)
            condition.put("targetType", targetType);
        
        Page<Task> tasks = taskService.pageMyTasks(curPage, pageSize, condition);
        DataTableSource<Task> dtTasks = convertToDataTableSource(draw, tasks);
        return new JsonData(dtTasks);
    }
    
    @RequestMapping(value="/task/myTasksDashboard", method=RequestMethod.GET)
    public JsonData listMyTasksDashboard() {
        List<Task> tasks = taskService.listMyTasksDashboard();
        return JsonData.success(tasks);
    }
    
    @RequestMapping(value="/task/countMyTasks", method=RequestMethod.GET)
    public JsonData countMyTasks() {
        Long count = taskService.countMyTasks();
        return JsonData.success(count);
    }
    
    @RequestMapping(value="/task/toTarget", method=RequestMethod.GET)
    public String toTarget(String id) {
        taskService.readTask(id);
        
        Task task = taskService.findTask(id);
        if(task.getTargetType().equals(TaskTargetType.EVALUATION)) {
            return "redirect:/evaluation/productDetail?id=" + task.getTargetId();
        }else if(task.getTargetType().equals(TaskTargetType.COPYRIGHT_CONTRACT)) {
            return "redirect:/copyright/contractDetail?id=" + task.getTargetId();
        }else if(task.getTargetType().equals(TaskTargetType.MAKE_TASK)) {
            return "redirect:/make/taskDetail?id=" + task.getTargetId();
        }else if(task.getTargetType().equals(TaskTargetType.MAKE_CONTRACT)) {
            return "redirect:/make/contractDetail?id=" + task.getTargetId();
        }else if(task.getTargetType().equals(TaskTargetType.SALE_CONTRACT)) {
            return "redirect:/sale/contractDetail?id=" + task.getTargetId();
        }
        return "";
    }
    
    private DataTableSource<Task> convertToDataTableSource(int draw, Page<Task> tasksPage) {
        DataTableSource<Task> dts = new DataTableSource<Task>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(tasksPage.getTotalRecord());
        dts.setRecordsFiltered(tasksPage.getTotalRecord());
        dts.setData(tasksPage.getData());
        
        return dts;
    }
}
