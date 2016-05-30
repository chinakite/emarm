/**
 * 
 */
package com.ideamoment.emarm.sale.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.copyright.CopyrightExceptionCode;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.SaleContract;
import com.ideamoment.emarm.model.SaleContractDoc;
import com.ideamoment.emarm.product.service.ProductService;
import com.ideamoment.emarm.sale.SaleExceptionCode;
import com.ideamoment.emarm.sale.service.SaleService;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.wx.util.StringUtils;

/**
 * @author Chinakite
 *
 */
@Controller
public class SaleAction {
    @Autowired
    private SaleService saleService;
    
    @Autowired
    private ProductService productService;

    /**
     * @return the saleService
     */
    public SaleService getSaleService() {
        return saleService;
    }
    
    /**
     * @param saleService the saleService to set
     */
    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
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

    @RequestMapping(value="/sale/productPage", method=RequestMethod.GET)
    public ModelAndView toTaskProducts() {
        return new ModelAndView("/WEB-INF/jsp/sale/product.jsp");
    }
    
    @RequestMapping(value="/sale/contractPage", method=RequestMethod.GET)
    public ModelAndView toContractProducts() {
        return new ModelAndView("/WEB-INF/jsp/sale/contract.jsp");
    }
    
    @RequestMapping(value="/sale/productContractPage", method=RequestMethod.GET)
    public ModelAndView toProductContracts(String productId) {
        HashMap model = new HashMap();
        Product product = saleService.findProduct(productId);
        model.put("product", product);
        return new ModelAndView("/WEB-INF/jsp/sale/productContract.jsp", model);
    }
    
    @RequestMapping(value="/sale/productContracts", method=RequestMethod.GET)
    public JsonData productContracts(String productId) {
        List<SaleContract> contracts = saleService.listProductContracts(productId);
        return JsonData.success(contracts);
    }
    
