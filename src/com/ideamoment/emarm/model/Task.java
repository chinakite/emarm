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
@Entity(dataSet="T_TASK")
public class Task extends HistoriableEntity{
    @Property(dataItem="C_TITLE", type=DataItemType.VARCHAR, length=300)
    protected String title;
    
    @Property(dataItem="C_TARGET_TYPE", type=DataItemType.VARCHAR, length=2)
    protected String targetType;
    
    @Property(dataItem="C_TARGET_ID", type=DataItemType.VARCHAR, length=32)
    protected String targetId;
    
    @Property(dataItem="C_STATE", type=DataItemType.VARCHAR, length=2)
    protected String state;
    
    @Property(dataItem="C_USER_ID", type=DataItemType.VARCHAR, length=32)
    protected String userId;
    
    @Property(dataItem="C_ROLE_ID", type=DataItemType.VARCHAR, length=32)
    protected String roleId;

    
    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    
    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    
    /**
     * @return the targetType
     */
    public String getTargetType() {
        return targetType;
    }

    
    /**
     * @param targetType the targetType to set
     */
    public void setTargetType(String targetType) {
        this.targetType = targetType;
    }

    
    /**
     * @return the targetId
     */
    public String getTargetId() {
        return targetId;
    }

    
    /**
     * @param targetId the targetId to set
     */
    public void setTargetId(String targetId) {
        this.targetId = targetId;
    }

    
    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    
    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }
    
    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }
    
    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    /**
     * @return the roleId
     */
    public String getRoleId() {
        return roleId;
    }
    
    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
    
}
