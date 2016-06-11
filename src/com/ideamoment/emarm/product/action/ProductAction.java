/**
 * 
 */
package com.ideamoment.emarm.product.action;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.product.service.ProductService;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;

/**
 * @author Chinakite
 *
 */
@Controller
public class ProductAction {
    @Autowired
    private ProductService productService;

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
    
    @RequestMapping(value="/product/products", method=RequestMethod.GET)
    public JsonData products(String ids) throws Exception {
        List<Product> products = productService.listProducts(ids);
        return JsonData.success(products);
    }
    
    @RequestMapping(value="/product/lastProducts", method=RequestMethod.GET)
    public JsonData lastProducts() throws Exception {
        List<Product> products = productService.listLastProducts();
        return JsonData.success(products);
    }
    
    @RequestMapping(value="/product/myProductPage", method=RequestMethod.GET)
    public ModelAndView toMyProducts() {
        return new ModelAndView("/WEB-INF/jsp/product/myproduct.jsp");
    }
    
    @RequestMapping(value="/product/dtMyProducts", method=RequestMethod.GET)
    public JsonData dtMyProducts(
                            int draw, 
                            int start, 
                            int length, 
                            String productName,
                            String authorName,
                            String isbn,
                            String subject,
                            String publishState,
                            String state                   
            ) throws Exception {
        
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
        
        
        Page<Product> products = productService.pageMyProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/product/productDetail", method=RequestMethod.GET)
    public ModelAndView viewProduct(String id) {
        Product product = productService.findProduct(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("product", product);
        return new ModelAndView("/WEB-INF/jsp/product/productDetail.jsp", model);
    }
    
    @RequestMapping(value="/product/product/{id}", method=RequestMethod.GET)
    public JsonData product(@PathVariable String id) {
        Product product = productService.findProduct(id);
        return JsonData.success(product);
    }
    
    @RequestMapping(value="/product/countMonthProduct", method=RequestMethod.GET)
    public JsonData countProductCurMonth() {
        Long count = productService.countProductCurMonth();
        return JsonData.success(count);
    }
    
    @RequestMapping(value="/product/quickQuery", method=RequestMethod.GET)
    public JsonData quickQuery(String name) {
        List<Product> products = productService.quickQuery(name);
        return JsonData.success(products);
    }
    
    @RequestMapping(value="/product/uploadCopyrightFile", method=RequestMethod.POST)
    public JsonData uploadCopyrightFile(String productId, String fileUrl) {
        productService.uploadCopyrightFile(productId, fileUrl);
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
}
