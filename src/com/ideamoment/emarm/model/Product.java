/**
 * 
 */
package com.ideamoment.emarm.model;

import java.util.List;

import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.PublishState;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadata.annotation.DataItemType;
import com.ideamoment.ideadata.annotation.Entity;
import com.ideamoment.ideadata.annotation.Property;
import com.ideamoment.ideadata.annotation.Ref;
import com.ideamoment.ideadata.annotation.Transient;

/**
 * @author Chinakite
 *
 */
@Entity(dataSet="T_PRODUCT")
public class Product extends HistoriableEntity {
    @Property(dataItem="C_NAME", type=DataItemType.VARCHAR, length=60)
    private String name;
    
    @Property(dataItem="C_SUBJECT_ID", type=DataItemType.VARCHAR, length=32)
    private String subjectId;
    
    @Property(dataItem="C_AUTHOR_ID", type=DataItemType.VARCHAR, length=32)
    private String authorId;
    
    @Property(dataItem="C_TYPE", type=DataItemType.VARCHAR, length=1)
    private String type;
    
    @Property(dataItem="C_PUBLISH_STATE", type=DataItemType.VARCHAR, length=4)
    private String publishState = PublishState.PUBLISHED;
    
    @Property(dataItem="C_PUBLISH_YEAR", type=DataItemType.VARCHAR, length=10)
    private String publishYear;
    
    @Property(dataItem="C_FINISH_YEAR", type=DataItemType.VARCHAR, length=10)
    private String finishYear;      //完结年份
    
    @Property(dataItem="C_STATE", type=DataItemType.VARCHAR, length=4)
    private String state = ProductState.DRAFT;

    @Property(dataItem="C_WORD_COUNT", type=DataItemType.INT)
    private Integer wordCount;  //字数，文字使用
    
    @Property(dataItem="C_SECTION_COUNT", type=DataItemType.INT)
    private Integer sectionCount;  //集数，音频使用
    
    @Property(dataItem="C_SECTION_LENGTH", type=DataItemType.INT)
    private String sectionLength;  //单集时长，单位：分钟，音频使用
    
    @Property(dataItem="C_PRESS", type=DataItemType.VARCHAR, length=200)
    private String press;
    
    @Property(dataItem="C_WEBSITE", type=DataItemType.VARCHAR, length=200)
    private String website;
    
    @Ref(entityClass=ProductSample.class)
    private List<ProductSample> samples;
    
    @Property(dataItem="C_SUMMARY", type=DataItemType.VARCHAR, length=2000)
    private String summary;
    
    @Property(dataItem="C_HAS_AUDIO", type=DataItemType.VARCHAR, length=1)
    private String hasAudio = YesOrNo.NO;
    
    @Property(dataItem="C_AUDIO_COPYRIGHT", type=DataItemType.VARCHAR, length=1)
    private String audioCopyright;
    
    @Property(dataItem="C_AUDIO_DESC", type=DataItemType.VARCHAR, length=500)
    private String audioDesc;
    
    @Property(dataItem="C_ISBN", type=DataItemType.VARCHAR, length=100)
    private String isbn;
    
    @Property(dataItem="C_LOGO_URL", type=DataItemType.VARCHAR, length=100)
    private String logoUrl;
    
    @Property(dataItem="C_RESERVED", type=DataItemType.VARCHAR, length=1)
    private String reserved;
    
    @Ref
    private Author author;
    
    @Ref
    private Subject subject;
    
    @Ref
    private CopyrightContractProduct crcProduct;
    
    @Transient
    private Integer taskCount;
    
    @Transient
    private Integer contractCount;
    
    /**
     * @return the crcProduct
     */
    public CopyrightContractProduct getCrcProduct() {
        return crcProduct;
    }

    
    /**
     * @param crcProduct the crcProduct to set
     */
    public void setCrcProduct(CopyrightContractProduct crcProduct) {
        this.crcProduct = crcProduct;
    }

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
     * @return the subjectId
     */
    public String getSubjectId() {
        return subjectId;
    }
    
