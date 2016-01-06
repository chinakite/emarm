/**
 * 
 */
package com.emarm;

import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.Evaluation;
import com.ideamoment.emarm.model.Product;
import com.ideamoment.emarm.model.ProductSample;
import com.ideamoment.emarm.model.Subject;
import com.ideamoment.emarm.model.User;
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
                Evaluation.class
                };
        
        for(Class clz : cls) {
            tool.syncTable("emarm", "emres", null, clz, true);
        }
        
    }

}
