/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_MAKE_TASK_AUDIO_AUDIT")
public class MakeTaskAudioAudit extends HistoriableEntity {
    @Property(dataItem="C_MAKE_TASK_AUDIO_ID", type=DataItemType.VARCHAR, length=32)
    private String makeTaskAudioId;
    
    @Property(dataItem="C_RESULT", type=DataItemType.VARCHAR, length=2)
    private String result;
    
    @Property(dataItem="C_REMARK", type=DataItemType.VARCHAR, length=600)
    private String remark;
    
    @Ref
    private User auditor;
    
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
     * @return the result
     */
    public String getResult() {
        return result;
    }
    
    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }
    
    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }
    
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    
    /**
     * @return the auditor
     */
    public User getAuditor() {
        return auditor;
    }
    
    /**
     * @param auditor the auditor to set
     */
    public void setAuditor(User auditor) {
        this.auditor = auditor;
    }
    
}
