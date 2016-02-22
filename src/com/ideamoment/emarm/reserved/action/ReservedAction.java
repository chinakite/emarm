/**
 * 
 */
package com.ideamoment.emarm.reserved.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.reserved.service.ReservedService;
import com.ideamoment.ideadp.restful.json.JsonData;

/**
 * @author Chinakite
 *
 */
@Controller
public class ReservedAction {
    @Autowired
    private ReservedService reservedService;
    
    /**
     * @return the reservedService
     */
    public ReservedService getReservedService() {
        return reservedService;
    }

    /**
     * @param reservedService the reservedService to set
     */
    public void setReservedService(ReservedService reservedService) {
        this.reservedService = reservedService;
    }
    
    @RequestMapping(value="/reserved/productPage", method=RequestMethod.GET)
    public ModelAndView toProductPage() {
        return new ModelAndView("/WEB-INF/jsp/reserved/product.jsp");
    }
    
    @RequestMapping(value="/reserved/products", method=RequestMethod.GET)
    public JsonData products() {
        List<Product> products = reservedService.listReservedProducts();
        return JsonData.success(products);
    }
    
    @RequestMapping(value="/reserved/reservedProduct", method=RequestMethod.POST)
    public JsonData reservedProduct(String id, String desc) {
        reservedService.reservedProduct(id, desc);
        return JsonData.SUCCESS;
    }
}
