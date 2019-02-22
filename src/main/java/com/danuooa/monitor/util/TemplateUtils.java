/**
 * Author:  xxh
 * Date:    2019/2/13 10:16
 */
package com.danuooa.monitor.util;

import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

@Component
public class TemplateUtils {
    @Autowired
    private FreeMarkerConfigurer freeMarkerConfigurer;

    public String parse(String path, Map map){
        String res=null;
        try {
            Template template=freeMarkerConfigurer.getConfiguration()
                    .getTemplate("base/"+path+".ftl");
            Writer out=new StringWriter();
            template.process(map,out);
            out.flush();
        }catch(Exception e){
            e.printStackTrace();
        }
        return res;
    }
}
