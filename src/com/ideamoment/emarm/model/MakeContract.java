/**
 * 
 */
package com.ideamoment.emarm.model;

import java.math.BigDecimal;

import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_MAKE_CONTRACT")
public class MakeContract extends HistoriableEntity {
    @Property(dataItem="C_CODE", type=DataItemType.VARCHAR, length=20)
    private String code;

    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_TARGET_TYPE", type=DataItemType.VARCHAR, length=1)
    private String targetType;
    
    @Property(dataItem="C_OWNER", type=DataItemType.VARCHAR, length=60)
    private String owner;
    
    @Property(dataItem="C_OWNER_CONTACT", type=DataItemType.VARCHAR, length=60)
    private String ownerContact;
    
    @Property(dataItem="C_OWNER_CONTACT_PHONE", type=DataItemType.VARCHAR, length=20)
    private String ownerContactPhone;
    
    @Property(dataItem="C_OWNER_CONTACT_ADDRESS", type=DataItemType.VARCHAR, length=300)
    private String ownerContactAddress;
    
    @Property(dataItem="C_OWNER_CONTACT_EMAIL", type=DataItemType.VARCHAR, length=60)
    private String ownerContactEmail;
    
    @Property(dataItem="C_WORKER", type=DataItemType.VARCHAR, length=60)
    private String worker;
    
    @Property(dataItem="C_WORKER_CONTACT", type=DataItemType.VARCHAR, length=60)
    private String workerContact;
    
    @Property(dataItem="C_WORKER_CONTACT_PHONE", type=DataItemType.VARCHAR, length=20)
    private String workerContactPhone;
    
    @Property(dataItem="C_WORKER_CONTACT_ADDRESS", type=DataItemType.VARCHAR, length=300)
    private String workerContactAddress;
    
    @Property(dataItem="C_WORKER_CONTACT_EMAIL", type=DataItemType.VARCHAR, length=60)
    private String workerContactEmail;
    
    @Property(dataItem="C_TOTAL_SECTION", type=DataItemType.INTEGER)
    private Integer totalSection;
    
    @Property(dataItem="C_PRICE", type=DataItemType.DECIMAL)
    private BigDecimal price;
    
    @Property(dataItem="C_TOTAL_PRICE", type=DataItemType.DECIMAL)
    private BigDecimal totalPrice;
    
    @Property(dataItem="C_PENALTY", type=DataItemType.DECIMAL)
    private BigDecimal penalty;
    
    @Property(dataItem="C_SHOWER_ID", type=DataItemType.VARCHAR, length=32)
    private String showerId;
    
    @Property(dataItem="C_BANK_ACCOUNT_NAME", type=DataItemType.VARCHAR, length=300)
    private String bankAccountName;
    
    @Property(dataItem="C_BANK_ACCOUNT_NO", type=DataItemType.VARCHAR, length=30)
    private String bankAccountNo;
    
    @Property(dataItem="C_BANK", type=DataItemType.VARCHAR, length=300)
    private String bank;
    
    @Property(dataItem="C_MAKER_ID", type=DataItemType.VARCHAR, length=32)
    private String makerId;
    
    /**
     * @return the code
     */
    public String getCode() {
        return code;
    }
    
