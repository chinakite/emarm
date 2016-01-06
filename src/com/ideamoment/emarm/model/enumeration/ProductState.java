/**
 * 
 */
package com.ideamoment.emarm.model.enumeration;


/**
 * @author Chinakite
 *
 */
public class ProductState {
    
    public static final String DRAFT = "0";  //
    public static final String DRAFT_TEXT = "草稿";
    
    public static final String APPROVE_WAITING = "1";
    public static final String APPROVE_WAITING_TEXT = "待审核";
    
    public static final String APPROVE_REJECT = "101";
    public static final String APPROVE_REJECT_TEXT = "审核不过";
    
    public static final String EVALUATE_WAITING = "2";
    public static final String EVALUATE_WAITING_TEXT = "待评价";
    
    public static final String EVALUATED = "3";
    public static final String EVALUATED_TEXT = "已评价";
    
    public static final String EVALUATE_FINISH = "4";
    public static final String EVALUATE_FINISH_TEXT = "评价完成";
    
}
