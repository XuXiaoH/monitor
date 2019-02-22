/**
 * Author:  xxh
 * Date:    2019/2/1 14:42
 */
package com.danuooa.monitor.util.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE,ElementType.METHOD})
public @interface PermissionName {
    String value() default "";

    String parent() default "";

    boolean show() default true;
}
