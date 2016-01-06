/**
 * 
 */
package com.ideamoment.emarm.author.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ideamoment.emarm.author.service.AuthorService;
import com.ideamoment.emarm.model.Author;
import com.ideamoment.emarm.util.DataTableSource;
import com.ideamoment.ideadp.restful.json.JsonData;
import com.ideamoment.ideajdbc.action.Page;

/**
 * @author Chinakite
 *
 */
@Controller
public class AuthorAction {
    @Autowired
    private AuthorService authorService;

    /**
     * @return the authorService
     */
    public AuthorService getAuthorService() {
        return authorService;
    }
    
    /**
     * @param authorService the authorService to set
     */
    public void setAuthorService(AuthorService authorService) {
        this.authorService = authorService;
    }
    
    // ------------------ 方法区 ----------------------
    
    @RequestMapping(value="/system/authorPage", method=RequestMethod.GET)
    public ModelAndView toAuthors() {
        return new ModelAndView("/WEB-INF/jsp/author/author.jsp");
    }
    
    @RequestMapping(value="/system/dtAuthors", method=RequestMethod.GET)
    public JsonData dtAuthors(int draw, int start, int length, String key) {
        int curPage = start/length + 1;
        int pageSize = length;
        Page<Author> authors = authorService.pageAuthors(key, curPage, pageSize);
        DataTableSource<Author> dts = convertToDataTableSource(draw, authors);
        return new JsonData(dts);
    }
    
    @RequestMapping(value="/system/authors", method=RequestMethod.GET)
    public JsonData pageAuthors(String key, int curPage, int pageSize) {
        Page<Author> authors = authorService.pageAuthors(key, curPage, pageSize);
        return JsonData.success(authors);
    }
    
    @RequestMapping(value="/system/author/{id}", method=RequestMethod.GET)
    public JsonData findAuthor(@PathVariable String id) {
        Author author = authorService.findAuthor(id);
        return JsonData.success(author);
    }
    
    @RequestMapping(value="/system/author", method=RequestMethod.POST)
    public JsonData createAuthor(String name, String desc, String pseudonym) {
        Author author = authorService.createAuthor(name, desc, pseudonym);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/author/{id}", method=RequestMethod.POST)
    public JsonData updateAuthor(@PathVariable String id, String name, String desc, String pseudonym) {
        int r = authorService.updateAuthor(id, name, desc, pseudonym);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/author/{id}", method=RequestMethod.DELETE)
    public JsonData deleteAuthor(@PathVariable String id) {
        int r = authorService.deleteAuthor(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/batchDeleteAuthor", method=RequestMethod.DELETE)
    public JsonData batchDeleteAuthor(String ids) {
        String[] idArray = ids.split(",");
        
        authorService.batchDeleteAuthors(idArray);
        
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/famousAuthor", method=RequestMethod.POST)
    public JsonData famousAuthor(String id) {
        int r = authorService.famousAuthor(id);
        return JsonData.SUCCESS;
    }
    
    @RequestMapping(value="/system/unfamousAuthor", method=RequestMethod.POST)
    public JsonData unfamousAuthor(String id) {
        int r = authorService.unfamousAuthor(id);
        return JsonData.SUCCESS;
    }
    
    private DataTableSource<Author> convertToDataTableSource(int draw, Page<Author> authorsPage) {
        DataTableSource<Author> dts = new DataTableSource<Author>();
        
        dts.setDraw(draw);
        dts.setRecordsTotal(authorsPage.getTotalRecord());
        dts.setRecordsFiltered(authorsPage.getTotalRecord());
        dts.setData(authorsPage.getData());
        
        return dts;
    }
}
