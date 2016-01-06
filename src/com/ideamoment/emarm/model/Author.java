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
@Entity(dataSet="T_AUTHOR")
public class Author extends HistoriableEntity {
    @Property(dataItem="C_NAME", type=DataItemType.VARCHAR, length=200)
    private String name;
    
    @Property(dataItem="C_PSEUDONYM", type=DataItemType.VARCHAR, length=200)
    private String pseudonym;
    
    @Property(dataItem="C_DESC", type=DataItemType.VARCHAR, length=200)
    private String desc;
    
    @Property(dataItem="C_FAMOUS", type=DataItemType.VARCHAR, length=1)
    private String famous = YesOrNo.NO;

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
     * @return the famous
     */
    public String getFamous() {
        return famous;
    }
    
    /**
     * @param famous the famous to set
     */
    public void setFamous(String famous) {
        this.famous = famous;
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
     * @return the pseudonym
     */
    public String getPseudonym() {
        return pseudonym;
    }
    
    /**
     * @param pseudonym the pseudonym to set
     */
    public void setPseudonym(String pseudonym) {
        this.pseudonym = pseudonym;
    }
}