    /**
     * @param code the code to set
     */
    public void setCode(String code) {
        this.code = code;
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
     * @return the targetType
     */
    public String getTargetType() {
        return targetType;
    }

    
    /**
     * @param targetType the targetType to set
     */
    public void setTargetType(String targetType) {
        this.targetType = targetType;
    }

    
    /**
     * @return the owner
     */
    public String getOwner() {
        return owner;
    }

    
    /**
     * @param owner the owner to set
     */
    public void setOwner(String owner) {
        this.owner = owner;
    }

    
    /**
     * @return the ownerContact
     */
    public String getOwnerContact() {
        return ownerContact;
    }

    
    /**
     * @param ownerContact the ownerContact to set
     */
    public void setOwnerContact(String ownerContact) {
        this.ownerContact = ownerContact;
    }

    
    /**
     * @return the ownerContactPhone
     */
    public String getOwnerContactPhone() {
        return ownerContactPhone;
    }

    
    /**
     * @param ownerContactPhone the ownerContactPhone to set
     */
    public void setOwnerContactPhone(String ownerContactPhone) {
        this.ownerContactPhone = ownerContactPhone;
    }

    
    /**
     * @return the ownerContactAddress
     */
    public String getOwnerContactAddress() {
        return ownerContactAddress;
    }

    
    /**
     * @param ownerContactAddress the ownerContactAddress to set
     */
    public void setOwnerContactAddress(String ownerContactAddress) {
        this.ownerContactAddress = ownerContactAddress;
    }

    
    /**
     * @return the ownerContactEmail
     */
    public String getOwnerContactEmail() {
        return ownerContactEmail;
    }

    
    /**
     * @param ownerContactEmail the ownerContactEmail to set
     */
    public void setOwnerContactEmail(String ownerContactEmail) {
        this.ownerContactEmail = ownerContactEmail;
    }

    
    /**
     * @return the worker
     */
    public String getWorker() {
        return worker;
    }

    
    /**
     * @param worker the worker to set
     */
    public void setWorker(String worker) {
        this.worker = worker;
    }

    
    /**
     * @return the workerContact
     */
    public String getWorkerContact() {
        return workerContact;
    }

    
    /**
     * @param workerContact the workerContact to set
     */
    public void setWorkerContact(String workerContact) {
        this.workerContact = workerContact;
    }

    
    /**
     * @return the workerContactPhone
     */
    public String getWorkerContactPhone() {
        return workerContactPhone;
    }

    
    /**
     * @param workerContactPhone the workerContactPhone to set
     */
    public void setWorkerContactPhone(String workerContactPhone) {
        this.workerContactPhone = workerContactPhone;
    }

    
    /**
     * @return the workerContactAddress
     */
    public String getWorkerContactAddress() {
        return workerContactAddress;
    }

    
    /**
     * @param workerContactAddress the workerContactAddress to set
     */
    public void setWorkerContactAddress(String workerContactAddress) {
        this.workerContactAddress = workerContactAddress;
    }

    
    /**
     * @return the workerContactEmail
     */
    public String getWorkerContactEmail() {
        return workerContactEmail;
    }

    
    /**
     * @param workerContactEmail the workerContactEmail to set
     */
    public void setWorkerContactEmail(String workerContactEmail) {
        this.workerContactEmail = workerContactEmail;
    }

    
    /**
     * @return the totalSection
     */
    public Integer getTotalSection() {
        return totalSection;
    }

    
    /**
     * @param totalSection the totalSection to set
     */
    public void setTotalSection(Integer totalSection) {
        this.totalSection = totalSection;
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

    
    /**
     * @return the totalPrice
     */
    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    
    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    
    /**
     * @return the penalty
     */
    public BigDecimal getPenalty() {
        return penalty;
    }

    
    /**
     * @param penalty the penalty to set
     */
    public void setPenalty(BigDecimal penalty) {
        this.penalty = penalty;
    }

    
    /**
     * @return the showerId
     */
    public String getShowerId() {
        return showerId;
    }

    
    /**
     * @param showerId the showerId to set
     */
    public void setShowerId(String showerId) {
        this.showerId = showerId;
    }

    
    /**
     * @return the bankAccountName
     */
    public String getBankAccountName() {
        return bankAccountName;
    }

    
    /**
     * @param bankAccountName the bankAccountName to set
     */
    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName;
    }

    
    /**
     * @return the bankAccountNo
     */
    public String getBankAccountNo() {
        return bankAccountNo;
    }

    
    /**
     * @param bankAccountNo the bankAccountNo to set
     */
    public void setBankAccountNo(String bankAccountNo) {
        this.bankAccountNo = bankAccountNo;
    }

    
    /**
     * @return the bank
     */
    public String getBank() {
        return bank;
    }

    
    /**
     * @param bank the bank to set
     */
    public void setBank(String bank) {
        this.bank = bank;
    }

    
    /**
     * @return the makerId
     */
    public String getMakerId() {
        return makerId;
    }

    
    /**
     * @param makerId the makerId to set
     */
    public void setMakerId(String makerId) {
        this.makerId = makerId;
    }
    
    
}
