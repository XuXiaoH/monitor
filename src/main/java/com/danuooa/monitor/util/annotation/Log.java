/**
 * Author:  xxh
 * Date:    2019/2/1 14:39
 */
package com.danuooa.monitor.util.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})
public @interface Log {
}
