/**
 * 
 */
package com.ideamoment.emarm.model;

import java.util.Date;

import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_COPYRIGHT_CTRT_AUDIT")
public class CopyrightContractAudit extends BaseEntity {
    @Property(dataItem="C_CONTRACT_ID", type=DataItemType.VARCHAR, length=32)
    private String contractId;
    
    @Property(dataItem="C_AUDIT_REMARK", type=DataItemType.VARCHAR, length=300)
    private String auditRemark;
    
    @Property(dataItem="C_AUDITOR_ID", type=DataItemType.VARCHAR, length=32)
    private String auditorId;
    
    @Property(dataItem="C_AUDIT_TIME", type=DataItemType.DATETIME)
    private Date auditTime;
    
    @Property(dataItem="C_AUDIT_RESULT", type=DataItemType.VARCHAR, length=1)
    private String auditResult;

    @Ref
    private User auditor;
    
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
     * @return the auditRemark
     */
    public String getAuditRemark() {
        return auditRemark;
    }

    /**
     * @param auditRemark the auditRemark to set
     */
    public void setAuditRemark(String auditRemark) {
        this.auditRemark = auditRemark;
    }
    
    /**
     * @return the auditorId
     */
    public String getAuditorId() {
        return auditorId;
    }
    
    /**
     * @param auditorId the auditorId to set
     */
    public void setAuditorId(String auditorId) {
        this.auditorId = auditorId;
    }
    
    /**
     * @return the auditTime
     */
    public Date getAuditTime() {
        return auditTime;
    }
    
    /**
     * @param auditTime the auditTime to set
     */
    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }
    
    /**
     * @return the auditResult
     */
    public String getAuditResult() {
        return auditResult;
    }

    /**
     * @param auditResult the auditResult to set
     */
    public void setAuditResult(String auditResult) {
        this.auditResult = auditResult;
    }
    
    public String getAuditResultText() {
        if(this.auditResult.equals(YesOrNo.YES)) {
            return "通过";
        }else if(this.auditResult.equals(YesOrNo.YES)) {
            return "拒绝";
        }else{
            return "";
        }
    }
    
    /**
     * @return the auditor
     */
    public User getAuditor() {
        return auditor;
    }
    
    /**
     * @param auditor the auditor to set
     */
    public void setAuditor(User auditor) {
        this.auditor = auditor;
    }
    
}
