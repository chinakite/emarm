/**
 * 
 */
package com.ideamoment.emarm.make.action;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.evaluation.service.EvaluationService;
import com.ideamoment.emarm.make.service.MakeService;
import com.ideamoment.emarm.model.MakeContract;
import com.ideamoment.emarm.model.MakeContractDoc;
import com.ideamoment.emarm.model.MakeTask;
import com.ideamoment.emarm.model.MakeTaskAudio;
import com.ideamoment.emarm.model.MakeTaskAudioAudit;
import com.ideamoment.emarm.model.MakeTaskAudioFile;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.wx.util.StringUtils;

/**
 * @author Chinakite
 *
 */
@Controller
public class MakeAction {
    @Autowired
    private MakeService makeService;
    
    @Autowired
    private EvaluationService evaluationService;
    
    /**
     * @return the makeService
     */
    public MakeService getMakeService() {
        return makeService;
    }
    
    /**
     * @param makeService the makeService to set
     */
    public void setMakeService(MakeService makeService) {
        this.makeService = makeService;
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

    @RequestMapping(value="/make/taskProductPage", method=RequestMethod.GET)
    public ModelAndView toTaskProducts() {
        return new ModelAndView("/WEB-INF/jsp/make/taskProduct.jsp");
    }
    
    @RequestMapping(value="/make/contractProductPage", method=RequestMethod.GET)
    public ModelAndView toContractProducts() {
        return new ModelAndView("/WEB-INF/jsp/make/contractProduct.jsp");
    }
    
    @RequestMapping(value="/make/taskPage", method=RequestMethod.GET)
    public ModelAndView toTasks(String productId) {
        Product product = evaluationService.findProduct(productId);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("product", product);
        
        return new ModelAndView("/WEB-INF/jsp/make/task.jsp", model);
    }
    
    @RequestMapping(value="/make/dtProducts", method=RequestMethod.GET)
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
        
        Page<Product> products = makeService.pageProducts(curPage, pageSize, condition);
        DataTableSource<Product> dts = convertToDataTableSource(draw, products);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/make/makeTasks", method=RequestMethod.GET)
    public JsonData listMakeTasks(String productId) {
        List<MakeTask> tasks = makeService.listMakeTasks(productId);
        return JsonData.success(tasks);
    }
    
    @RequestMapping(value="/make/taskDetail", method=RequestMethod.GET)
    public ModelAndView makeTask(String id) {
        MakeTask task = makeService.findMakeTask(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("task", task);
        return new ModelAndView("/WEB-INF/jsp/make/taskDetail.jsp", model);
    }
    
    @RequestMapping(value="/make/makeTask", method=RequestMethod.POST)
    public JsonData saveMakeTask(String id,
                                 String productId, 
                                 String makerId, 
                                 String contractId,
                                 Integer timePerSection,
                                 String showType,
                                 String showExpection,
                                 Integer makeTime,
                                 String desc) {
        makeService.saveMakeTask(id,
                                 productId, 
                                 makerId, 
                                 contractId, 
                                 timePerSection, 
                                 showType,
                                 showExpection,
                                 makeTime,
                                 desc);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/makeContract", method=RequestMethod.POST)
    public JsonData saveMakeContract(
                        String id,
                        String productId,
                        String makerId,
                        String targetType,
                        String totalPrice,
                        String totalSection,
                        String price,
                        String penalty,
                        String owner,
                        String ownerContact,
                        String ownerContactPhone,
                        String ownerContactAddress,
                        String ownerContactEmail,
                        String worker,
                        String workerContact,
                        String workerContactPhone,
                        String workerContactAddress,
                        String workerContactEmail,
                        String bankAccountName,
                        String bank,
                        String bankAccountNo
            ) {
        MakeContract mc = null;
        if(StringUtils.isNotEmpty(id)) {
//            cc = makeService.findCopyContract(id);
        }else{
            mc = new MakeContract();
        }
        
        mc.setProductId(productId);
        mc.setMakerId(makerId);
        mc.setTargetType(targetType);
        
        mc.setTotalPrice(new BigDecimal(totalPrice));
        mc.setPrice(new BigDecimal(price));
        mc.setPenalty(new BigDecimal(penalty));
        mc.setTotalSection(Integer.valueOf(totalSection));
        
        mc.setOwner(owner);
        mc.setOwnerContact(ownerContact);
        mc.setOwnerContactAddress(ownerContactAddress);
        mc.setOwnerContactEmail(ownerContactEmail);
        mc.setOwnerContactPhone(ownerContactPhone);
        
        mc.setWorker(worker);
        mc.setWorkerContact(workerContact);
        mc.setWorkerContactAddress(workerContactAddress);
        mc.setWorkerContactEmail(workerContactEmail);
        mc.setWorkerContactPhone(workerContactPhone);
        
        mc.setBank(bank);
        mc.setBankAccountName(bankAccountName);
        mc.setBankAccountNo(bankAccountNo);
        
        makeService.saveMakeContract(mc);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/contractDetail", method=RequestMethod.GET)
    public ModelAndView makeContractDetail(String productId) {
        MakeContract contract = makeService.findMakeContractByProduct(productId);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("contract", contract);
        return new ModelAndView("/WEB-INF/jsp/make/contractDetail.jsp", model);
    }
    
    @RequestMapping(value="/make/contractDocs", method=RequestMethod.GET)
    public JsonData listContractDocs(String contractId) {
        List<MakeContractDoc> docs = makeService.listContractDocs(contractId);
        return JsonData.success(docs);
    }
    
    @RequestMapping(value="/make/generateDoc", method=RequestMethod.POST)
    public JsonData generateDoc(String id) {
        makeService.generateDoc(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/uploadContractDoc", method=RequestMethod.POST)
    public JsonData uploadContractDoc(String id, String fileUrl, String version) {
        makeService.uploadContractDoc(id, fileUrl, version);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/finishContract", method=RequestMethod.POST)
    public JsonData finishContract(String contractId) {
        makeService.finishContract(contractId);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/extMyTaskPage", method=RequestMethod.GET)
    public ModelAndView toExtMyTaskPage() {
        return new ModelAndView("/WEB-INF/jsp/make/extMyTaskPage.jsp");
    }
    
    @RequestMapping(value="/make/extMyMakeTasks", method=RequestMethod.GET)
    public JsonData listExtMyMakeTasks(int draw, 
                                       int start, 
                                       int length) {
        
        int curPage = start/length + 1;
        int pageSize = length;
        
        Page<MakeTask> tasks = makeService.pageExtMyMakeTasks(curPage, pageSize);
        DataTableSource<MakeTask> dts = convertTaskToDataTableSource(draw, tasks);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/make/extTaskDetail", method=RequestMethod.GET)
    public ModelAndView extTaskDetail(String id) {
        MakeTask task = makeService.findMakeTask(id);
        HashMap<String, Object> model = new HashMap<String, Object>();
        model.put("task", task);
        return new ModelAndView("/WEB-INF/jsp/make/extTaskDetail.jsp", model);
    }
    
    @RequestMapping(value="/make/makeTaskAudioes", method=RequestMethod.GET)
    public JsonData listMakeTaskAudioes(String id) {
        List<MakeTaskAudio> audioes = makeService.listMakeTaskAudioes(id);
        return JsonData.success(audioes);
    }
    
    @RequestMapping(value="/make/createSection", method=RequestMethod.POST)
    public JsonData createSection(String name, String makeTaskId) {
        makeService.createSection(name, makeTaskId);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/makeTaskAudioFile", method=RequestMethod.POST)
    public JsonData createMakeTaskAudioFile(String makeTaskAudioId, String version, String fileUrl) {
        makeService.createMakeTaskAudioFile(makeTaskAudioId, version, fileUrl);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/makeTaskAudioFiles", method=RequestMethod.GET)
    public JsonData listMakeTaskAudioFiles(String makeTaskAudioId) {
        List<MakeTaskAudioFile> files = makeService.listMakeTaskAudioFiles(makeTaskAudioId);
        return JsonData.success(files);
    }
    
    @RequestMapping(value="/make/makeTaskAudioAudits", method=RequestMethod.GET)
    public JsonData listMakeTaskAudioAudits(String makeTaskAudioId) {
        List<MakeTaskAudioAudit> audits = makeService.listMakeTaskAudioAudits(makeTaskAudioId);
        return JsonData.success(audits);
    }
    
    @RequestMapping(value="/make/makeTaskAudioAudit", method=RequestMethod.POST)
    public JsonData createMakeTaskAudioAudit(String makeTaskAudioId, String remark) {
        makeService.createMakeTaskAudioAudit(makeTaskAudioId, remark, "-1");
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/passMakeTaskAudioAudit", method=RequestMethod.POST)
    public JsonData passMakeTaskAudioAudit(String makeTaskAudioId, String remark) {
        makeService.createMakeTaskAudioAudit(makeTaskAudioId, remark, YesOrNo.YES);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/make/rejectMakeTaskAudioAudit", method=RequestMethod.POST)
    public JsonData rejectMakeTaskAudioAudit(String makeTaskAudioId, String remark) {
        makeService.createMakeTaskAudioAudit(makeTaskAudioId, remark, YesOrNo.NO);
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
    
    private DataTableSource<MakeTask> convertTaskToDataTableSource(int draw, Page<MakeTask> tasksPage) {
        DataTableSource<MakeTask> dts = new DataTableSource<MakeTask>();        
        dts.setDraw(draw);
        dts.setRecordsTotal(tasksPage.getTotalRecord());
        dts.setRecordsFiltered(tasksPage.getTotalRecord());
        dts.setData(tasksPage.getData());
        
        return dts;
    }
}
