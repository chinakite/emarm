/**
 * 
 */
package com.ideamoment.emarm.model;

import java.util.Date;

import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_MAKE_TASK_CPFILE")
public class MakeTaskCopyrightFile extends BaseEntity {
    @Property(dataItem="C_MAKE_TASK_ID", type=DataItemType.VARCHAR, length=32)
    private String makeTaskId;
    
    @Property(dataItem="C_CREATOR_ID", type=DataItemType.VARCHAR, length=32)
    private String creatorId;
    
    @Property(dataItem="C_CREATETIME", type=DataItemType.DATETIME)
    private Date createTime;
    
    @Property(dataItem="C_VERSION", type=DataItemType.VARCHAR, length=10)
    private String version;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=500)
    private String fileUrl;

    
    /**
     * @return the makeTaskId
     */
    public String getMakeTaskId() {
        return makeTaskId;
    }

    /**
     * @param makeTaskId the makeTaskId to set
     */
    public void setMakeTaskId(String makeTaskId) {
        this.makeTaskId = makeTaskId;
    }
    
    /**
     * @return the creatorId
     */
    public String getCreatorId() {
        return creatorId;
    }
    
    /**
     * @param creatorId the creatorId to set
     */
    public void setCreatorId(String creatorId) {
        this.creatorId = creatorId;
    }
    
    /**
     * @return the createTime
     */
    public Date getCreateTime() {
        return createTime;
    }
    
    /**
     * @param createTime the createTime to set
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return the version
     */
    public String getVersion() {
        return version;
    }

    /**
     * @param version the version to set
     */
    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * @return the fileUrl
     */
    public String getFileUrl() {
        return fileUrl;
    }
    
    /**
     * @param fileUrl the fileUrl to set
     */
    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }
    
}
