/**
 * 
 */
package com.ideamoment.emarm.mediares.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.ideamoment.ideadp.appcontext.IdeaApplicationContext;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;

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
    public Page<Product> pagePreProducts(int curPage,
                                         int pageSize,
                                         HashMap<String, String> condition)
    {
        return mediaResourceDao.pagePreProducts(curPage, pageSize, condition);
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
    public List<ProductAudio> listProductAudioes(String productId) {
        return mediaResourceDao.listProductAudioes(productId);
    }

    @IdeaJdbcTx
    public DownloadFile packageDownload(String productId) throws ZipException {
        Product product = IdeaJdbc.find(Product.class, productId);
        
        List<ProductAudio> audioes = mediaResourceDao.listProductAudioes(productId);
        final ArrayList<File> fileAddZip = new ArrayList<File>(); // 向zip包中添加文件集合  
        String webRoot = IdeaApplicationContext.getInstance().getWebRoot();
        if(webRoot.endsWith("/") || webRoot.endsWith("\\")) {
            webRoot = webRoot.substring(0, webRoot.length() - 2);
        }
        for(ProductAudio audio : audioes) {
            String fileUrl = audio.getFileUrl();
            fileAddZip.add(new File(webRoot + fileUrl)); // 向zip包中添加一个文件
        }
        
        try {  
            Date date = new Date();
            String zipFileName = product.getName() + "_" + date.getTime() + ".zip";
            String zipFileUrl = "/zip/" + zipFileName;
            String zipFilePath = webRoot + zipFileUrl;
            
            final ZipFile zipFile = new ZipFile(zipFilePath); // 創建zip包，指定了zip路徑和zip名稱  
            final ZipParameters parameters = new ZipParameters(); // 设置zip包的一些参数集合  
            parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE); // 压缩方式(默认值)  
            parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL); // 普通级别（参数很多）  
            zipFile.createZipFile(fileAddZip, parameters); // 创建压缩包完成  
            
            DownloadFile dfile = new DownloadFile();
            dfile.setFilePath(zipFilePath);
            dfile.setFileUrl(zipFileUrl);
            dfile.setProductId(productId);
            dfile.setFileName(zipFileName);
            return dfile;
        } catch (final ZipException e) {  
            e.printStackTrace();
            throw e;
        }  
    }
    
    public class DownloadFile {
        String filePath;
        String fileUrl;
        String productId;
        String fileName;
        
        /**
         * @return the filePath
         */
        public String getFilePath() {
            return filePath;
        }
        
        /**
         * @param filePath the filePath to set
         */
        public void setFilePath(String filePath) {
            this.filePath = filePath;
        }
        
        /**
         * @return the fileUrl
         */
        public String getFileUrl() {
            return fileUrl;
        }
        
        /**
         * @param fileUrl the fileUrl to set
         */
        public void setFileUrl(String fileUrl) {
            this.fileUrl = fileUrl;
        }
        
        /**
         * @return the productId
         */
        public String getProductId() {
            return productId;
        }
        
        /**
         * @param productId the productId to set
         */
        public void setProductId(String productId) {
            this.productId = productId;
        }
        
        /**
         * @return the productName
         */
        public String getFileName() {
            return fileName;
        }
        
        /**
         * @param productName the productName to set
         */
        public void setFileName(String fileName) {
            this.fileName = fileName;
        }
        
        
    }

    
}
