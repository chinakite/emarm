/**
 * 
 */
package com.ideamoment.emarm.model;

import java.math.BigDecimal;

import com.ideamoment.emarm.util.CnUpperCase;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_COPYRIGHT_CTRT_PROD")
public class CopyrightContractProduct extends BaseEntity {
    
    @Property(dataItem="C_CONTRACT_ID", type=DataItemType.VARCHAR, length=32)
    private String contactId;
    
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_PRICE", type=DataItemType.DECIMAL)
    private BigDecimal price;

    
    /**
     * @return the contactId
     */
    public String getContactId() {
        return contactId;
    }

    
    /**
     * @param contactId the contactId to set
     */
    public void setContactId(String contactId) {
        this.contactId = contactId;
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
     * @return the price
     */
    public BigDecimal getPrice() {
        return price;
    }

    
    /**
     * @param price the price to set
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public String getCnPrice() {
        CnUpperCase cuc = new CnUpperCase(String.valueOf(this.price));
        return cuc.getCnString();
    }
}
