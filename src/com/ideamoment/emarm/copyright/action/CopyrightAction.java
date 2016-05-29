/**
 * 
 */
package com.ideamoment.emarm.copyright.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.copyright.CopyrightExceptionCode;
import com.ideamoment.emarm.copyright.service.CopyrightService;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.CopyrightContract;
import com.ideamoment.emarm.model.CopyrightContractAudit;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.product.service.ProductService;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.exception.IdeaBaseException;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.wx.util.StringUtils;

/**
 * @author Chinakite
 *
 */
@Controller
public class CopyrightAction {
    
    @Autowired
    private CopyrightService copyrightService;
    
    @Autowired
    private ProductService productService;
    
    /**
     * @return the copyrightService
     */
    public CopyrightService getCopyrightService() {
        return copyrightService;
    }
    
    /**
     * @param copyrightService the copyrightService to set
     */
    public void setCopyrightService(CopyrightService copyrightService) {
        this.copyrightService = copyrightService;
    }
    
    /**
     * @return the productService
     */
    public ProductService getProductService() {
        return productService;
    }
    
    /**
     * @param productService the productService to set
     */
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(value="/copyright/productPage", method=RequestMethod.GET)
    public ModelAndView toProducts() {
        return new ModelAndView("/WEB-INF/jsp/copyright/product.jsp");
    }
    
