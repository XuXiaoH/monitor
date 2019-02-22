/**
 * Author:  xxh
 * Date:    2019/2/1 15:06
 */
package com.danuooa.monitor.util.cons;

public class Status {

    private static final Short OK=1;

    public static boolean isSuccess(Short status){
        if(status.compareTo(OK) == 0){
            return true;
        }
        return false;
    }
}
