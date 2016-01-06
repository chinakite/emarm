/**
 * 
 */
package com.ideamoment.emarm.copyright.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Chinakite
 *
 */
@Controller
public class CopyrightAction {
    @RequestMapping(value="/copyright/productPage", method=RequestMethod.GET)
    public ModelAndView toProducts() {
        return new ModelAndView("/WEB-INF/jsp/copyright/product.jsp");
    }
}
