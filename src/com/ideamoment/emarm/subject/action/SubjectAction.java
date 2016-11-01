/**
 * 
 */
package com.ideamoment.emarm.subject.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.model.Subject;
import com.ideamoment.emarm.subject.service.SubjectService;
import com.ideamoment.ideadp.restful.json.JsonData;

/**
 * @author Chinakite
 *
 */
@Controller
public class SubjectAction {
    
    @Autowired
    private SubjectService subjectService;
    
    /**
     * @return the subjectService
     */
    public SubjectService getSubjectService() {
        return subjectService;
    }
    
    /**
     * @param subjectService the subjectService to set
     */
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }
    
    // ------------------ 方法区 ----------------------
    
    @RequestMapping(value="/system/subjectPage", method=RequestMethod.GET)
    public ModelAndView toSubjects() {
        return new ModelAndView("/WEB-INF/jsp/subject/subject.jsp");
    }
    
    @RequestMapping(value="/system/textSubjects", method=RequestMethod.GET)
    public JsonData listTextSubjects(String key) {
        List<Subject> subjects = subjectService.listTextSubjects(key);
        return JsonData.success(subjects);
    }
    
    @RequestMapping(value="/system/subject/{id}", method=RequestMethod.GET)
    public JsonData findSubject(@PathVariable String id) {
        Subject subject = subjectService.findSubject(id);
        return JsonData.success(subject);
    }
    
    @RequestMapping(value="/system/textSubject", method=RequestMethod.POST)
    public JsonData createTextSubject(String name, String desc, String ratio) {
        Subject subject = subjectService.createTextSubject(name, desc, ratio);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/subject/{id}", method=RequestMethod.POST)
    public JsonData updateSubject(@PathVariable String id, String name, String desc, String ratio) {
        int r = subjectService.updateSubject(id, name, desc, ratio);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/subject/{id}", method=RequestMethod.DELETE)
    public JsonData deleteSubject(@PathVariable String id) {
        int r = subjectService.deleteSubject(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/batchDeleteSubject", method=RequestMethod.DELETE)
    public JsonData batchDeleteSubject(String ids) {
        String[] idArray = ids.split(",");
        
        subjectService.batchDeleteSubjects(idArray);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/upSubject", method=RequestMethod.POST)
    public JsonData upSubject(String id) {
        int r = subjectService.upSubject(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/downSubject", method=RequestMethod.POST)
    public JsonData downSubject(String id) {
        int r = subjectService.downSubject(id);
        return JsonData.SUCCESS;
    }
}
