package com.danuooa.monitor.mapper;

import com.danuooa.monitor.model.Server;
import com.danuooa.monitor.util.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ServerMapper extends BaseMapper<Server> {

    List<Server> getAllServer();










}