    @RequestMapping(value="/sale/contracts", method=RequestMethod.GET)
    public JsonData contracts(int draw, 
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
        
        Page<SaleContract> contracts = saleService.pageContracts(curPage, pageSize, condition);
        DataTableSource<SaleContract> dts = convertContractsToDataTableSource(draw, contracts);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/sale/dtProducts", method=RequestMethod.GET)
    public JsonData dtProducts(
                               int draw, 
                               int start, 
                               int length, 
                               String productName,
                               String authorName,
                               String isbn,
                               String subject,
                               String publishState,
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
        if(publishState != null && !publishState.equals("-1"))
            condition.put("publishState", publishState);
        if(state != null && !state.equals("-1"))
            condition.put("state", state);
        
        Page<Product> products = saleService.pageProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/sale/saleContract", method=RequestMethod.POST)
    public JsonData createSaleContract(
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
        SaleContract sc = null;
        if(StringUtils.isNotEmpty(contractId)) {
            sc = saleService.findSaleContract(contractId);
        }else{
            sc = new SaleContract();
        }
        
        if(StringUtils.isEmpty(contractId)) {
            sc.setTotalPrice(new BigDecimal(totalPrice));
        }
        sc.setOwner(owner);
        sc.setOwnerContact(ownerContact);
        sc.setOwnerContactAddress(ownerContactAddress);
        sc.setOwnerContactEmail(ownerContactEmail);
        sc.setOwnerContactPhone(ownerContactPhone);
        
        sc.setBuyer(buyer);
        sc.setBuyerContact(buyerContact);
        sc.setBuyerContactAddress(buyerContactAddress);
        sc.setBuyerContactEmail(buyerContactEmail);
        sc.setBuyerContactPhone(buyerContactPhone);
        
        sc.setPrivileges(privileges);
        sc.setPrivilegeType(privilegeType);
        sc.setPrivilegeRange(privilegeRange);
        sc.setPrivilegeDeadline(privilegeDeadline);
        
        sc.setBank(bank);
        sc.setBankAccountName(bankAccountName);
        sc.setBankAccountNo(bankAccountNo);
        
        if(StringUtils.isEmpty(contractId)) {
            String[] productIdArr = contractProductIds.split(",");
            String[] priceArr = prices.split(",");
            
            saleService.saveSaleContract(sc, productIdArr, priceArr, submit);
        }else{
            saleService.saveSaleContract(sc, null, null, submit);
        }
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/sale/contractDetail", method=RequestMethod.GET)
    public ModelAndView viewContract(String id) {
        SaleContract contract = saleService.findContract(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("contract", contract);
        return new ModelAndView("/WEB-INF/jsp/sale/contractDetail.jsp", model);
    }
    
    @RequestMapping(value="/sale/contractProducts", method=RequestMethod.GET)
    public JsonData listContractProducts(String contractId) {
        List<Product> products = saleService.listContractProducts(contractId);
        return JsonData.success(products);
    }
    
    @RequestMapping(value="/sale/contractDocs", method=RequestMethod.GET)
    public JsonData listContractDocs(String contractId) {
        List<SaleContractDoc> docs = saleService.listContractDocs(contractId);
        return JsonData.success(docs);
    }
    
    @RequestMapping(value="/sale/uploadContractDoc", method=RequestMethod.POST)
    public JsonData uploadContractDoc(String id, String fileUrl, String version, String type) {
        saleService.uploadContractDoc(id, fileUrl, version, type);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/sale/finishContract", method=RequestMethod.POST)
    public JsonData finishContract(String contractId) {
        saleService.finishContract(contractId);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/sale/countMonthSale", method=RequestMethod.GET)
    public JsonData countMakeCurMonth() {
        Long count = saleService.countSaleCurMonth();
        return JsonData.success(count);
    }
    
    @RequestMapping(value="/sale/packItemCount", method=RequestMethod.GET)
    public JsonData countPackItem(HttpServletRequest request) {
        Set<String> prodPack = (Set<String>)request.getSession().getAttribute("PRODPACK");
        if(prodPack == null) {
            prodPack = new TreeSet<String>();
        }
        return JsonData.success(prodPack.size());
    }
    
    @RequestMapping(value="/sale/listPackItems", method=RequestMethod.GET)
    public JsonData listPackItems(HttpServletRequest request) {
        Set<String> prodPack = (Set<String>)request.getSession().getAttribute("PRODPACK");
        if(prodPack == null) {
            prodPack = new TreeSet<String>();
        }
        
        if(prodPack.size() == 0) {
            return JsonData.success(new ArrayList());
        }else{
            StringBuffer ids = new StringBuffer();
            int i=0;
            for(String id : prodPack) {
                if(i > 0) {
                    ids.append(",");
                }
                ids.append(id);
                i++;
            }
            List<Product> products = productService.listProducts(ids.toString());
            return JsonData.success(products);
        }
    }
    
    @RequestMapping(value="/sale/addToPack", method=RequestMethod.POST)
    public JsonData addToPack(HttpServletRequest request, String productId) {
        Set<String> prodPack = (Set<String>)request.getSession().getAttribute("PRODPACK");
        if(prodPack == null) {
            prodPack = new TreeSet<String>();
        }
        boolean r = prodPack.add(productId);
        if(r) {
            request.getSession().setAttribute("PRODPACK", prodPack);
            return JsonData.SUCCESS;
        }else{
            return JsonData.exception(SaleExceptionCode.ADD_TO_PACK_ERROR, "Duplicate product.");
        }
    }
    
    @RequestMapping(value="/sale/deletePackItem", method=RequestMethod.POST)
    public JsonData deletePackItem(HttpServletRequest request, String productId) {
        Set<String> prodPack = (Set<String>)request.getSession().getAttribute("PRODPACK");
        if(prodPack == null) {
            return JsonData.exception(SaleExceptionCode.DELETE_FROM_PACK_ERROR, "Product is not exists.");
        }
        boolean r = prodPack.remove(productId);
        if(r) {
            request.getSession().setAttribute("PRODPACK", prodPack);
            return JsonData.SUCCESS;
        }else{
            return JsonData.exception(SaleExceptionCode.DELETE_FROM_PACK_ERROR, "Product is not exists.");
        }
    }
    
    @RequestMapping(value="/sale/deleteContractProduct", method=RequestMethod.POST)
    public JsonData deleteContractProduct(String contractId, String productId) {
        saleService.deleteContractProduct(contractId, productId);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/sale/addProductToContract", method=RequestMethod.POST)
    public JsonData addProductToContract(String contractId, String productIds, String prices) {
        saleService.addProductToContract(contractId, productIds, prices);
        return JsonData.SUCCESS;
    }
    
    private DataTableSource<Product> convertToDataTableSource(int draw, Page<Product> productsPage) {
        DataTableSource<Product> dts = new DataTableSource<Product>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(productsPage.getTotalRecord());
        dts.setRecordsFiltered(productsPage.getTotalRecord());
        dts.setData(productsPage.getData());
        
        return dts;
    }
    
    @RequestMapping(value="/sale/saleContract/{id}", method=RequestMethod.DELETE)
    public JsonData deleteSaleContract(@PathVariable String id){
        try{
            saleService.deleteSaleContract(id);
        }catch(Exception e) {
            e.printStackTrace();
            JsonData.exception(SaleExceptionCode.DELETE_CONTRACT_ERR, "Delete contract error.");
        }
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/sale/deleteContractDoc", method=RequestMethod.POST)
    public JsonData deleteContractDoc(String contractId, String docId) {
        saleService.deleteContractDoc(contractId, docId);
        return JsonData.SUCCESS;
    }
    
    private DataTableSource<SaleContract> convertContractsToDataTableSource(int draw, Page<SaleContract> contractsPage) {
        DataTableSource<SaleContract> dts = new DataTableSource<SaleContract>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(contractsPage.getTotalRecord());
        dts.setRecordsFiltered(contractsPage.getTotalRecord());
        dts.setData(contractsPage.getData());
        
        return dts;
    }
}
