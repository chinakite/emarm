/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.emarm.model.enumeration.RoleType;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_USER")
public class User extends HistoriableEntity{
    @Property(dataItem="C_NAME", type=DataItemType.VARCHAR, length=60)
    private String name;
    
    @Property(dataItem="C_ACCOUNT", type=DataItemType.VARCHAR, length=60)
    private String account;
    
    @Property(dataItem="C_EMAIL", type=DataItemType.VARCHAR, length=60)
    private String email;
    
    @Property(dataItem="C_PASSWORD", type=DataItemType.VARCHAR, length=40)
    private String password;
    
    @Property(dataItem="C_MOBILE", type=DataItemType.VARCHAR, length=20)
    private String mobile;
    
    @Property(dataItem="C_ROLE", type=DataItemType.VARCHAR, length=60)
    private String role;
    
    @Property(dataItem="C_GENDER", type=DataItemType.VARCHAR, length=1)
    private String gender;
    
    /**
     * 敬称, 用于邮件等场合
     */
    @Property(dataItem="C_HONORIFIC", type=DataItemType.VARCHAR, length=60)
    private String honorific;
    
    /**
     * 头像
     */
    @Property(dataItem="C_LOGOURL", type=DataItemType.VARCHAR, length=500)
    private String logoUrl;
    
    /**
     * 状态:禁用\启用
     */
    @Property(dataItem="C_STATUS", type=DataItemType.VARCHAR, length=1)
    private String status;

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }
    
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * @return the account
     */
    public String getAccount() {
        return account;
    }
    
    /**
     * @param account the account to set
     */
    public void setAccount(String account) {
        this.account = account;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }
    
    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    /**
     * @return the mobile
     */
    public String getMobile() {
        return mobile;
    }
    
    /**
     * @param mobile the mobile to set
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * @return the roles
     */
    public String getRole() {
        return role;
    }

    /**
     * @param roles the roles to set
     */
    public void setRole(String role) {
        this.role = role;
    }
    
    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }
    
    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the honorific
     */
    public String getHonorific() {
        return honorific;
    }

    /**
     * @param honorific the honorific to set
     */
    public void setHonorific(String honorific) {
        this.honorific = honorific;
    }

    /**
     * @return the logoUrl
     */
    public String getLogoUrl() {
        return logoUrl;
    }
    
    /**
     * @param logoUrl the logoUrl to set
     */
    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    
    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getRoleText() {
        if(role == null) {
            return "";
        }
        return this.role.replace("01", RoleType.NORMAL_TEXT)
                        .replace("03", RoleType.EVALUATOR_MGR_TEXT)
                        .replace("11", RoleType.COPYRIGHT_OPR_TEXT)
                        .replace("12", RoleType.COPYRIGHT_DIRECTOR_TEXT)
                        .replace("13", RoleType.COPYRIGHT_MANAGER_TEXT)
                        .replace("21", RoleType.MAKE_OPR_TEXT)
                        .replace("22", RoleType.MAKE_MGR_TEXT)
                        .replace("31", RoleType.SALE_OPR)
                        .replace("32", RoleType.SALE_MGR_TEXT)
                        .replace("40", RoleType.MEDIA_MGR_TEXT)
                        .replace("51", RoleType.EXT_EVALUATOR_TEXT)
                        .replace("52", RoleType.EXT_MAKER_TEXT)
                        .replace("53", RoleType.EXT_EMCEE_TEXT)
                        .replace("80", RoleType.LAWYER_TEXT)
                        .replace("99", RoleType.SUPER_ADMIN_TEXT)
                        .replace("90", RoleType.CEO_TEXT)
                        .replaceAll(",", "、");
    }
}
