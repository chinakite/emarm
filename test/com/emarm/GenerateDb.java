/**
 * 
 */
package com.emarm;

import com.ideamoment.emarm.model.CopyrightContractAudit;
import com.ideamoment.emarm.model.CopyrightContractDoc;
import com.ideamoment.emarm.model.MakeContract;
import com.ideamoment.emarm.model.MakeContractDoc;
import com.ideamoment.emarm.model.MakeTask;
import com.ideamoment.emarm.model.ProductAudio;
import com.ideamoment.emarm.model.ProductImage;
import com.ideamoment.emarm.model.SaleContract;
import com.ideamoment.emarm.model.SaleContractDoc;
import com.ideamoment.emarm.model.SaleContractProduct;
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
                  SaleContract.class,
                  SaleContractProduct.class,
                  SaleContractDoc.class
                };
        
        for(Class clz : cls) {
            tool.syncTable("emarm", "emres", null, clz, true);
        }
        
    }

}
