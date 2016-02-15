/**
 * 
 */
package com.ideamoment.emarm.sale.action;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.model.CopyrightContract;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.SaleContract;
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
        SaleContract sc = null;
        if(StringUtils.isNotEmpty(contractId)) {
            sc = saleService.findSaleContract(contractId);
        }else{
            sc = new SaleContract();
        }
        
        sc.setTotalPrice(new BigDecimal(totalPrice));
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
        
        String[] productIdArr = contractProductIds.split(",");
        String[] priceArr = prices.split(",");
        
        saleService.saveSaleContract(sc, productIdArr, priceArr, submit);
        
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
    
    private DataTableSource<SaleContract> convertContractsToDataTableSource(int draw, Page<SaleContract> contractsPage) {
        DataTableSource<SaleContract> dts = new DataTableSource<SaleContract>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(contractsPage.getTotalRecord());
        dts.setRecordsFiltered(contractsPage.getTotalRecord());
        dts.setData(contractsPage.getData());
        
        return dts;
    }
}
