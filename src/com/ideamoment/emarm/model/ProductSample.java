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
@Entity(dataSet="T_PRODUCT_SAMPLE")
public class ProductSample extends HistoriableEntity{
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=500)
    private String fileUrl;

    
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
