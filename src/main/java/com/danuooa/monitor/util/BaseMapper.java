/**
 * Author:  xxh
 * Date:    2019/2/1 14:34
 */
package com.danuooa.monitor.util;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface BaseMapper<T> extends Mapper<T>,MySqlMapper<T> {
}
