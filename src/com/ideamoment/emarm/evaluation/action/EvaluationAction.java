/**
 * 
 */
package com.ideamoment.emarm.evaluation.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.evaluation.service.EvaluationService;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.Evaluation;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;

/**
 * @author Chinakite
 *
 */
@Controller
public class EvaluationAction {
    @Autowired
    private EvaluationService evaluationService;

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
    
    @RequestMapping(value="/evaluation/productPage", method=RequestMethod.GET)
    public ModelAndView toProducts() {
        return new ModelAndView("/WEB-INF/jsp/evaluation/product.jsp");
    }
    
    @RequestMapping(value="/evaluation/dtProducts", method=RequestMethod.GET)
    public JsonData dtAuthors(int draw, int start, int length, String key) {
        int curPage = start/length + 1;
        int pageSize = length;
        Page<Product> products = evaluationService.pageProducts(curPage, pageSize);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/evaluation/productDetail", method=RequestMethod.GET)
    public ModelAndView viewProduct(String id) {
        Product product = evaluationService.findProduct(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("product", product);
        return new ModelAndView("/WEB-INF/jsp/evaluation/productDetail.jsp", model);
    }
    
    @RequestMapping(value="/evaluation/product/{id}", method=RequestMethod.GET)
    public JsonData product(@PathVariable String id) {
        Product product = evaluationService.findProduct(id);
        return JsonData.success(product);
    }
    
    @RequestMapping(value="/evaluation/product", method=RequestMethod.POST)
    public JsonData createProduct(
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
                        String submit) {
        Product product = new Product();
        product.setName(name);
        
        Author author = new Author();
        author.setName(authorName);
        author.setPseudonym(authorPseudonym);

        product.setAuthor(author);
        if(wordCount != null) {
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
        
        List<ProductSample> sampleList = new ArrayList<ProductSample>();
        String[] sampleArray = samples.split(",");
        for(String sampleUrl : sampleArray) {
            ProductSample sample = new ProductSample();
            sample.setFileUrl(sampleUrl);
            sampleList.add(sample);
        }
        product.setSamples(sampleList);
        
        product = evaluationService.saveProduct(product, submit);
        return JsonData.success(product);
    }
    
    @RequestMapping(value="/evaluation/inviteEvaluation/{id}", method=RequestMethod.POST)
    public JsonData inviteEvaluation(@PathVariable String id, String userIds) {
        evaluationService.inviteEvaluation(id, userIds);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/evaluation/toDoEvaluation", method=RequestMethod.GET)
    public ModelAndView toDoEvaluation(String productId) {
        Product product = evaluationService.findProduct(productId);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("product", product);
        return new ModelAndView("/WEB-INF/jsp/evaluation/evaluate.jsp", model);
    }
    
    @RequestMapping(value="/evaluation/evaluate", method=RequestMethod.POST)
    public JsonData evaluate(
                            String productId,
                            int storyFrame,
                            int storyText,
                            int storyRole,
                            String targetGender,
                            String targetAge,
                            String targetPosition,
                            String storySuggest,
                            int audioEdit,
                            String playType,
                            String playStyle,
                            String makeSuggest ) {
        
        Evaluation eva = new Evaluation();
        eva.setProductId(productId);
        eva.setStoryFrame(storyFrame);
        eva.setStoryText(storyText);
        eva.setStoryRole(storyRole);
        eva.setTargetGender(targetGender);
        eva.setTargetAge(targetAge);
        eva.setTargetPosition(targetPosition);
        eva.setStorySuggest(storySuggest);
        eva.setAudioEdit(audioEdit);
        eva.setPlayType(playType);
        eva.setPlayStyle(playStyle);
        eva.setMakeSuggest(makeSuggest);
        
        evaluationService.saveEvaluation(eva);
        
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
