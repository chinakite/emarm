/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_EMAIL_SETTING")
public class EmailSetting extends HistoriableEntity {
    @Property(dataItem="C_HOSTNAME", type=DataItemType.VARCHAR, length=200)
    private String hostName;
    
    @Property(dataItem="C_PORT", type=DataItemType.VARCHAR, length=5)
    private String port;
    
    @Property(dataItem="C_TYPE", type=DataItemType.VARCHAR, length=2)
    private String type;
    
    @Property(dataItem="C_FROM_EMAIL", type=DataItemType.VARCHAR, length=200)
    private String fromEmail;
    
    @Property(dataItem="C_FROM_NAME", type=DataItemType.VARCHAR, length=200)
    private String fromName;
    
    @Property(dataItem="C_USER_NAME", type=DataItemType.VARCHAR, length=200)
    private String userName;
    
    @Property(dataItem="C_PASSWORD", type=DataItemType.VARCHAR, length=50)
    private String password;
    
    @Property(dataItem="C_SSL", type=DataItemType.VARCHAR, length=2)
    private String ssl;

    
    /**
     * @return the hostName
     */
    public String getHostName() {
        return hostName;
    }

    
    /**
     * @param hostName the hostName to set
     */
    public void setHostName(String hostName) {
        this.hostName = hostName;
    }

    
    /**
     * @return the port
     */
    public String getPort() {
        return port;
    }

    
    /**
     * @param port the port to set
     */
    public void setPort(String port) {
        this.port = port;
    }

    
    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    
    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    
    /**
     * @return the fromEmail
     */
    public String getFromEmail() {
        return fromEmail;
    }

    
    /**
     * @param fromEmail the fromEmail to set
     */
    public void setFromEmail(String fromEmail) {
        this.fromEmail = fromEmail;
    }

    
    /**
     * @return the fromName
     */
    public String getFromName() {
        return fromName;
    }

    
    /**
     * @param fromName the fromName to set
     */
    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    
    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    
    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
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
     * @return the ssl
     */
    public String getSsl() {
        return ssl;
    }

    
    /**
     * @param ssl the ssl to set
     */
    public void setSsl(String ssl) {
        this.ssl = ssl;
    }
    
    
}
