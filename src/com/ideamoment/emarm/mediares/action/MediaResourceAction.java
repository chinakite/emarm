/**
 * 
 */
package com.ideamoment.emarm.mediares.action;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.evaluation.service.EvaluationService;
import com.ideamoment.emarm.mediares.DownloadException;
import com.ideamoment.emarm.mediares.DownloadExceptionCode;
import com.ideamoment.emarm.mediares.service.MediaResourceService;
import com.ideamoment.emarm.mediares.service.MediaResourceService.DownloadFile;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductAudio;
import com.ideamoment.emarm.model.ProductImage;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;

import net.lingala.zip4j.exception.ZipException;

/**
 * @author Chinakite
 *
 */
@Controller
public class MediaResourceAction {
    @Autowired
    private MediaResourceService mediaResourceService;

    @Autowired
    private EvaluationService evaluationService;
    
    /**
     * @return the mediaResourceService
     */
    public MediaResourceService getMediaResourceService() {
        return mediaResourceService;
    }
    
    /**
     * @param mediaResourceService the mediaResourceService to set
     */
    public void setMediaResourceService(MediaResourceService mediaResourceService) {
        this.mediaResourceService = mediaResourceService;
    }
    
    /**
     * @return the evaluationService
     */
    public EvaluationService getEvaluationService() {
        return evaluationService;
    }
    
    /**
     * @param evaluationService the evaluationService to set
     */
    public void setEvaluationService(EvaluationService evaluationService) {
        this.evaluationService = evaluationService;
    }

    @RequestMapping(value="/mediares/productPage", method=RequestMethod.GET)
    public ModelAndView toProducts() {
        return new ModelAndView("/WEB-INF/jsp/mediares/product.jsp");
    }
    
    @RequestMapping(value="/mediares/preProductPage", method=RequestMethod.GET)
    public ModelAndView toPreProducts() {
        return new ModelAndView("/WEB-INF/jsp/mediares/preProduct.jsp");
    }
    
    @RequestMapping(value="/mediares/dtProducts", method=RequestMethod.GET)
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
        
        Page<Product> products = mediaResourceService.pageProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/mediares/dtPreProducts", method=RequestMethod.GET)
    public JsonData dtPreProducts(
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
        
        Page<Product> products = mediaResourceService.pagePreProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/mediares/productDetail", method=RequestMethod.GET)
    public ModelAndView viewProduct(String id) {
        Product product = evaluationService.findProduct(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("product", product);
        return new ModelAndView("/WEB-INF/jsp/mediares/productDetail.jsp", model);
    }
    
    @RequestMapping(value="/mediares/productImage", method=RequestMethod.POST)
    public JsonData createProductImage(String productId, 
                                           String name, 
                                           String desc,
                                           String fileUrl) {
        mediaResourceService.saveProductImage(productId, name, desc, fileUrl);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/mediares/productImages", method=RequestMethod.GET)
    public JsonData listProductImages(String productId) {
        List<ProductImage> images = mediaResourceService.listProductImages(productId);
        return JsonData.success(images);
    }
    
    @RequestMapping(value="/mediares/productAudio", method=RequestMethod.POST)
    public JsonData createProductAudio(String productId, 
                                           String name, 
                                           String fileUrl) {
        mediaResourceService.saveProductAudio(productId, name, fileUrl);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/mediares/productAudioes", method=RequestMethod.GET)
    public JsonData listProductAudioes(String productId) {
        List<ProductAudio> images = mediaResourceService.listProductAudioes(productId);
        return JsonData.success(images);
    }
    
    @RequestMapping(value="/mediares/packageDownload", method=RequestMethod.GET)
    public void packageDownload(HttpServletRequest request, HttpServletResponse response, String productId) throws ZipException {
        DownloadFile dfile = mediaResourceService.packageDownload(productId);
        
        OutputStream os = null;  
        try {
            os = response.getOutputStream();
            response.reset();
            
            response.setHeader("Content-Disposition", "attachment; filename=" + dfile.getFileName());  
            response.setContentType("application/octet-stream; charset=utf-8");  
            os.write(FileUtils.readFileToByteArray(new File(dfile.getFilePath())));  
            os.flush(); 
        }catch (IOException e) {
            e.printStackTrace();
            throw new DownloadException(DownloadExceptionCode.IO_ERROR, e.getMessage(), e);
        } finally {  
            if (os != null) {  
                try {
                    os.close();
                } catch (IOException ie) {
                    ie.printStackTrace();
                    throw new DownloadException(DownloadExceptionCode.IO_ERROR, ie.getMessage(), ie);
                }  
            }  
        }  
    }
    
    @RequestMapping(value="/mediares/productToMediares", method=RequestMethod.POST)
    public JsonData productToMediares(String productId) {
        mediaResourceService.productToMediares(productId);
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
