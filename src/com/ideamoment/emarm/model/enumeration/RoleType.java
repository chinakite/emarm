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
    
    public static final String COPYRIGHT_OPR = "11";    //版权专员
    public static final String COPYRIGHT_OPR_TEXT = "版权专员";
    
    public static final String COPYRIGHT_DIRECTOR = "12";
    public static final String COPYRIGHT_DIRECTOR_TEXT = "版权主管";
    
    public static final String COPYRIGHT_MANAGER = "13";
    public static final String COPYRIGHT_MANAGER_TEXT = "版权经理";
    
    public static final String MAKE_OPR = "21";
    public static final String MAKE_OPR_TEXT = "制作专员";
    
    public static final String MAKE_MGR = "22";
    public static final String MAKE_MGR_TEXT = "制作经理";
    
    public static final String SALE_OPR = "31";
    public static final String SALE_OPR_TEXT = "运营专员";
    
    public static final String SALE_MGR = "32";
    public static final String SALE_MGR_TEXT = "运营经理";
    
    public static final String MEDIA_MGR = "40";
    public static final String MEDIA_MGR_TEXT = "媒资管理员";
    
    public static final String LAWYER = "80";
    public static final String LAWYER_TEXT = "法务人员";
    
    public static final String CEO = "90";
    public static final String CEO_TEXT = "总经理";
    
    public static final String EXT_EVALUATOR = "51";    //外部评价者
    public static final String EXT_EVALUATOR_TEXT = "外部评价者";
    
    public static final String EXT_MAKER = "52";    //外部制作团队
    public static final String EXT_MAKER_TEXT = "外部制作团队";
    
    public static final String EXT_EMCEE = "53";    //主持人
    public static final String EXT_EMCEE_TEXT = "主持人";
    
    public static final String SUPER_ADMIN = "99";  //超级管理员
    public static final String SUPER_ADMIN_TEXT = "超级管理员";
}
