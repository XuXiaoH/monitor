/**
 * Author:  xxh
 * Date:    2019/2/1 15:08
 */
package com.danuooa.monitor.util.db;

import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.TypeHandler;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import tk.mybatis.spring.annotation.MapperScan;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = "com.danuooa.monitor.mapper",sqlSessionTemplateRef = "monitorSessionTemplate")
public class DBConfig {

    @Bean("monitorDataSource")
    @ConfigurationProperties("spring.datasource.monitor")
    public DataSource dataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean("monitorSqlSessionFactory")
    public SqlSessionFactory sqlSessionFactory(@Qualifier("monitorDataSource") DataSource dataSource, @Qualifier("modelInterceptor") ModelInterceptor modelInterceptor) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setPlugins(new Interceptor[]{modelInterceptor});
        bean.setTypeHandlers(new TypeHandler[]{new MyDateTypeHandle()});
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mapper//*.xml"));
        return bean.getObject();
    }

    @Bean("monitorTransactionManager")
    public DataSourceTransactionManager transactionManager(@Qualifier("monitorDataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean("monitorSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(@Qualifier("monitorSqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
