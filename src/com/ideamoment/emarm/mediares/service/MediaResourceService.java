/**
 * 
 */
package com.ideamoment.emarm.mediares.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.mediares.dao.MediaResourceDao;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductAudio;
import com.ideamoment.emarm.model.ProductImage;
import com.ideamoment.emarm.model.User;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class MediaResourceService {
    @Autowired
    private MediaResourceDao mediaResourceDao;

    /**
     * @return the mediaResourceDao
     */
    public MediaResourceDao getMediaResourceDao() {
        return mediaResourceDao;
    }
    
    /**
     * @param mediaResourceDao the mediaResourceDao to set
     */
    public void setMediaResourceDao(MediaResourceDao mediaResourceDao) {
        this.mediaResourceDao = mediaResourceDao;
    }

    @IdeaJdbcTx
    public Page<Product> pageProducts(int curPage,
                                      int pageSize,
                                      HashMap<String, String> condition)
    {
        return mediaResourceDao.pageProducts(curPage, pageSize, condition);
    }

    @IdeaJdbcTx
    public void saveProductImage(String productId,
                                 String name,
                                 String desc,
                                 String fileUrl)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        ProductImage image = new ProductImage();
        Date curTime = new Date();
        image.setCreateTime(curTime);
        image.setCreator(userId);
        image.setDesc(desc);
        image.setFileUrl(fileUrl);
        image.setModifier(userId);
        image.setModifyTime(curTime);
        image.setName(name);
        image.setProductId(productId);
        
        IdeaJdbc.save(image);
    }

    @IdeaJdbcTx
    public List<ProductImage> listProductImages(String productId) {
        return mediaResourceDao.listProductImages(productId);
    }

    @IdeaJdbcTx
    public void saveProductAudio(String productId,
                                 String name,
                                 String fileUrl)
    {
        UserContext uc = UserContext.getCurrentContext();
        User curUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        String userId = curUser.getId();
        
        ProductAudio audio = new ProductAudio();
        Date curTime = new Date();
        audio.setCreateTime(curTime);
        audio.setCreator(userId);
        audio.setFileUrl(fileUrl);
        audio.setModifier(userId);
        audio.setModifyTime(curTime);
        audio.setName(name);
        audio.setProductId(productId);
        
        IdeaJdbc.save(audio);
    }

    @IdeaJdbcTx
    public List<ProductImage> listProductAudioes(String productId) {
        return mediaResourceDao.listProductAudioes(productId);
    }
    
}
