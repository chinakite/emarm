/**
 * 
 */
package com.ideamoment.emarm.model;

import java.util.Date;

import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_PRODUCT_COPYRIGHT_FILE")
public class ProductCopyrightFile extends BaseEntity{
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_CREATOR_ID", type=DataItemType.VARCHAR, length=32)
    private String creatorId;
    
    @Property(dataItem="C_CREATETIME", type=DataItemType.DATETIME)
    private Date createTime;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=500)
    private String fileUrl;
    
    @Ref
    private User creator;

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
    
    /**
     * @return the creator
     */
    public User getCreator() {
        return creator;
    }
    
    /**
     * @param creator the creator to set
     */
    public void setCreator(User creator) {
        this.creator = creator;
    }
    
}
