/**
 * 
 */
package com.ideamoment.emarm.email.action;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.email.service.EmailSettingService;
import com.ideamoment.emarm.model.EmailSetting;
import com.ideamoment.ideadp.restful.json.JsonData;

/**
 * @author Chinakite
 *
 */
@Controller
public class EmailSettingAction {
    @Autowired
    private EmailSettingService emailSettingService;

    /**
     * @return the emailSettingService
     */
    public EmailSettingService getEmailSettingService() {
        return emailSettingService;
    }
    
    /**
     * @param emailSettingService the emailSettingService to set
     */
    public void setEmailSettingService(EmailSettingService emailSettingService) {
        this.emailSettingService = emailSettingService;
    }
    
    @RequestMapping(value="/system/emailSettingPage", method=RequestMethod.GET)
    public ModelAndView toSettingPage() {
        EmailSetting email = emailSettingService.findEmailSetting("1");
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("email", email);
        return new ModelAndView("/WEB-INF/jsp/email/setting.jsp", model);
    }
    
    @RequestMapping(value="/system/emailSetting", method=RequestMethod.POST)
    public JsonData saveEmailSetting(String hostName, 
                                     String port,
                                     String fromEmail,
                                     String fromName,
                                     String userName,
                                     String password,
                                     String ssl) {
        EmailSetting email = emailSettingService.findEmailSetting("1");
        email.setFromEmail(fromEmail);
        email.setFromName(fromName);
        email.setHostName(hostName);
        email.setPassword(password);
        email.setPort(port);
        email.setSsl(ssl);
        email.setUserName(userName);
        
        emailSettingService.saveEmailSetting(email);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/testSetting", method=RequestMethod.POST)
    public JsonData testEmailSetting(String hostName, 
                                     String port,
                                     String fromEmail,
                                     String fromName,
                                     String userName,
                                     String password,
                                     String ssl,
                                     String testEmail) {
        EmailSetting email = new EmailSetting();
        email.setFromEmail(fromEmail);
        email.setFromName(fromName);
        email.setHostName(hostName);
        email.setPassword(password);
        email.setPort(port);
        email.setSsl(ssl);
        email.setUserName(userName);
        
        try {
            boolean result = emailSettingService.testEmailSetting(email, testEmail);
            return JsonData.SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return JsonData.warning("failed", "测试失败:" + e.getMessage());
        }
        
        
    }
}
