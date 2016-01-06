/**
 * 
 */
package com.ideamoment.emarm.author.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.author.dao.AuthorDao;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.model.Subject;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.model.enumeration.YesOrNo;
import com.ideamoment.ideadp.exception.IdeaDataException;
import com.ideamoment.ideadp.exception.IdeaDataExceptionCode;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.action.Page;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class AuthorService {
    @Autowired
    private AuthorDao authorDao;
    
    /**
     * @return the authorDao
     */
    public AuthorDao getAuthorDao() {
        return authorDao;
    }
    
    /**
     * @param authorDao the authorDao to set
     */
    public void setAuthorDao(AuthorDao authorDao) {
        this.authorDao = authorDao;
    }

    @IdeaJdbcTx
    public Page<Author> pageAuthors(String key, int curPage, int pageSize) {
        return authorDao.pageAuthors(key, curPage, pageSize);
    }

    @IdeaJdbcTx
    public Author createAuthor(String name, String desc, String pseudonym) {
        UserContext uc = UserContext.getCurrentContext();
        User user = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        Author existsAuthor = authorDao.queryAuthor(name, null);
        
        if(existsAuthor != null) {
            throw duplicateException(name);
        }else{
            Author author = new Author();
            author.setName(name);
            author.setPseudonym(pseudonym);
            author.setDesc(desc);
            author.setCreateTime(new Date());
            author.setCreator(user.getId());
            author.setModifyTime(new Date());
            author.setModifier(user.getId());

            IdeaJdbc.save(author);
            
            return author;
        }
    }

    private RuntimeException duplicateException(String name) {
        return new IdeaDataException(IdeaDataExceptionCode.DUPLICATED_DATA, String.format("Author[%s] is exists.", name));
    }
    
    private RuntimeException dataNotFoundException(String id) {
        return new IdeaDataException(IdeaDataExceptionCode.DATA_NOU_FOUND, String.format("Author[%s] is not found.", id));
    }
    
    private RuntimeException canNotDeleteException(String id) {
        return new IdeaDataException(IdeaDataExceptionCode.CANT_DELETE_DUE_ASSO_DATA, String.format("Author[%s] has products.", id));
    }

    @IdeaJdbcTx
    public Author findAuthor(String id) {
        return IdeaJdbc.find(Author.class, id);
    }

    @IdeaJdbcTx
    public int updateAuthor(String id, String name, String desc, String pseudonym) {
        UserContext uc = UserContext.getCurrentContext();
        User optUser = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        Author author = IdeaJdbc.find(Author.class, id);
        
        if(author == null) {
            throw dataNotFoundException(id);
        }else{
            Author existsAuthor = authorDao.queryAuthor(name, id);
            if(existsAuthor != null) {
                duplicateException(name);
            }
            
            author.setName(name);
            author.setPseudonym(pseudonym);
            author.setModifyTime(new Date());
            author.setModifier(optUser.getId());
            author.setDesc(desc);
            
            return IdeaJdbc.update(author);
        }
    }

    @IdeaJdbcTx
    public int deleteAuthor(String id) {
        boolean r = authorDao.existsProductsByAuthor(id);
        if(r) {
            throw canNotDeleteException(id);
        }else{
            IdeaJdbc.delete(Author.class, id);
            return 1;
        }
    }

    @IdeaJdbcTx
    public void batchDeleteAuthors(String[] idArray) {
        for(String id : idArray) {
            deleteAuthor(id);
        }
    }

    @IdeaJdbcTx
    public int famousAuthor(String id) {
        Author author = IdeaJdbc.find(Author.class, id);
        
        if(author == null) {
            throw dataNotFoundException(id);
        }else{
            author.setFamous(YesOrNo.YES);
            IdeaJdbc.update(author);
        }
        
        return 0;
    }
    
    @IdeaJdbcTx
    public int unfamousAuthor(String id) {
        Author author = IdeaJdbc.find(Author.class, id);
        
        if(author == null) {
            throw dataNotFoundException(id);
        }else{
            author.setFamous(YesOrNo.NO);
            IdeaJdbc.update(author);
        }
        
        return 0;
    }
}
