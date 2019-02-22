/**
 * Author:  xxh
 * Date:    2019/2/1 15:22
 */
package com.danuooa.monitor.util.freemarker;

import com.danuooa.monitor.util.cons.ParamConvert;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

import java.util.Map;

@Configuration
public class Config {

    /**
     * 增加静态地址
     *
     * @return
     */
    @Bean
    public CommandLineRunner customFreemarker(FreeMarkerViewResolver resolver) {
        return strings -> {
            //添加自定义解析器
            Map map = resolver.getAttributesMap();
            map.put("convert", intiParamConvert());
        };
    }

    /**
     * 服务器状态转换器
     *
     * @return
     */
    @Bean
    public ParamConvert intiParamConvert() {
        return new ParamConvert();
    }
}
