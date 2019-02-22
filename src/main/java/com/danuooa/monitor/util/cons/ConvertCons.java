/**
 * Author:  xxh
 * Date:    2019/2/1 15:02
 */
package com.danuooa.monitor.util.cons;

import java.util.HashMap;
import java.util.Map;

public class ConvertCons {

    public static final class ServerStatusCover {
        public static final Map<Integer, String> map = new HashMap();

        static {
            init();
        }

        public static void init() {
            map.put(0,"异常");
            map.put(1,"正常");
        }

        public static String get(Integer key) {
            return map.get(key);
        }
    }
}
