/**
 * 
 */
package com.ideamoment.emarm.model;

import java.util.Date;

import com.ideamoment.emarm.model.enumeration.ContractDocType;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_SALE_CTRT_DOC")
public class SaleContractDoc extends BaseEntity {
    @Property(dataItem="C_CONTRACT_ID", type=DataItemType.VARCHAR, length=32)
    private String contractId;
    
    @Property(dataItem="C_CREATOR_ID", type=DataItemType.VARCHAR, length=32)
    private String creatorId;
    
    @Property(dataItem="C_CREATETIME", type=DataItemType.DATETIME)
    private Date createTime;
    
    @Property(dataItem="C_VERSION", type=DataItemType.VARCHAR, length=10)
    private String version;
    
    @Property(dataItem="C_FILE_URL", type=DataItemType.VARCHAR, length=500)
    private String fileUrl;
    
    @Property(dataItem="C_TYPE", type=DataItemType.VARCHAR, length=1)
    private String type = ContractDocType.CONTRACT_DOC;
    
    @Ref
    private User creator;

    
    /**
     * @return the contractId
     */
    public String getContractId() {
        return contractId;
    }

    
    /**
     * @param contractId the contractId to set
     */
    public void setContractId(String contractId) {
        this.contractId = contractId;
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
     * @return the version
     */
    public String getVersion() {
        return version;
    }
    
    /**
     * @param version the version to set
     */
    public void setVersion(String version) {
        this.version = version;
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
    
    public String getTypeText() {
        if(ContractDocType.CONTRACT_DOC.equals(this.type)) {
            return ContractDocType.CONTRACT_DOC_TEXT;
        }else{
            return ContractDocType.CONTRACT_ADDON_TEXT;
        }
    }
}
