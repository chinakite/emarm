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
@Entity(dataSet="T_MAKE_TASK_AUDIO_FILE")
public class MakeTaskAudioFile extends HistoriableEntity {
    @Property(dataItem="C_MAKE_TASK_AUDIO_ID", type=DataItemType.VARCHAR, length=32)
    private String makeTaskAudioId;
    
    @Property(dataItem="C_VERSION", type=DataItemType.VARCHAR, length=30)
    private String version;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=1000)
    private String fileUrl;

    
    /**
     * @return the makeTaskAudioId
     */
    public String getMakeTaskAudioId() {
        return makeTaskAudioId;
    }

    
    /**
     * @param makeTaskAudioId the makeTaskAudioId to set
     */
    public void setMakeTaskAudioId(String makeTaskAudioId) {
        this.makeTaskAudioId = makeTaskAudioId;
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
