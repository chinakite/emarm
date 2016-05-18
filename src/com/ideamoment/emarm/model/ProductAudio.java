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
@Entity(dataSet="T_PRODUCT_AUDIO")
public class ProductAudio extends HistoriableEntity{
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_NAME", type=DataItemType.VARCHAR, length=200)
    private String name;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=1000)
    private String fileUrl;
    
    @Property(dataItem="C_IS_SAMPLE", type=DataItemType.VARCHAR, length=2)
    private String isSample = YesOrNo.NO;

    
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
     * @return the name
     */
    public String getName() {
        return name;
    }

    
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
     * @return the isSample
     */
    public String getIsSample() {
        return isSample;
    }
    
    /**
     * @param isSample the isSample to set
     */
    public void setIsSample(String isSample) {
        this.isSample = isSample;
    }
}
