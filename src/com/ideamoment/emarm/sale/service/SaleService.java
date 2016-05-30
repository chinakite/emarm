/**
 * 
 */
package com.ideamoment.emarm.sale.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.CopyrightContract;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.SaleContract;
import com.ideamoment.emarm.model.SaleContractDoc;
import com.ideamoment.emarm.model.SaleContractProduct;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
import com.ideamoment.emarm.model.enumeration.SaleContractState;
import com.ideamoment.emarm.sale.dao.SaleDao;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class SaleService {
    @Autowired
    private SaleDao saleDao;
    
    /**
     * @return the saleDao
     */
    public SaleDao getSaleDao() {
        return saleDao;
    }
    
    /**
     * @param saleDao the saleDao to set
     */
    public void setSaleDao(SaleDao saleDao) {
        this.saleDao = saleDao;
    }

    @IdeaJdbcTx
    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      HashMap<String, String> condition)
    {
        Page<Product> products = saleDao.pageProducts(curPage, pageSize, condition);
        
        List<String> productIds = new ArrayList<String>();
        List<Product> prodList = products.getData();
        for(Product prod : prodList) {
            productIds.add(prod.getId());
        }
        
        Map<String, Long> contractCounts = saleDao.countContractByProduct(productIds);
        for(Product prod : prodList) {
            if(contractCounts.get(prod.getId()) != null) {
                prod.setContractCount(contractCounts.get(prod.getId()).intValue());
            }else{
                prod.setContractCount(0);
            }
        }
        
        return products;
    }

    @IdeaJdbcTx
    public SaleContract findSaleContract(String contractId) {
        return IdeaJdbc.find(SaleContract.class, contractId);
    }

    @IdeaJdbcTx
    public void saveSaleContract(SaleContract sc,
                                      String[] productIdArr,
                                      String[] priceArr,
                                      int submit)
    {
        if(submit == 0) {
            
        }else{
            
        }
        
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        Date curDate = new Date();
        
        if(sc.getId() != null) {
            sc.setModifier(userId);
            sc.setModifyTime(curDate);
            IdeaJdbc.update(sc);
        }else{
            String code = createCode(sc);
            sc.setCode(code);
            
            sc.setCreator(userId);
            sc.setCreateTime(curDate);
            sc.setModifier(userId);
            sc.setModifyTime(curDate);
            
            IdeaJdbc.save(sc);
        }
        
        if(productIdArr != null) {
            String scId = sc.getId();
            saleDao.deleteContractProduct(scId);
            int i=0;
            for(String productId : productIdArr) {
                SaleContractProduct scp = new SaleContractProduct();
                scp.setProductId(productId);
                scp.setContractId(scId);
                scp.setPrice(new BigDecimal(priceArr[i]));
                i++;
                IdeaJdbc.save(scp);
                
                IdeaJdbc.update(Product.class, productId)
                        .setProperty("state", ProductState.SALED)
                        .execute();
            }
        }
    }
    
    private synchronized String createCode(SaleContract sc) {
        Date curDate = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String dateStr = df.format(curDate);
        String prefix = "S" + dateStr;
        String maxCode = saleDao.queryMaxContractCode(prefix);
        
        int intCode = 1;
        if(maxCode != null) {
            String[] codeParts = maxCode.split("-");
            intCode = Integer.parseInt(codeParts[1]);
            intCode++;
        }
        
        DecimalFormat nf = new DecimalFormat("000");
        String strCode = nf.format(intCode);
        
        return prefix + "-" + strCode;
    }

    @IdeaJdbcTx
    public Product findProduct(String productId) {
        return IdeaJdbc.find(Product.class, productId);
    }

    @IdeaJdbcTx
    public List<SaleContract> listProductContracts(String productId) {
        return saleDao.listProductContracts(productId);
    }

    @IdeaJdbcTx
    public Page<SaleContract> pageContracts(int curPage,
                                            int pageSize,
                                            HashMap<String, String> condition)
    {
        return saleDao.pageContracts(curPage, pageSize, condition);
    }

    @IdeaJdbcTx
    public SaleContract findContract(String id) {
        return IdeaJdbc.find(SaleContract.class, id);
    }

    @IdeaJdbcTx
    public List<Product> listContractProducts(String contractId) {
        return saleDao.listContractProducts(contractId);
    }

    @IdeaJdbcTx
    public List<SaleContractDoc> listContractDocs(String contractId) {
        return saleDao.listContractDocs(contractId);
    }

    @IdeaJdbcTx
    public void uploadContractDoc(String id,
                                  String fileUrl,
                                  String version,
                                  String type)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        SaleContractDoc ccd = new SaleContractDoc();
        ccd.setContractId(id);
        ccd.setCreateTime(new Date());
        ccd.setCreatorId(curUser.getId());
        ccd.setVersion(version);
        ccd.setFileUrl(fileUrl);
        ccd.setType(type);
        
        IdeaJdbc.save(ccd);
        
    }

    @IdeaJdbcTx
    public void finishContract(String contractId) {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        SaleContract mc = IdeaJdbc.find(SaleContract.class, contractId);
        mc.setModifier(curUser.getId());
        mc.setModifyTime(new Date());
        mc.setState(SaleContractState.FINISHED);
        IdeaJdbc.update(mc);
    }

    @IdeaJdbcTx
    public Long countSaleCurMonth() {
        DateTime curDate = new DateTime();
        int year = curDate.getYear();
        int month = curDate.getMonthOfYear();
        
        DateTime startDate = new DateTime(year, month, 1, 0, 0, 0, 0);
        DateTime endDate = new DateTime(year, month+1, 1, 0, 0, 0, 0);
        
        return saleDao.countSaleByTime(startDate.toDate(), endDate.toDate());
    }

    @IdeaJdbcTx
    public void deleteSaleContract(String contractId) {
        saleDao.deleteContractAudit(contractId);
        saleDao.deleteContractDoc(contractId);
        saleDao.deleteContractProduct(contractId);
        IdeaJdbc.delete(SaleContract.class, contractId);
    }

    @IdeaJdbcTx
    public void deleteContractProduct(String contractId, String productId) {
        SaleContractProduct scp = saleDao.findSaleContractProduct(contractId, productId);
        BigDecimal price = scp.getPrice();
        
        SaleContract sc = IdeaJdbc.find(SaleContract.class, contractId);
        BigDecimal totalPrice = sc.getTotalPrice();
        totalPrice = totalPrice.subtract(price);
        sc.setTotalPrice(totalPrice);
        
        saleDao.deleteContractProduct(contractId, productId);
        IdeaJdbc.update(sc);
    }

    @IdeaJdbcTx
    public void addProductToContract(String contractId,
                                     String productIds,
                                     String prices)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        
        String[] productIdArr = productIds.split(",");
        String[] priceArr = prices.split(",");
        
        BigDecimal totalPrice = IdeaJdbc.find(SaleContract.class, contractId).getTotalPrice();
        
        for(int i=0; i<productIdArr.length; i++) {
            SaleContractProduct scp = new SaleContractProduct();
            BigDecimal price = new BigDecimal(priceArr[i]);
            scp.setContractId(contractId);
            scp.setPrice(price);
            scp.setProductId(productIdArr[i]);
            totalPrice = totalPrice.add(price);
            IdeaJdbc.save(scp);
        }
        
        
        IdeaJdbc.update(SaleContract.class, contractId)
                .setProperty("modifyTime", new Date())
                .setProperty("modifier", curUser.getId())
                .setProperty("totalPrice", totalPrice)
                .execute();
    }

    @IdeaJdbcTx
    public void deleteContractDoc(String contractId, String docId) {
        IdeaJdbc.delete(SaleContractDoc.class, docId);
    }
}