    /**
     * @param subjectId the subjectId to set
     */
    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }
    
    /**
     * @return the authorId
     */
    public String getAuthorId() {
        return authorId;
    }
    
    /**
     * @param authorId the authorId to set
     */
    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    /**
     * @return the publishState
     */
    public String getPublishState() {
        return publishState;
    }
    
    /**
     * @param publishState the publishState to set
     */
    public void setPublishState(String publishState) {
        this.publishState = publishState;
    }
    
    public String getPublishStateText() {
        if(PublishState.PUBLISHED.equals(this.publishState)) {
            return PublishState.PUBLISHED_TEXT;
        }else if(PublishState.NET_SIGNED.equals(this.publishState)){
            return PublishState.NET_SIGNED_TEXT;
        }else if(PublishState.NET_UN_SIGNED.equals(this.publishState)){
            return PublishState.NET_UN_SIGNED_TEXT;
        }else{
            return PublishState.UN_PUBLIC_TEXT;
        }
    }
    
    /**
     * @return the publishYear
     */
    public String getPublishYear() {
        return publishYear;
    }

    /**
     * @param publishYear the publishYear to set
     */
    public void setPublishYear(String publishYear) {
        this.publishYear = publishYear;
    }
    
    /**
     * @return the hasAudio
     */
    public String getHasAudio() {
        return hasAudio;
    }
    
    /**
     * @param hasAudio the hasAudio to set
     */
    public void setHasAudio(String hasAudio) {
        this.hasAudio = hasAudio;
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
        if(ProductState.APPROVE_WAITING.equals(this.state)) {
            return ProductState.APPROVE_WAITING_TEXT;
        }else if(ProductState.APPROVE_REJECT.equals(this.state)){
            return ProductState.APPROVE_REJECT_TEXT;
        }else if(ProductState.EVALUATE_WAITING.equals(this.state)){
            return ProductState.EVALUATE_WAITING_TEXT;
        }else if(ProductState.EVALUATED.equals(this.state)){
            return ProductState.EVALUATED_TEXT;
        }else if(ProductState.EVALUATE_FINISH.equals(this.state)){
            return ProductState.EVALUATE_FINISH_TEXT;
        }else if(ProductState.MK_CONTRACT.equals(this.state)){
            return ProductState.MK_CONTRACT_TEXT;
        }else if(ProductState.MK.equals(this.state)){
            return ProductState.MK_TEXT;
        }else if(ProductState.MK_FINISH.equals(this.state)){
            return ProductState.MK_FINISH_TEXT;
        }else if(ProductState.MK_WAITING.equals(this.state)){
            return ProductState.MK_WAITING_TEXT;
        }else if(ProductState.SALED.equals(this.state)){
            return ProductState.SALED_TEXT;
        }else if(ProductState.CP_CONTRACT_INFLOW.equals(this.state)){
            return ProductState.CP_CONTRACT_INFLOW_TEXT;
        }else if(ProductState.CP_CONTRACT_FINISH.equals(this.state)){
            return ProductState.CP_CONTRACT_FINISH_TEXT;
        }else if(ProductState.RESERVED.equals(this.state)){
            return ProductState.RESERVED_TEXT;
        }
        else{
            return ProductState.DRAFT_TEXT;
        }
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
     * @return the finishYear
     */
    public String getFinishYear() {
        return finishYear;
    }
    
    /**
     * @param finishYear the finishYear to set
     */
    public void setFinishYear(String finishYear) {
        this.finishYear = finishYear;
    }
    
    /**
     * @return the wordCount
     */
    public Integer getWordCount() {
        return wordCount;
    }
    
    /**
     * @param wordCount the wordCount to set
     */
    public void setWordCount(Integer wordCount) {
        this.wordCount = wordCount;
    }
    
    /**
     * @return the sectionCount
     */
    public Integer getSectionCount() {
        return sectionCount;
    }
    
    /**
     * @param sectionCount the sectionCount to set
     */
    public void setSectionCount(Integer sectionCount) {
        this.sectionCount = sectionCount;
    }
    
    /**
     * @return the sectionLength
     */
    public String getSectionLength() {
        return sectionLength;
    }

    /**
     * @param sectionLength the sectionLength to set
     */
    public void setSectionLength(String sectionLength) {
        this.sectionLength = sectionLength;
    }
    
    /**
     * @return the press
     */
    public String getPress() {
        return press;
    }
    
    /**
     * @param press the press to set
     */
    public void setPress(String press) {
        this.press = press;
    }
    
    /**
     * @return the website
     */
    public String getWebsite() {
        return website;
    }
    
    /**
     * @param website the website to set
     */
    public void setWebsite(String website) {
        this.website = website;
    }
    
    /**
     * @return the samples
     */
    public List<ProductSample> getSamples() {
        return samples;
    }

    /**
     * @param samples the samples to set
     */
    public void setSamples(List<ProductSample> samples) {
        this.samples = samples;
    }
    
    /**
     * @return the summary
     */
    public String getSummary() {
        return summary;
    }
    
    /**
     * @param summary the summary to set
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }
    
    /**
     * @return the audioCopyright
     */
    public String getAudioCopyright() {
        return audioCopyright;
    }

    /**
     * @param audioCopyright the audioCopyright to set
     */
    public void setAudioCopyright(String audioCopyright) {
        this.audioCopyright = audioCopyright;
    }
    
    /**
     * @return the audioDesc
     */
    public String getAudioDesc() {
        return audioDesc;
    }

    /**
     * @param audioDesc the audioDesc to set
     */
    public void setAudioDesc(String audioDesc) {
        this.audioDesc = audioDesc;
    }

    /**
     * @return the isbn
     */
    public String getIsbn() {
        return isbn;
    }
    
    /**
     * @param isbn the isbn to set
     */
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    /**
     * @return the logoUrl
     */
    public String getLogoUrl() {
        return logoUrl;
    }
    
    /**
     * @param logoUrl the logoUrl to set
     */
    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }
    
    /**
     * @return the author
     */
    public Author getAuthor() {
        return author;
    }
    
    /**
     * @param author the author to set
     */
    public void setAuthor(Author author) {
        this.author = author;
    }

    
    /**
     * @return the subject
     */
    public Subject getSubject() {
        return subject;
    }
    
    /**
     * @param subject the subject to set
     */
    public void setSubject(Subject subject) {
        this.subject = subject;
    }


    
    /**
     * @return the taskCount
     */
    public Integer getTaskCount() {
        return taskCount;
    }


    
    /**
     * @param taskCount the taskCount to set
     */
    public void setTaskCount(Integer taskCount) {
        this.taskCount = taskCount;
    }


    
    /**
     * @return the contractCount
     */
    public Integer getContractCount() {
        return contractCount;
    }


    
    /**
     * @param contractCount the contractCount to set
     */
    public void setContractCount(Integer contractCount) {
        this.contractCount = contractCount;
    }


    
    /**
     * @return the reserved
     */
    public String getReserved() {
        return reserved;
    }


    
    /**
     * @param reserved the reserved to set
     */
    public void setReserved(String reserved) {
        this.reserved = reserved;
    }
    
    
}
