/**
 * 
 */
package com.ideamoment.emarm.user.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.Constants;
import com.ideamoment.emarm.model.enumeration.UserState;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.emarm.user.LoginException;
import com.ideamoment.emarm.user.LoginExceptionCode;
import com.ideamoment.emarm.user.dao.UserDao;
import com.ideamoment.ideadp.exception.IdeaDataException;
import com.ideamoment.ideadp.exception.IdeaDataExceptionCode;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideadp.util.CodecUtils;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    /**
     * @return the userDao
     */
    public UserDao getUserDao() {
        return userDao;
    }
    
    /**
     * @param userDao the userDao to set
     */
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @IdeaJdbcTx
    public User login(String account, String password) {
        User user = userDao.queryUser(account, null);
        if(user == null) {
            throw new LoginException(LoginExceptionCode.USER_NOT_FOUND, String.format("User[%s] is not found.", account));
        }else{
            String dbPwd = user.getPassword();
            String inputPwd = CodecUtils.md5(password);
            if(dbPwd.equals(inputPwd)) {
                return user;
            }else{
                throw new LoginException(LoginExceptionCode.PASSWORD_NOT_CORRECT, String.format("Admin[%s] password is not correct.", account));
            }
        }
    }

    @IdeaJdbcTx
    public List<User> listUsers(String key, String role, String status) {
        if(StringUtils.isBlank(key)) {
            key = null;
        }
        if(StringUtils.isBlank(role)) {
            role = null;
        }
        if(StringUtils.isBlank(status) || status.equals("-1")) {
            status = null;
        }
        
        List<User> users = userDao.queryUser(key, role, status);
        return users;
    }

    @IdeaJdbcTx
    public User createUser(String account,
                           String name,
                           String email,
                           String mobile,
                           String honorific,
                           String gender,
                           String role)
    {
        checkExists(account, email, mobile, null);
        
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        User user = new User();
        user.setAccount(account);
        user.setCreateTime(new Date());
        user.setCreator(optUser.getId());
        user.setEmail(email);
        user.setGender(gender);
        user.setHonorific(honorific);
        user.setLogoUrl(Constants.DEFAULT_USER_LOGO_URL);
        user.setMobile(mobile);
        user.setName(name);
        user.setPassword(Constants.DEFAULT_PASSWORD);
        user.setRole(role);
        user.setStatus(UserState.ENABLED);
        
        IdeaJdbc.save(user);
        
        return user;
    }
    
    private void checkExists(String account, String email, String mobile, String ignoreId) {
        User user = userDao.queryUser(account, ignoreId);
        if(user != null) {
            throw new IdeaDataException(IdeaDataExceptionCode.DUPLICATED_DATA, String.format("User account[%s]", account));
        }
        user = userDao.queryUserByEmail(email, ignoreId);
        if(user != null) {
            throw new IdeaDataException(IdeaDataExceptionCode.DUPLICATED_DATA, String.format("User email[%s]", email));
        }
        user = userDao.queryUserByMobile(mobile, ignoreId);
        if(user != null) {
            throw new IdeaDataException(IdeaDataExceptionCode.DUPLICATED_DATA, String.format("User mobile[%s]", mobile));
        }
    }
    
    @IdeaJdbcTx
    public User findUser(String id) {
        return IdeaJdbc.find(User.class, id);
    }

    @IdeaJdbcTx
    public int updateUser(String id,
                          String account,
                          String name,
                          String email,
                          String mobile,
                          String honorific,
                          String gender,
                          String role)
    {
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        User user = IdeaJdbc.find(User.class, id);
        
        if(user == null) {
            throw dataNotFoundException(id);
        }else{
            checkExists(account, email, mobile, id);
            
            user.setAccount(account);
            user.setModifyTime(new Date());
            user.setModifier(optUser.getId());
            user.setEmail(email);
            user.setGender(gender);
            user.setHonorific(honorific);
            user.setMobile(mobile);
            user.setName(name);
            user.setRole(role);
            
            return IdeaJdbc.update(user);
        }
    }
    
    private RuntimeException duplicateException(String name) {
        return new IdeaDataException(IdeaDataExceptionCode.DUPLICATED_DATA, String.format("Subject[%s] is exists.", name));
    }
    
    private RuntimeException dataNotFoundException(String id) {
        return new IdeaDataException(IdeaDataExceptionCode.DATA_NOU_FOUND, String.format("User[%s] is not found.", id));
    }

    @IdeaJdbcTx
    public int deleteUser(String id) {
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        User user = IdeaJdbc.find(User.class, id);
        
        if(user == null) {
            throw dataNotFoundException(id);
        }else{
            user.setStatus(UserState.DELETED);
            return IdeaJdbc.update(user);
        }
    }

    @IdeaJdbcTx
    public void batchDeleteUsers(String[] idArray) {
        userDao.batchDeleteSubjects(idArray);
    }

    @IdeaJdbcTx
    public int disableUser(String id) {
        User user = IdeaJdbc.find(User.class, id);
        
        if(user == null) {
            throw dataNotFoundException(id);
        }else{
            return IdeaJdbc.update(User.class, id)
                            .setProperty("status", UserState.DISABLED)
                            .execute();
        }
    }
    
    @IdeaJdbcTx
    public int enableUser(String id) {
        User user = IdeaJdbc.find(User.class, id);
        
        if(user == null) {
            throw dataNotFoundException(id);
        }else{
            return IdeaJdbc.update(User.class, id)
                            .setProperty("status", UserState.ENABLED)
                            .execute();
        }
    }
}
