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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.SaleContract;
import com.ideamoment.emarm.model.SaleContractProduct;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductState;
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
        
        String scId = sc.getId();
        saleDao.deleteContractProduct(scId);
        int i=0;
        for(String productId : productIdArr) {
            SaleContractProduct scp = new SaleContractProduct();
            scp.setProductId(productId);
            scp.setContactId(scId);
            scp.setPrice(new BigDecimal(priceArr[i]));
            i++;
            IdeaJdbc.save(scp);
            
            IdeaJdbc.update(Product.class, productId)
                    .setProperty("state", ProductState.SALED)
                    .execute();
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
    
}
