/**
 * 
 */
package com.ideamoment.emarm.user.action;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.user.service.UserService;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideadp.usercontext.UserContext;

/**
 * @author Chinakite
 *
 */
@Controller
public class UserAction {
    @Autowired
    private UserService userService;

    /**
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }
    
    /**
     * @param userService the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    // ------------------ 方法区 ----------------------
    
    @RequestMapping(value="/system/userPage", method=RequestMethod.GET)
    public ModelAndView toUsers() {
        return new ModelAndView("/WEB-INF/jsp/user/user.jsp");
    }
    
    @RequestMapping(value="/system/users", method=RequestMethod.GET)
    public JsonData listUsers(String key, String role, String status) {
        List<User> users = userService.listUsers(key, role, status);
        return JsonData.success(users);
    }
    
    @RequestMapping(value="/system/extMakers", method=RequestMethod.GET)
    public JsonData listExtMakers() {
        List<User> users = userService.listExtMakers();
        return JsonData.success(users);
    }
    
    @RequestMapping(value="/system/user/{id}", method=RequestMethod.GET)
    public JsonData findUser(@PathVariable String id) {
        User user = userService.findUser(id);
        return JsonData.success(user);
    }
    
    @RequestMapping(value="/system/user", method=RequestMethod.POST)
    public JsonData createUser(String account, 
                               String name,
                               String email,
                               String mobile,
                               String honorific,
                               String role) {
        User user = userService.createUser(account, name, email, mobile, honorific, role);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/user/{id}", method=RequestMethod.POST)
    public JsonData updateUser(@PathVariable String id, 
                               String account, 
                               String name,
                               String email,
                               String mobile,
                               String honorific,
                               String role) {
        int r = userService.updateUser(id, account, name, email, mobile, honorific, role);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/user/{id}", method=RequestMethod.DELETE)
    public JsonData deleteUser(@PathVariable String id) {
        int r = userService.deleteUser(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/disableUser", method=RequestMethod.POST)
    public JsonData disableUser(String id) {
        int r = userService.disableUser(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/enableUser", method=RequestMethod.POST)
    public JsonData enableUser(String id) {
        int r = userService.enableUser(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/batchDeleteUser", method=RequestMethod.DELETE)
    public JsonData batchDeleteUser(String ids) {
        String[] idArray = ids.split(",");
        
        userService.batchDeleteUsers(idArray);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public ModelAndView toLogin() {
        return new ModelAndView("/login.jsp");
    }
    
    @RequestMapping(value="/evalogin", method=RequestMethod.GET)
    public ModelAndView toEvaluatorLogin(String productId) {
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("productId", productId);
        
        return new ModelAndView("/evaLogin.jsp", model);
    }
    
    @RequestMapping(value="/evaUserLogin", method=RequestMethod.POST)
    public ModelAndView evaluatorLogin(String userName, String password, String productId) {
        User user = userService.login(userName, password);
        
        UserContext context = UserContext.getCurrentContext();
        context.getRequest().getSession().setAttribute(UserContext.SESSION_USER, user);
        context.setContextAttribute(UserContext.SESSION_USER, user);
        
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("user", user);
        
        return new ModelAndView("redirect:/evaluation/toDoEvaluation?productId=" + productId, model);
    }
    
    @RequestMapping(value="/userlogin", method=RequestMethod.POST)
    public ModelAndView login(String userName, String password, String rememberMe) {
        User user = userService.login(userName, password);
        
        UserContext context = UserContext.getCurrentContext();
        context.getRequest().getSession().setAttribute(UserContext.SESSION_USER, user);
        context.setContextAttribute(UserContext.SESSION_USER, user);
        
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("user", user);
        
        return new ModelAndView("redirect:/home", model);
    }
    
    @RequestMapping(value="/home", method=RequestMethod.GET)
    public ModelAndView home() {
        return new ModelAndView("/WEB-INF/jsp/dashboard.jsp");
    }
    
    @RequestMapping(value="/comingsoon", method=RequestMethod.GET)
    public ModelAndView comingsoon() {
        return new ModelAndView("/comingsoon.jsp");
    }
    
    @RequestMapping(value="/user/toChangePwd", method=RequestMethod.GET)
    public ModelAndView toChangePwd() {
        return new ModelAndView("/WEB-INF/jsp/user/changePwd.jsp");
    }
    
    @RequestMapping(value="/user/changePwd", method=RequestMethod.POST)
    public JsonData changePwd(String oldPwd, String newPwd) {
        oldPwd = oldPwd.trim();
        newPwd = newPwd.trim();
        String result = userService.changePwd(oldPwd, newPwd);
        
        if(result.equals("success")) {
            return JsonData.SUCCESS;
        }else{
            return JsonData.success(result);
        }
    }
    
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout() {
        UserContext context = UserContext.getCurrentContext();
        context.getRequest().getSession().removeAttribute(UserContext.SESSION_USER);
        context.getRequest().getSession().invalidate();
        return "redirect:/login";
    }
    
    @RequestMapping(value="/reservedlogin", method=RequestMethod.GET)
    public ModelAndView toReservedLogin() {
        return new ModelAndView("/reservedLogin.jsp");
    }
    
    @RequestMapping(value="/reservedUserLogin", method=RequestMethod.POST)
    public String reservedLogin(String userName, String password) {
        User user = userService.login(userName, password);
        
        UserContext context = UserContext.getCurrentContext();
        context.getRequest().getSession().setAttribute(UserContext.SESSION_USER, user);
        context.setContextAttribute(UserContext.SESSION_USER, user);
        
        return "redirect:/reserved/productPage";
    }
    
    @RequestMapping(value="/mklogin", method=RequestMethod.GET)
    public ModelAndView toMakeLogin() {
        return new ModelAndView("/makeLogin.jsp");
    }
    
    @RequestMapping(value="/mkUserLogin", method=RequestMethod.POST)
    public String makeLogin(String userName, String password) {
        User user = userService.login(userName, password);
        
        UserContext context = UserContext.getCurrentContext();
        context.getRequest().getSession().setAttribute(UserContext.SESSION_USER, user);
        context.setContextAttribute(UserContext.SESSION_USER, user);
        
        return "redirect:/make/extMyTaskPage";
    }
}
