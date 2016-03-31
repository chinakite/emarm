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
@Entity(dataSet="T_EVA_INVITATION")
public class EvaluationInvitation extends HistoriableEntity {
    @Property(dataItem="C_USER_ID", type=DataItemType.VARCHAR, length=32)
    private String userId;
    
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_CONTENT", type=DataItemType.VARCHAR, length=4000)
    private String content;
    
    @Property(dataItem="C_EVA_STATE", type=DataItemType.VARCHAR, length=2)
    private String evaluationState;

    
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
     * @return the content
     */
    public String getContent() {
        return content;
    }

    
    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }
    
    /**
     * @return the evaluationState
     */
    public String getEvaluationState() {
        return evaluationState;
    }
    
    /**
     * @param evaluationState the evaluationState to set
     */
    public void setEvaluationState(String evaluationState) {
        this.evaluationState = evaluationState;
    }
    
    /**
     * @return the evaluationState
     */
    public String getEvaluationStateText() {
        if(this.evaluationState.equals(YesOrNo.YES)) {
            return "已评价";
        }else{
            return "未评价";
        }
    }
}
