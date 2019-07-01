package edu.nuc.untils;/**
 * Created by 57180 on 2019/5/18.
 */

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @program: ReadingProject
 * @description:
 * @author: 李柏君
 * @create: 2019-05-18 20:52
 **/
public class DateUntils {

    public static Date startOfWeek(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        cal.set(Calendar. DAY_OF_WEEK, Calendar.MONDAY);
        //System.out.println(simpleDateFormat.format(cal.getTime())+" 00:00:00");
        String time = simpleDateFormat.format(cal.getTime())+" 00:00:00";
        SimpleDateFormat simpleToDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime=new Date();
        try{
            startTime = simpleToDate.parse(time);
        }catch (Exception e){
            System.out.println("时间转换异常");
        }
       // System.out.println(startTime);
        return startTime;

    }
}
