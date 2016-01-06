/**
 * 
 */
package com.ideamoment.emarm.author.dao;

import org.springframework.stereotype.Component;

import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.User;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.action.Query;

/**
 * @author Chinakite
 *
 */
@Component
public class AuthorDao {

    public Page<Author> pageAuthors(String key, int curPage, int pageSize) {
        String sql = "select * from T_AUTHOR ";
        
        if(key != null) {
            sql += " where (c_name like :name or c_pseudonym like :pseudonym) ";
        }
        
        sql += " order by C_MODIFYTIME desc";
            
        Query query = IdeaJdbc.query(sql);
        
        if(key != null) {
            query.setParameter("name", "%" + key + "%");
            query.setParameter("pseudonym", "%" + key + "%");
        }
        
        return query.pageTo(Author.class, curPage, pageSize);
    }
    
    public Author queryAuthor(String name, String ignoreId) {
        String sql = "select * from T_AUTHOR where C_NAME = :name";
        
        if(ignoreId != null) {
            sql += " and C_ID <> :id";
        }
        
        Query query = IdeaJdbc.query(sql)
                                .setParameter("name", name);
        
        if(ignoreId != null) {
            query.setParameter("id", ignoreId);
        }
        
        Author author = (Author)query.uniqueTo(Author.class);
        
        return author;
    }

    public boolean existsProductsByAuthor(String id) {
        String sql = "select 1 from T_PRODUCT where C_AUTHOR_ID = :id limit 1,1";
        
        Object o = IdeaJdbc.query(sql).setParameter("id", id).uniqueValue();
        if(o == null) {
            return false;
        }else{
            return true;
        }
    }
    
}
