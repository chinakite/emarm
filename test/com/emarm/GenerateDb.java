/**
 * 
 */
package com.emarm;

import com.ideamoment.emarm.model.CopyrightContractAudit;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.EmailSetting;
import com.ideamoment.emarm.model.EvaluationInvitation;
import com.ideamoment.emarm.model.MakeContract;
import com.ideamoment.emarm.model.MakeContractDoc;
import com.ideamoment.emarm.model.MakeTask;
import com.ideamoment.emarm.model.MakeTaskAudio;
import com.ideamoment.emarm.model.MakeTaskAudioAudit;
import com.ideamoment.emarm.model.MakeTaskAudioFile;
import com.ideamoment.emarm.model.MakeTaskCopyrightFile;
import com.ideamoment.emarm.model.ProductAudio;
import com.ideamoment.emarm.model.ProductCopyrightFile;
import com.ideamoment.emarm.model.ProductCopyrightOprtor;
import com.ideamoment.emarm.model.ProductImage;
import com.ideamoment.emarm.model.ProductReservedInfo;
import com.ideamoment.emarm.model.SaleContract;
import com.ideamoment.emarm.model.SaleContractDoc;
import com.ideamoment.emarm.model.SaleContractProduct;
import com.ideamoment.emarm.model.Task;
import com.ideamoment.ideajdbc.configuration.IdeaJdbcConfiguration;
import com.ideamoment.ideajdbc.tool.mysql.entity2ddl.MySqlEntity2Ddl;

/**
 * @author Chinakite
 *
 */
public class GenerateDb {

    /**
     * @param args
     */
    public static void main(String[] args) {
        IdeaJdbcConfiguration.initConfig("ideajdbc.properties");
        
        MySqlEntity2Ddl tool = new MySqlEntity2Ddl();
        Class[] cls = new Class[]{
//                Subject.class,
//              User.class,
//                Author.class,
//                Product.class,
//                ProductSample.class,
//                Evaluation.class,
//                FinalEvaluation.class,
//                CopyrightContract.class,
//                CopyrightContractProduct.class,
//                  CopyrightContractAudit.class,
//                  CopyrightContractDoc.class,
//                  ProductImage.class,
//                  ProductAudio.class,
//                  MakeTask.class,
//                  MakeContract.class,
//                MakeContractDoc.class,
//                  SaleContract.class,
//                  SaleContractProduct.class,
//                  SaleContractDoc.class,
//                  Task.class,
//                    ProductReservedInfo.class,
//                MakeTaskAudio.class,
//                MakeTaskAudioAudit.class,
//                MakeTaskAudioFile.class,
//                  EmailSetting.class,
//                    ProductCopyrightFile.class,
//                    EvaluationInvitation.class,
//                  ProductCopyrightOprtor.class,
                MakeTaskCopyrightFile.class
                };
        
        for(Class clz : cls) {
            tool.syncTable("emarm", "emres", null, clz, true);
        }
        
    }

}
