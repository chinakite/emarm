/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.emarm.model.enumeration.MakeTaskState;
import com.ideamoment.emarm.model.enumeration.ShowType;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_MAKE_TASK")
public class MakeTask extends HistoriableEntity {
    @Property(dataItem="C_NAME", type=DataItemType.VARCHAR, length=200)
    private String name;
    
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId; 
    
    @Property(dataItem="C_MAKER_ID", type=DataItemType.VARCHAR, length=32)
    private String makerId; 
    
    @Property(dataItem="C_TIME_SECTION", type=DataItemType.INTEGER)
    private Integer timePerSection;
    
    @Property(dataItem="C_SHOW_TYPE", type=DataItemType.VARCHAR, length=2)
    private String showType;
    
    @Property(dataItem="C_MAKE_TIME", type=DataItemType.INTEGER)
    private Integer makeTime;
    
    @Property(dataItem="C_SHOW_EXPECTION", type=DataItemType.VARCHAR, length=1000)
    private String showExpection;
    
    @Property(dataItem="C_CONTRACT_ID", type=DataItemType.VARCHAR, length=32)
    private String contractId;
    
    @Property(dataItem="C_DESC", type=DataItemType.VARCHAR, length=1000)
    private String desc;

    @Property(dataItem="C_STATE", type=DataItemType.VARCHAR, length=2)
    private String state;
    
    @Property(dataItem="C_TOTAL_SECTION", type=DataItemType.INTEGER)
    private String totalSection;
    
    @Ref
    private User maker;
    
    @Ref
    private Product product;
    
    @Ref
    private MakeContract makeContract; 
    
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

    
    /**
     * @return the timePerSection
     */
    public Integer getTimePerSection() {
        return timePerSection;
    }

    
    /**
     * @param timePerSection the timePerSection to set
     */
    public void setTimePerSection(Integer timePerSection) {
        this.timePerSection = timePerSection;
    }

    
    /**
     * @return the showType
     */
    public String getShowType() {
        return showType;
    }

    
    /**
     * @param showType the showType to set
     */
    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getShowTypeText() {
        if(showType == null)
            return "";
        
        if(showType.equals(ShowType.SINGLE_PLAY)) {
            return ShowType.SINGLE_PLAY_TEXT;
        }else if(showType.equals(ShowType.PAIR_PLAY)) {
            return ShowType.PAIR_PLAY_TEXT;
        }else if(showType.equals(ShowType.MULTI_PLAY)) {
            return ShowType.MULTI_PLAY_TEXT;
        }else if(showType.equals(ShowType.OTHER_PLAY)) {
            return ShowType.OTHER_PLAY_TEXT;
        }else{
            return "";
        }
    }
    
    /**
     * @return the makeTime
     */
    public Integer getMakeTime() {
        return makeTime;
    }

    
    /**
     * @param makeTime the makeTime to set
     */
    public void setMakeTime(Integer makeTime) {
        this.makeTime = makeTime;
    }

    
    /**
     * @return the showExpection
     */
    public String getShowExpection() {
        return showExpection;
    }

    
    /**
     * @param showExpection the showExpection to set
     */
    public void setShowExpection(String showExpection) {
        this.showExpection = showExpection;
    }

    
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
     * @return the maker
     */
    public User getMaker() {
        return maker;
    }
    
    /**
     * @param maker the maker to set
     */
    public void setMaker(User maker) {
        this.maker = maker;
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
    
    public String getStateText() {
        if(state == null)
            return "";
        
        if(state.equals(MakeTaskState.NEW)) {
            return MakeTaskState.NEW_TEXT;
        }else if(state.equals(MakeTaskState.PUBLISH)) {
            return MakeTaskState.PUBLISH_TEXT;
        }else if(state.equals(MakeTaskState.MAKER_READED)) {
            return MakeTaskState.MAKER_READED_TEXT;
        }else if(state.equals(MakeTaskState.MAKING)) {
            return MakeTaskState.MAKING_TEXT;
        }else if(state.equals(MakeTaskState.MAKE_FINISH)) {
            return MakeTaskState.MAKE_FINISH_TEXT;
        }else {
            return "";
        }
        
    }
    
    /**
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(Product product) {
        this.product = product;
    }
    
    /**
     * @return the makeContract
     */
    public MakeContract getMakeContract() {
        return makeContract;
    }
    
    /**
     * @param makeContract the makeContract to set
     */
    public void setMakeContract(MakeContract makeContract) {
        this.makeContract = makeContract;
    }
    
    /**
     * @return the totalSection
     */
    public String getTotalSection() {
        return totalSection;
    }

    /**
     * @param totalSection the totalSection to set
     */
    public void setTotalSection(String totalSection) {
        this.totalSection = totalSection;
    }
    
}
