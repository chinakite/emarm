/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.emarm.model.enumeration.YesOrNo;
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
    
    @Property(dataItem="C_TITLE", type=DataItemType.VARCHAR, length=300)
    private String title;
    
    @Property(dataItem="C_STATE", type=DataItemType.VARCHAR, length=2)
    private String state = YesOrNo.NO;
    
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
    
}
