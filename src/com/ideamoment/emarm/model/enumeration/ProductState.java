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
    
    public static final String CP_CONTRACT_INFLOW = "5";
    public static final String CP_CONTRACT_INFLOW_TEXT = "签约流程中";
    
    public static final String CP_CONTRACT_FINISH = "6";
    public static final String CP_CONTRACT_FINISH_TEXT = "签约完成";
    
    public static final String CP_CONTRACT_AUDIT = "5";
    public static final String CP_CONTRACT_AUDIT_TEXT = "版权合同审批中";
    
    public static final String CP_CONTRACT_AUDIT_PASS = "6";
    public static final String CP_CONTRACT_AUDIT_PASS_TEXT = "审批通过";
    
    public static final String CP_CONTRACT_AUDIT_REJECT = "102";
    public static final String CP_CONTRACT_AUDIT_REJECT_TEXT = "审批未通过";
    
    public static final String CP_LAWYER_AUDIT = "7";
    public static final String CP_LAWYER_AUDIT_TEXT = "法务审批中";
    
    public static final String CP_LAWYER_AUDIT_PASS = "8";
    public static final String CP_LAWYER_AUDIT_PASS_TEXT = "法务审批通过";
    
    public static final String CP_LAWYER_AUDIT_REJECT = "103";
    public static final String CP_LAWYER_AUDIT_REJECT_TEXT = "法务审批未通过";
    
    public static final String CP_LAWYER_SURE = "9";
    public static final String CP_LAWYER_SURE_TEXT = "法务终审中";
    
    public static final String CP_FINISH = "10";
    public static final String CP_FINISH_TEXT = "版权合同完成";
    
    public static final String MK = "11";
    public static final String MK_TEXT = "制作中";

    public static final String MK_FINISH = "12";
    public static final String MK_FINISH_TEXT = "制作完成";
    
    public static final String SALED = "13";
    public static final String SALED_TEXT = "已销售";
}
