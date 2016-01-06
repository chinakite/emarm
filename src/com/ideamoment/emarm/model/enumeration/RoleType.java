/**
 * 
 */
package com.ideamoment.emarm.model.enumeration;


/**
 * @author Chinakite
 *
 */
public class RoleType {
    public static final String NORMAL = "01";    //普通用户
    public static final String NORMAL_TEXT = "普通用户";
    
    public static final String EVALUATOR_OPR = "02";    //评价专员，现在没用
    
    public static final String EVALUATOR_MGR = "03";    //评价管理员
    public static final String EVALUATOR_MGR_TEXT = "评价管理员";
    
    public static final String EXT_EVALUATOR = "51";    //外部评价者
    
    public static final String SUPER_ADMIN = "99";  //超级管理员
    public static final String SUPER_ADMIN_TEXT = "超级管理员";
}
