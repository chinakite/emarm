/**
 * 
 */
package com.ideamoment.emarm.email.service;

import java.util.Date;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.EmailSetting;
import com.ideamoment.emarm.model.User;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class EmailSettingService {

    @IdeaJdbcTx
    public EmailSetting findEmailSetting(String id) {
        return IdeaJdbc.find(EmailSetting.class, id);
    }

    @IdeaJdbcTx
    public void saveEmailSetting(EmailSetting email) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        String userId = curUser.getId();
        
        email.setModifier(userId);
        email.setModifyTime(new Date());
        email.setType("1");
        
        IdeaJdbc.update(email);
    }

    @IdeaJdbcTx
    public boolean testEmailSetting(EmailSetting email, String testEmail) throws Exception{
        HtmlEmail testemail = new HtmlEmail(); 
        
        // 这里是SMTP发送服务器的名字：163的如下："smtp.163.com"  
        testemail.setHostName(email.getHostName());  
        testemail.setSmtpPort(Integer.valueOf(email.getPort()));
        // 字符编码集的设置  
        testemail.setCharset("UTF-8");  
        // 收件人的邮箱  
        testemail.addTo(testEmail);  
        // 发送人的邮箱  
        testemail.setFrom(email.getFromEmail(), email.getFromName());  
        // 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码  
        testemail.setAuthentication(email.getUserName(), email.getPassword());  
        // 要发送的邮件主题  
        testemail.setSubject("悦库时光测试邮件");  
        // 要发送的信息，由于使用了HtmlEmail，可以在邮件内容中使用HTML标签  
        testemail.setMsg("<p>收到此邮件表示邮件设置成功，可以保存了，请勿回复。</p>");  
        // 发送  
        testemail.send(); 
        
        return true;
    }

}