    @RequestMapping(value="/copyright/dtProducts", method=RequestMethod.GET)
    public JsonData dtProducts(
                               int draw, 
                               int start, 
                               int length, 
                               String productName,
                               String authorName,
                               String isbn,
                               String subject,
                               String auditState,
                               String state) {
        int curPage = start/length + 1;
        int pageSize = length;
        
        HashMap<String, String> condition = new HashMap<String, String>();
        if(productName != null)
            condition.put("productName", productName);
        if(authorName != null)
            condition.put("authorName", authorName);
        if(isbn != null)
            condition.put("isbn", isbn);
        if(subject != null && !subject.equals("-1"))
            condition.put("subject", subject);
        if(auditState != null && !auditState.equals("-1"))
            condition.put("auditState", auditState);
        if(state != null && !state.equals("-1"))
            condition.put("state", state);
        
        Page<Product> products = copyrightService.pageProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertProductsToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/copyright/dtMgrProducts", method=RequestMethod.GET)
    public JsonData dtMgrProducts(
                               int draw, 
                               int start, 
                               int length, 
                               String productName,
                               String authorName,
                               String isbn,
                               String subject,
                               String auditState,
                               String state) {
        int curPage = start/length + 1;
        int pageSize = length;
        
        HashMap<String, String> condition = new HashMap<String, String>();
        if(productName != null)
            condition.put("productName", productName);
        if(authorName != null)
            condition.put("authorName", authorName);
        if(isbn != null)
            condition.put("isbn", isbn);
        if(subject != null && !subject.equals("-1"))
            condition.put("subject", subject);
        if(auditState != null && !auditState.equals("-1"))
            condition.put("auditState", auditState);
        if(state != null && !state.equals("-1"))
            condition.put("state", state);
        
        Page<Product> products = copyrightService.pageMgrProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertProductsToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/product/createProduct", method=RequestMethod.POST)
    public JsonData saveProduct(
                        String id,
                        String name,
                        String authorName,
                        String authorPseudonym,
                        String wordCount,
                        String subject,
                        String publishState,
                        String publishYear,
                        String press,
                        String finishYear,
                        String website,
                        String summary,
                        String hasAudio,
                        String audioCopyright,
                        String audioDesc,
                        String samples,
                        String isbn,
                        String submit) {
        
        Product product;
        if(StringUtils.isEmpty(id)) {
            product = new Product();
        }else{
            product = productService.findProductById(id);
        }
        
        product.setId(id);
        product.setName(name);
        
        Author author = new Author();
        author.setName(authorName);
        author.setPseudonym(authorPseudonym);

        product.setAuthor(author);
        if(StringUtils.isNotEmpty(wordCount)) {
            product.setWordCount(Integer.valueOf(wordCount));
        }
        product.setSubjectId(subject);
        product.setPublishState(publishState);
        product.setPublishYear(publishYear);
        product.setPress(press);
        product.setFinishYear(finishYear);
        product.setWebsite(website);
        product.setSummary(summary);
        product.setHasAudio(hasAudio);
        product.setAudioCopyright(audioCopyright);
        product.setAudioDesc(audioDesc);
        product.setIsbn(isbn);
        
        List<ProductSample> sampleList = new ArrayList<ProductSample>();
        String[] sampleArray = samples.split(",");
        for(String sampleUrl : sampleArray) {
            ProductSample sample = new ProductSample();
            sample.setFileUrl(sampleUrl);
            sampleList.add(sample);
        }
        product.setSamples(sampleList);
        try{
            product = productService.saveProduct(product, submit, true);
        }catch(IdeaBaseException e) {
            e.printStackTrace();
            return JsonData.exception(e.getCode(), e.getMessage());
        }
        
        return JsonData.success(product);
    }
    
    @RequestMapping(value="/copyright/myContractPage", method=RequestMethod.GET)
    public ModelAndView toMyContract() {
        return new ModelAndView("/WEB-INF/jsp/copyright/mycontract.jsp");
    }
    
    @RequestMapping(value="/copyright/dtMyContracts", method=RequestMethod.GET)
    public JsonData dtMyContracts(
                               int draw, 
                               int start, 
                               int length,
                               String code,
                               String owner,
                               String auditState) {
        int curPage = start/length + 1;
        int pageSize = length;
        
        HashMap<String, String> condition = new HashMap<String, String>();
        if(code != null && !code.equals("-1"))
            condition.put("code", code);
        if(owner != null && !owner.equals("-1"))
            condition.put("owner", owner);
        if(auditState != null && !auditState.equals("-1"))
            condition.put("auditState", auditState);
        
        Page<CopyrightContract> contracts = copyrightService.pageMyContracts(curPage, pageSize, condition);
        DataTableSource<CopyrightContract> dts = convertContractsToDataTableSource(draw, contracts);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/copyright/auditContractPage", method=RequestMethod.GET)
    public ModelAndView toAuditContract() {
        return new ModelAndView("/WEB-INF/jsp/copyright/auditcontract.jsp");
    }
    
    @RequestMapping(value="/copyright/dtAuditContracts", method=RequestMethod.GET)
    public JsonData dtAuditContracts(
                               int draw, 
                               int start, 
                               int length,
                               String code,
                               String owner,
                               String auditState) {
        int curPage = start/length + 1;
        int pageSize = length;
        
        HashMap<String, String> condition = new HashMap<String, String>();
        if(code != null && !code.equals("-1"))
            condition.put("code", code);
        if(owner != null && !owner.equals("-1"))
            condition.put("owner", owner);
        if(auditState != null && !auditState.equals("-1"))
            condition.put("auditState", auditState);
        
        Page<CopyrightContract> contracts = copyrightService.pageAuditContracts(curPage, pageSize, condition);
        DataTableSource<CopyrightContract> dts = convertContractsToDataTableSource(draw, contracts);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/copyright/copyrightContract", method=RequestMethod.POST)
    public JsonData createCopyrightContract(
                        String contractId,
                        String totalPrice,
                        String contractProductIds,
                        String prices,
                        String owner,
                        String ownerContact,
                        String ownerContactPhone,
                        String ownerContactAddress,
                        String ownerContactEmail,
                        String buyer,
                        String buyerContact,
                        String buyerContactPhone,
                        String buyerContactAddress,
                        String buyerContactEmail,
                        String privileges,
                        String privilegeType,
                        String privilegeRange,
                        String privilegeDeadline,
                        String bankAccountName,
                        String bank,
                        String bankAccountNo,
                        int submit
            ) {
        CopyrightContract cc = null;
        if(StringUtils.isNotEmpty(contractId)) {
            cc = copyrightService.findCopyContract(contractId);
        }else{
            cc = new CopyrightContract();
        }
        
        cc.setTotalPrice(new BigDecimal(totalPrice));
        cc.setOwner(owner);
        cc.setOwnerContact(ownerContact);
        cc.setOwnerContactAddress(ownerContactAddress);
        cc.setOwnerContactEmail(ownerContactEmail);
        cc.setOwnerContactPhone(ownerContactPhone);
        
        cc.setBuyer(buyer);
        cc.setBuyerContact(buyerContact);
        cc.setBuyerContactAddress(buyerContactAddress);
        cc.setBuyerContactEmail(buyerContactEmail);
        cc.setBuyerContactPhone(buyerContactPhone);
        
        cc.setPrivileges(privileges);
        cc.setPrivilegeType(privilegeType);
        cc.setPrivilegeRange(privilegeRange);
        cc.setPrivilegeDeadline(privilegeDeadline);
        
        cc.setBank(bank);
        cc.setBankAccountName(bankAccountName);
        cc.setBankAccountNo(bankAccountNo);
        
        String[] productIdArr = contractProductIds.split(",");
        String[] priceArr = prices.split(",");
        
        copyrightService.saveCopyrightContract(cc, productIdArr, priceArr, submit);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/copyrightContract/{id}", method=RequestMethod.DELETE)
    public JsonData deleteCopyrightContract(@PathVariable String id){
        try{
            copyrightService.deleteCopyrightContract(id);
        }catch(Exception e) {
            e.printStackTrace();
            JsonData.exception(CopyrightExceptionCode.DELETE_CONTRACT_ERR, "Delete contract error.");
        }
        return JsonData.SUCCESS;
    }
                        
    
    @RequestMapping(value="/copyright/contractDetail", method=RequestMethod.GET)
    public ModelAndView viewContract(String id) {
        CopyrightContract contract = copyrightService.findContract(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("contract", contract);
        return new ModelAndView("/WEB-INF/jsp/copyright/contractDetail.jsp", model);
    }
    
    @RequestMapping(value="/copyright/contractProducts", method=RequestMethod.GET)
    public JsonData listContractProducts(String contractId) {
        List<Product> products = copyrightService.listContractProducts(contractId);
        return JsonData.success(products);
    }
    
    @RequestMapping(value="/copyright/contractAudits", method=RequestMethod.GET)
    public JsonData listContractAudits(String contractId) {
        List<CopyrightContractAudit> audits = copyrightService.listContractAudits(contractId);
        return JsonData.success(audits);
    }
    
    @RequestMapping(value="/copyright/productContracts", method=RequestMethod.GET)
    public JsonData listProductContracts(String productId) {
        List<CopyrightContract> contracts = copyrightService.listProductContracts(productId);
        return JsonData.success(contracts);
    }
    
    @RequestMapping(value="/copyright/passContract", method=RequestMethod.POST)
    public JsonData passContract(String id, String remark) {
        copyrightService.passContract(id, remark);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/rejectContract", method=RequestMethod.POST)
    public JsonData rejectContract(String id, String remark) {
        copyrightService.rejectContract(id, remark);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/contractDocs", method=RequestMethod.GET)
    public JsonData listContractDocs(String contractId) {
        List<CopyrightContractDoc> docs = copyrightService.listContractDocs(contractId);
        return JsonData.success(docs);
    }
    
    @RequestMapping(value="/copyright/generateDoc", method=RequestMethod.POST)
    public JsonData generateDoc(String id) {
        copyrightService.generateDoc(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/uploadContractDoc", method=RequestMethod.POST)
    public JsonData uploadContractDoc(String id, String fileUrl, String version, String finishedDoc, String type) {
        copyrightService.uploadContractDoc(id, fileUrl, version, finishedDoc, type);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/toLawyer", method=RequestMethod.POST)
    public JsonData toLawyer(String id) {
        copyrightService.toLawyer(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/productDetail", method=RequestMethod.GET)
    public ModelAndView viewProduct(String id) {
        Product product = copyrightService.findProduct(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("product", product);
        return new ModelAndView("/WEB-INF/jsp/copyright/productDetail.jsp", model);
    }
    
    @RequestMapping(value="/copyright/product/{id}", method=RequestMethod.GET)
    public JsonData product(@PathVariable String id) {
        Product product = copyrightService.findProduct(id);
        return JsonData.success(product);
    }
    
    @RequestMapping(value="/copyright/assignedOptor", method=RequestMethod.POST)
    public JsonData assignedOptor(String productId, String userId) {
        copyrightService.assignedOptor(productId, userId);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/copyright/countMonthCopyright", method=RequestMethod.GET)
    public JsonData countCopyrightCurMonth() {
        Long count = copyrightService.countCopyrightCurMonth();
        return JsonData.success(count);
    }
    
    private DataTableSource<Product> convertProductsToDataTableSource(int draw, Page<Product> productsPage) {
        DataTableSource<Product> dts = new DataTableSource<Product>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(productsPage.getTotalRecord());
        dts.setRecordsFiltered(productsPage.getTotalRecord());
        dts.setData(productsPage.getData());
        
        return dts;
    }
    
    private DataTableSource<CopyrightContract> convertContractsToDataTableSource(int draw, Page<CopyrightContract> contractssPage) {
        DataTableSource<CopyrightContract> dts = new DataTableSource<CopyrightContract>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(contractssPage.getTotalRecord());
        dts.setRecordsFiltered(contractssPage.getTotalRecord());
        dts.setData(contractssPage.getData());
        
        return dts;
    }
}
