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
@Entity(dataSet="T_PRODUCT_RESERVED")
public class ProductReservedInfo extends HistoriableEntity {
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_DESC", type=DataItemType.VARCHAR, length=600)
    private String desc;
    
    @Property(dataItem="C_STATE", type=DataItemType.VARCHAR, length=2)
    private String state;

    
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
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    
    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
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
