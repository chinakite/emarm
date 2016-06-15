/**
 * 
 */
package com.ideamoment.emarm.schedular;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ideamoment.emarm.reserved.service.ReservedService;
import com.ideamoment.ideajdbc.spring.IdeaJdbcTx;

/**
 * @author Chinakite
 *
 */
@Component
public class ReservedProductToMake {
    @Autowired
    private ReservedService reservedService;
    
    /** 
     * cron表达式：* * * * * *（共6位，使用空格隔开，具体如下）  
     * cron表达式：*(秒0-59) *(分钟0-59) *(小时0-23) *(日期1-31) *(月份1-12或是JAN-DEC) *(星期1-7或是SUN-SAT)  
     * 注意： 30 * * * * * 表示每分钟的第30秒执行，而（*斜杠30）表示每30秒执行 
     *  
     * */  
    @Scheduled(cron="0 0 2 * * *")
    @IdeaJdbcTx
    public void reservedToMake(){  
        System.out.println("ReservedToMake Task - 开始");
        reservedService.withoutReservedToMake();
        reservedService.reservedToMake();
        System.out.println("ReservedToMake Task - 结束");
    }  
}
