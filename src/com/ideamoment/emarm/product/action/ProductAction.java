/**
 * 
 */
package com.ideamoment.emarm.product.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.product.service.ProductService;
import com.ideamoment.ideadp.restful.json.JsonData;

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
}
