/**
 * 
 */
package com.ideamoment.emarm.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.ideamoment.emarm.model.enumeration.CopyrightContractState;
import com.ideamoment.emarm.model.enumeration.PrivilegeRange;
import com.ideamoment.emarm.model.enumeration.PrivilegeType;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_SALE_CONTRACT")
public class SaleContract extends HistoriableEntity {
    @Property(dataItem="C_CODE", type=DataItemType.VARCHAR, length=20)
    private String code;
    
    @Property(dataItem="C_OWNER", type=DataItemType.VARCHAR, length=300)
    private String owner;
    
    @Property(dataItem="C_OWNER_CONTACT", type=DataItemType.VARCHAR, length=60)
    private String ownerContact;
    
    @Property(dataItem="C_OWNER_CONTACT_PHONE", type=DataItemType.VARCHAR, length=20)
    private String ownerContactPhone;
    
    @Property(dataItem="C_OWNER_CONTACT_ADDRESS", type=DataItemType.VARCHAR, length=300)
    private String ownerContactAddress;
    
    @Property(dataItem="C_OWNER_CONTACT_EMAIL", type=DataItemType.VARCHAR, length=60)
    private String ownerContactEmail;
    
    @Property(dataItem="C_BUYER", type=DataItemType.VARCHAR, length=300)
    private String buyer;
    
    @Property(dataItem="C_BUYER_CONTACT", type=DataItemType.VARCHAR, length=60)
    private String buyerContact;
    
    @Property(dataItem="C_BUYER_CONTACT_PHONE", type=DataItemType.VARCHAR, length=20)
    private String buyerContactPhone;
    
    @Property(dataItem="C_BUYER_CONTACT_ADDRESS", type=DataItemType.VARCHAR, length=300)
    private String buyerContactAddress;
    
    @Property(dataItem="C_BUYER_CONTACT_EMAIL", type=DataItemType.VARCHAR, length=60)
    private String buyerContactEmail;
    
    @Ref(entityClass=Product.class)
    private List<Product> products = new ArrayList<Product>();
    
    @Property(dataItem="C_PRIVILEGES", type=DataItemType.VARCHAR, length=10)
    private String privileges;
    
    @Property(dataItem="C_PRIVILEGE_TYPE", type=DataItemType.VARCHAR, length=1)
    private String privilegeType;
    
    @Property(dataItem="C_PRIVILEGE_RANGE", type=DataItemType.VARCHAR, length=1)
    private String privilegeRange;
    
    @Property(dataItem="C_PRIVILEGE_DEADLINE", type=DataItemType.VARCHAR, length=3)
    private String privilegeDeadline;
    
    @Property(dataItem="C_BANK_ACCOUNT_NAME", type=DataItemType.VARCHAR, length=300)
    private String bankAccountName;
    
    @Property(dataItem="C_BANK_ACCOUNT_NO", type=DataItemType.VARCHAR, length=30)
    private String bankAccountNo;
    
    @Property(dataItem="C_BANK", type=DataItemType.VARCHAR, length=300)
    private String bank;
    
    @Property(dataItem="C_TOTAL_PRICE", type=DataItemType.DECIMAL)
    private BigDecimal totalPrice;

    
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
     * @return the buyer
     */
    public String getBuyer() {
        return buyer;
    }

    
    /**
     * @param buyer the buyer to set
     */
    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

    
    /**
     * @return the buyerContact
     */
    public String getBuyerContact() {
        return buyerContact;
    }

    
    /**
     * @param buyerContact the buyerContact to set
     */
    public void setBuyerContact(String buyerContact) {
        this.buyerContact = buyerContact;
    }

    
    /**
     * @return the buyerContactPhone
     */
    public String getBuyerContactPhone() {
        return buyerContactPhone;
    }

    
    /**
     * @param buyerContactPhone the buyerContactPhone to set
     */
    public void setBuyerContactPhone(String buyerContactPhone) {
        this.buyerContactPhone = buyerContactPhone;
    }

    
    /**
     * @return the buyerContactAddress
     */
    public String getBuyerContactAddress() {
        return buyerContactAddress;
    }

    
    /**
     * @param buyerContactAddress the buyerContactAddress to set
     */
    public void setBuyerContactAddress(String buyerContactAddress) {
        this.buyerContactAddress = buyerContactAddress;
    }

    
    /**
     * @return the buyerContactEmail
     */
    public String getBuyerContactEmail() {
        return buyerContactEmail;
    }

    
    /**
     * @param buyerContactEmail the buyerContactEmail to set
     */
    public void setBuyerContactEmail(String buyerContactEmail) {
        this.buyerContactEmail = buyerContactEmail;
    }

    
    /**
     * @return the products
     */
    public List<Product> getProducts() {
        return products;
    }

    
    /**
     * @param products the products to set
     */
    public void setProducts(List<Product> products) {
        this.products = products;
    }

    
    /**
     * @return the privileges
     */
    public String getPrivileges() {
        return privileges;
    }

    
    /**
     * @param privileges the privileges to set
     */
    public void setPrivileges(String privileges) {
        this.privileges = privileges;
    }

    public String getPrivilegesText() {
        String privilegesText = privileges.replaceAll("01", "音频改编权");
        privilegesText = privilegesText.replaceAll("02", "广播权");
        privilegesText = privilegesText.replaceAll("03", "网络信息传播权");
        privilegesText = privilegesText.replaceAll("04", "转授权");
        return privilegesText;
    }
    
    /**
     * @return the privilegeType
     */
    public String getPrivilegeType() {
        return privilegeType;
    }

    
    /**
     * @param privilegeType the privilegeType to set
     */
    public void setPrivilegeType(String privilegeType) {
        this.privilegeType = privilegeType;
    }

    public String getPrivilegeTypeText() {
        if(this.privilegeType.equals(PrivilegeType.EXCLUSIVE)) {
            return PrivilegeType.EXCLUSIVE_TEXT;
        }else if(this.privilegeType.equals(PrivilegeType.UNEXCLUSIVE)) {
            return PrivilegeType.UNEXCLUSIVE_TEXT;
        }else{
            return "";
        }
    }
    
    /**
     * @return the privilegeRange
     */
    public String getPrivilegeRange() {
        return privilegeRange;
    }

    
    /**
     * @param privilegeRange the privilegeRange to set
     */
    public void setPrivilegeRange(String privilegeRange) {
        this.privilegeRange = privilegeRange;
    }

    public String getPrivilegeRangeText() {
        if(this.privilegeRange.equals(PrivilegeRange.GLOBAL)) {
            return PrivilegeRange.GLOBAL_TEXT;
        }else if(this.privilegeRange.equals(PrivilegeRange.WHOLE_CHINA)) {
            return PrivilegeRange.WHOLE_CHINA_TEXT;
        }else if(this.privilegeRange.equals(PrivilegeRange.CRP)) {
            return PrivilegeRange.CRP_TEXT;
        }else{
            return "";
        }
    }
    
    /**
     * @return the privilegeDeadline
     */
    public String getPrivilegeDeadline() {
        return privilegeDeadline;
    }

    
    /**
     * @param privilegeDeadline the privilegeDeadline to set
     */
    public void setPrivilegeDeadline(String privilegeDeadline) {
        this.privilegeDeadline = privilegeDeadline;
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
    
    
}
