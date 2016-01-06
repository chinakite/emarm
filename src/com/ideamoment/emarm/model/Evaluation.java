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
@Entity(dataSet="T_EVALUATION")
public class Evaluation extends HistoriableEntity {
    
    @Property(dataItem="C_USER_ID", type=DataItemType.VARCHAR, length=32)
    private String userId;
    
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_STORY_FRAME", type=DataItemType.INT)
    private int storyFrame;
    
    @Property(dataItem="C_STORY_TEXT", type=DataItemType.INT)
    private int storyText;
    
    @Property(dataItem="C_STORY_ROLE", type=DataItemType.INT)
    private int storyRole;
    
    @Property(dataItem="C_STORY_TARGET_GENDER", type=DataItemType.VARCHAR, length=2)
    private String targetGender;
    
    @Property(dataItem="C_STORY_TARGET_AGE", type=DataItemType.VARCHAR, length=2)
    private String targetAge;
    
    @Property(dataItem="C_STORY_TARGET_POSITION", type=DataItemType.VARCHAR, length=2)
    private String targetPosition;
    
    @Property(dataItem="C_STORY_SUGGEST", type=DataItemType.VARCHAR, length=1000)
    private String storySuggest;
    
    @Property(dataItem="C_MAKE_AUDIO_EDIT", type=DataItemType.INT)
    private int audioEdit;
    
    @Property(dataItem="C_MAKE_PLAY_TYPE", type=DataItemType.VARCHAR, length=40)
    private String playType;
    
    @Property(dataItem="C_MAKE_PLAY_STYLE", type=DataItemType.VARCHAR, length=40)
    private String playStyle;
    
    @Property(dataItem="C_MAKE_SUGGEST", type=DataItemType.VARCHAR, length=1000)
    private String makeSuggest;

    
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
     * @return the productId
     */
    public String getProductId() {
        return productId;
    }

    
    /**
     * @param productId the productId to set
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    
    /**
     * @return the storyFrame
     */
    public int getStoryFrame() {
        return storyFrame;
    }

    
    /**
     * @param storyFrame the storyFrame to set
     */
    public void setStoryFrame(int storyFrame) {
        this.storyFrame = storyFrame;
    }

    
    /**
     * @return the storyText
     */
    public int getStoryText() {
        return storyText;
    }

    
    /**
     * @param storyText the storyText to set
     */
    public void setStoryText(int storyText) {
        this.storyText = storyText;
    }

    
    /**
     * @return the storyRole
     */
    public int getStoryRole() {
        return storyRole;
    }

    
    /**
     * @param storyRole the storyRole to set
     */
    public void setStoryRole(int storyRole) {
        this.storyRole = storyRole;
    }

    
    /**
     * @return the targetGender
     */
    public String getTargetGender() {
        return targetGender;
    }

    
    /**
     * @param targetGender the targetGender to set
     */
    public void setTargetGender(String targetGender) {
        this.targetGender = targetGender;
    }

    
    /**
     * @return the targetAge
     */
    public String getTargetAge() {
        return targetAge;
    }

    
    /**
     * @param targetAge the targetAge to set
     */
    public void setTargetAge(String targetAge) {
        this.targetAge = targetAge;
    }

    
    /**
     * @return the targetPosition
     */
    public String getTargetPosition() {
        return targetPosition;
    }

    
    /**
     * @param targetPosition the targetPosition to set
     */
    public void setTargetPosition(String targetPosition) {
        this.targetPosition = targetPosition;
    }

    
    /**
     * @return the storySuggest
     */
    public String getStorySuggest() {
        return storySuggest;
    }

    
    /**
     * @param storySuggest the storySuggest to set
     */
    public void setStorySuggest(String storySuggest) {
        this.storySuggest = storySuggest;
    }

    
    /**
     * @return the audioEdit
     */
    public int getAudioEdit() {
        return audioEdit;
    }

    
    /**
     * @param audioEdit the audioEdit to set
     */
    public void setAudioEdit(int audioEdit) {
        this.audioEdit = audioEdit;
    }

    
    /**
     * @return the playType
     */
    public String getPlayType() {
        return playType;
    }

    
    /**
     * @param playType the playType to set
     */
    public void setPlayType(String playType) {
        this.playType = playType;
    }

    
    /**
     * @return the playStyle
     */
    public String getPlayStyle() {
        return playStyle;
    }

    
    /**
     * @param playStyle the playStyle to set
     */
    public void setPlayStyle(String playStyle) {
        this.playStyle = playStyle;
    }

    
    /**
     * @return the makeSuggest
     */
    public String getMakeSuggest() {
        return makeSuggest;
    }

    
    /**
     * @param makeSuggest the makeSuggest to set
     */
    public void setMakeSuggest(String makeSuggest) {
        this.makeSuggest = makeSuggest;
    }

    
    
}
