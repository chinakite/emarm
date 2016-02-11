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
import com.ideamoment.emarm.model.FinalEvaluation;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.wx.util.StringUtils;

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
    
    @RequestMapping(value="/evaluation/myProductPage", method=RequestMethod.GET)
    public ModelAndView toMyProducts() {
        return new ModelAndView("/WEB-INF/jsp/evaluation/myproduct.jsp");
    }
    
    @RequestMapping(value="/evaluation/productPage", method=RequestMethod.GET)
    public ModelAndView toProducts() {
        return new ModelAndView("/WEB-INF/jsp/evaluation/product.jsp");
    }
    
    @RequestMapping(value="/evaluation/dtProducts", method=RequestMethod.GET)
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
        
        Page<Product> products = evaluationService.pageProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/evaluation/dtMyProducts", method=RequestMethod.GET)
    public JsonData dtMyProducts(
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
        
        Page<Product> products = evaluationService.pageMyProducts(curPage, pageSize, condition);
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
            product = evaluationService.findProductById(id);
        }
        
        product.setId(id);
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
        product.setIsbn(isbn);
        
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
                            String storyTarget,
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
        eva.setStoryTarget(storyTarget);
        eva.setStorySuggest(storySuggest);
        eva.setAudioEdit(audioEdit);
        eva.setPlayType(playType);
        eva.setPlayStyle(playStyle);
        eva.setMakeSuggest(makeSuggest);
        
        evaluationService.saveEvaluation(eva);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/evaluation/passProduct", method=RequestMethod.POST)
    public JsonData passProduct(String id) {
        evaluationService.passProduct(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/evaluation/rejectProduct", method=RequestMethod.POST)
    public JsonData rejectProduct(String id) {
        evaluationService.rejectProduct(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/evaluation/product/{id}", method=RequestMethod.DELETE)
    public JsonData deleteProduct(@PathVariable String id) {
        int r = evaluationService.deleteProduct(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/evaluation/{productId}/evaluations", method=RequestMethod.GET)
    public JsonData evaluations(@PathVariable String productId) {
        List<Evaluation> evaluations = evaluationService.listEvaluations(productId);
        return JsonData.success(evaluations);
    }
    
    @RequestMapping(value="/evaluation/finishEvaluation", method=RequestMethod.POST)
    public JsonData finishEvaluation(String productId,
                                     String productLevel,
                                     String authorLevel,
                                     String storyValue,
                                     String makeValue,
                                     String onlyWebCast,
                                     String hotSubject,
                                     String refPrice) {
        
        FinalEvaluation finalEva = new FinalEvaluation();
        finalEva.setProductId(productId);
        finalEva.setProductLevel(productLevel);
        finalEva.setAuthorLevel(authorLevel);
        finalEva.setStoryValue(storyValue);
        finalEva.setMakeValue(makeValue);
        finalEva.setOnlyWebCast(onlyWebCast);
        finalEva.setHotSubject(hotSubject);
        finalEva.setRefPrice(refPrice);
        
        evaluationService.finishEvaluation(finalEva);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/evaluation/finalEvaluation", method=RequestMethod.GET)
    public JsonData findFinalEvaluation(String productId) {
        FinalEvaluation finalEva = evaluationService.findFinalEvaluation(productId);
        return JsonData.success(finalEva);
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
