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
@Entity(dataSet="T_MAKE_TASK_AUDIO")
public class MakeTaskAudio extends HistoriableEntity {
    
    @Property(dataItem="C_MAKE_TASK_ID", type=DataItemType.VARCHAR, length=32)
    private String makeTaskId;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=1000)
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
