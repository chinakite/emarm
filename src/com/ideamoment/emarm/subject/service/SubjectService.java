/**
 * 
 */
package com.ideamoment.emarm.subject.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ideamoment.emarm.model.Subject;
import com.ideamoment.emarm.model.User;
import com.ideamoment.emarm.model.enumeration.ProductType;
import com.ideamoment.emarm.subject.dao.SubjectDao;
import com.ideamoment.ideadp.exception.IdeaDataException;
import com.ideamoment.ideadp.exception.IdeaDataExceptionCode;
import com.ideamoment.ideadp.usercontext.UserContext;
import com.ideamoment.ideajdbc.IdeaJdbc;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Service
public class SubjectService {
    @Autowired
    private SubjectDao subjectDao;
    
    /**
     * @return the subjectDao
     */
    public SubjectDao getSubjectDao() {
        return subjectDao;
    }
    
    /**
     * @param subjectDao the subjectDao to set
     */
    public void setSubjectDao(SubjectDao subjectDao) {
        this.subjectDao = subjectDao;
    }

    //----------------- 方法区 --------------------


    @IdeaJdbcTx
    public List<Subject> listTextSubjects(String key) {
        String type = ProductType.TEXT;
        return subjectDao.listSubjects(type, key);
    }

    @IdeaJdbcTx
    public Subject createTextSubject(String name, String desc, String ratio) {
        UserContext uc = UserContext.getCurrentContext();
        User user = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        
        List<Subject> existsSubjects = subjectDao.querySubject(ProductType.TEXT, name, false);
        
        if(existsSubjects.size() > 0) {
            throw duplicateException(name);
        }else{
            int maxOrder = subjectDao.queryMaxOrder(ProductType.TEXT);
            Subject subject = new Subject();
            subject.setName(name);
            subject.setDesc(desc);
            subject.setRatio(ratio);
            subject.setOrder(maxOrder + 1);
            subject.setCreateTime(new Date());
            subject.setCreator(user.getId());

            IdeaJdbc.save(subject);
            
            return subject;
        }
    }

    @IdeaJdbcTx
    public Subject findSubject(String id) {
        return IdeaJdbc.find(Subject.class, id);
    }

    @IdeaJdbcTx
    public int updateSubject(String id, String name, String desc, String ratio) {
        UserContext uc = UserContext.getCurrentContext();
        User user = (User)uc.getContextAttribute(UserContext.SESSION_USER);
        Subject subject = IdeaJdbc.find(Subject.class, id);
        
        if(subject == null) {
            throw dataNotFoundException(id);
        }else{
            List<Subject> existsSubjects = subjectDao.querySubjectExceptSelf(ProductType.TEXT, name, id);
            
            if(existsSubjects.size() > 0) {
                throw duplicateException(name);
            }else{
                subject.setName(name);
                subject.setDesc(desc);
                subject.setRatio(ratio);
                subject.setModifier(user.getId());
                subject.setModifyTime(new Date());
                return IdeaJdbc.update(subject);
            }
        }
    }

    private RuntimeException duplicateException(String name) {
        return new IdeaDataException(IdeaDataExceptionCode.DUPLICATED_DATA, String.format("Subject[%s] is exists.", name));
    }
    
    private RuntimeException dataNotFoundException(String id) {
        return new IdeaDataException(IdeaDataExceptionCode.DATA_NOU_FOUND, String.format("Subject[%s] is not found.", id));
    }

    @IdeaJdbcTx
    public int deleteSubject(String id) {
        boolean exists = subjectDao.checkExistsProductsOfSubject(id);
        if(exists) {
            throw new IdeaDataException(IdeaDataExceptionCode.CANT_DELETE_DUE_ASSO_DATA, String.format("Can not delete subject[%s] due having products.", id));
        }else{
            IdeaJdbc.delete(Subject.class, id);
            return 1;
        }
    }

    @IdeaJdbcTx
    public void batchDeleteSubjects(String[] idArray) {
        subjectDao.batchDeleteSubjects(idArray);
    }

    @IdeaJdbcTx
    public int upSubject(String id) {
        Subject subject = IdeaJdbc.find(Subject.class, id);
        
        if(subject == null) {
            throw dataNotFoundException(id);
        }else{
            int order = subject.getOrder();
            Subject prevSubject = subjectDao.querySubjectByOrder(ProductType.TEXT, order-1);
            
            prevSubject.setOrder(order);
            subject.setOrder(order-1);
            
            IdeaJdbc.update(prevSubject);
            IdeaJdbc.update(subject);
            
            return 2;
        }
    }
    
    @IdeaJdbcTx
    public int downSubject(String id) {
        Subject subject = IdeaJdbc.find(Subject.class, id);
        
        if(subject == null) {
            throw dataNotFoundException(id);
        }else{
            int order = subject.getOrder();
            Subject nextSubject = subjectDao.querySubjectByOrder(ProductType.TEXT, order+1);
            
            nextSubject.setOrder(order);
            subject.setOrder(order+1);
            
            IdeaJdbc.update(nextSubject);
            IdeaJdbc.update(subject);
            
            return 2;
        }
    }
}
