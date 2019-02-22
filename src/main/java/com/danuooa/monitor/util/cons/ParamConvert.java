/**
 * Author:  xxh
 * Date:    2019/2/1 15:04
 */
package com.danuooa.monitor.util.cons;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.List;

public class ParamConvert implements TemplateMethodModelEx {

    @Override
    public Object exec(List list) throws TemplateModelException {
        if (null != list) {
            String key = list.get(0).toString();
            if (1 == list.size()) {
                switch (key) {

                }
            } else {
                switch (key) {
                    case "userStatus":
                        return ConvertCons.ServerStatusCover.get(Integer.parseInt(String.valueOf(list.get(1))));
                }
            }
        }
        return null;
    }
}
