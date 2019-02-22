/**
 * Author:  xxh
 * Date:    2019/2/12 21:45
 */
package com.danuooa.monitor.util.core;

import com.danuooa.monitor.util.core.inter.ResourceInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebInterceptor extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new ResourceInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
