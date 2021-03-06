/**
 * 
 */
package com.ideamoment.emarm.model;

import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_FINAL_EVALUATION")
public class FinalEvaluation extends HistoriableEntity {
    @Property(dataItem="C_PRODUCT_ID", type=DataItemType.VARCHAR, length=32)
    private String productId;
    
    @Property(dataItem="C_REF_PRICE", type=DataItemType.VARCHAR, length=32)
    private String refPrice;
    
    @Property(dataItem="C_PRODUCT_LEVEL", type=DataItemType.VARCHAR, length=2)
    private String productLevel;
    
    @Property(dataItem="C_Author_LEVEL", type=DataItemType.VARCHAR, length=2)
    private String authorLevel;
    
    @Property(dataItem="C_STORY_VALUE", type=DataItemType.VARCHAR, length=2)
    private String storyValue;
    
    @Property(dataItem="C_MAKE_VALUE", type=DataItemType.VARCHAR, length=2)
    private String makeValue;
    
    @Property(dataItem="C_ONLY_WEB_CAST", type=DataItemType.VARCHAR, length=1)
    private String onlyWebCast = YesOrNo.NO;
    
    @Property(dataItem="C_HOT_SUBJECT", type=DataItemType.VARCHAR, length=1)
    private String hotSubject = YesOrNo.NO;
    
    @Property(dataItem="C_DOUBAN_SCORE", type=DataItemType.VARCHAR, length=10)
    private String doubanScore;
    
    @Property(dataItem="C_DOUBAN_SCORER_NUM", type=DataItemType.VARCHAR, length=10)
    private String doubanScorerNum;
    
    @Property(dataItem="C_KAIJUAN_MONTH_SALE", type=DataItemType.VARCHAR, length=10)
    private String kaijuanMonthSale;
    
    @Property(dataItem="C_KAIJUAN_YEAR_SALE", type=DataItemType.VARCHAR, length=10)
    private String kaijuanYearSale;
    
    @Property(dataItem="C_KAIJUAN_TOTAL_SALE", type=DataItemType.VARCHAR, length=10)
    private String kaijuanTotalSale;
    
    @Property(dataItem="C_BUY_SUGGEST", type=DataItemType.VARCHAR, length=60)
    private String buySuggest;

    @Ref
    private User createUser;
    
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
     * @return the refPrice
     */
    public String getRefPrice() {
        return refPrice;
    }
    
    /**
     * @param refPrice the refPrice to set
     */
    public void setRefPrice(String refPrice) {
        this.refPrice = refPrice;
    }
    
    /**
     * @return the storyValue
     */
    public String getStoryValue() {
        return storyValue;
    }
    
    /**
     * @param storyValue the storyValue to set
     */
    public void setStoryValue(String storyValue) {
        this.storyValue = storyValue;
    }
    
    /**
     * @return the makeValue
     */
    public String getMakeValue() {
        return makeValue;
    }
    
    /**
     * @param makeValue the makeValue to set
     */
    public void setMakeValue(String makeValue) {
        this.makeValue = makeValue;
    }
    
    /**
     * @return the onlyWebCast
     */
    public String getOnlyWebCast() {
        return onlyWebCast;
    }
    
    /**
     * @param onlyWebCast the onlyWebCast to set
     */
    public void setOnlyWebCast(String onlyWebCast) {
        this.onlyWebCast = onlyWebCast;
    }
    
    /**
     * @return the hotSubject
     */
    public String getHotSubject() {
        return hotSubject;
    }
    
    /**
     * @param hotSubject the hotSubject to set
     */
    public void setHotSubject(String hotSubject) {
        this.hotSubject = hotSubject;
    }

    
    /**
     * @return the productLevel
     */
    public String getProductLevel() {
        return productLevel;
    }
    
    /**
     * @param productLevel the productLevel to set
     */
    public void setProductLevel(String productLevel) {
        this.productLevel = productLevel;
    }
    
    /**
     * @return the authorLevel
     */
    public String getAuthorLevel() {
        return this.authorLevel;
    }

    /**
     * @param authorLevel the authorLevel to set
     */
    public void setAuthorLevel(String authorLevel) {
        this.authorLevel = authorLevel;
    }
    
    /**
     * @return the createUser
     */
    public User getCreateUser() {
        return createUser;
    }

    /**
     * @param createUser the createUser to set
     */
    public void setCreateUser(User createUser) {
        this.createUser = createUser;
    }

	public String getDoubanScore() {
		return doubanScore;
	}

	public void setDoubanScore(String doubanScore) {
		this.doubanScore = doubanScore;
	}

	public String getDoubanScorerNum() {
		return doubanScorerNum;
	}

	public void setDoubanScorerNum(String doubanScorerNum) {
		this.doubanScorerNum = doubanScorerNum;
	}

	public String getKaijuanMonthSale() {
		return kaijuanMonthSale;
	}

	public void setKaijuanMonthSale(String kaijuanMonthSale) {
		this.kaijuanMonthSale = kaijuanMonthSale;
	}

	public String getKaijuanYearSale() {
		return kaijuanYearSale;
	}

	public void setKaijuanYearSale(String kaijuanYearSale) {
		this.kaijuanYearSale = kaijuanYearSale;
	}

	public String getKaijuanTotalSale() {
		return kaijuanTotalSale;
	}

	public void setKaijuanTotalSale(String kaijuanTotalSale) {
		this.kaijuanTotalSale = kaijuanTotalSale;
	}

	public String getBuySuggest() {
		return buySuggest;
	}

	public void setBuySuggest(String buySuggest) {
		this.buySuggest = buySuggest;
	}
    
}
