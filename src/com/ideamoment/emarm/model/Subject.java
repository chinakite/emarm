/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_SUBJECT")
public class Subject extends HistoriableEntity {
    @Property(dataItem="C_NAME", type=DataItemType.VARCHAR, length=100)
    private String name;
    
    @Property(dataItem="C_DESC", type=DataItemType.VARCHAR, length=500)
    private String desc;
    
    @Property(dataItem="C_ORDER", type=DataItemType.INT)
    private int order;

    @Property(dataItem="C_TYPE", type=DataItemType.VARCHAR)
    private String type = ProductType.TEXT;
    
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
     * @return the order
     */
    public int getOrder() {
        return order;
    }
    
    /**
     * @param order the order to set
     */
    public void setOrder(int order) {
        this.order = order;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
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
    
}
