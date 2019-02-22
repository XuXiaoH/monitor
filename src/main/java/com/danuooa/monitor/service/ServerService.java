/**
 * Author:  xxh
 * Date:    2019/2/1 16:02
 */
package com.danuooa.monitor.service;

import com.danuooa.monitor.mapper.ServerMapper;
import com.danuooa.monitor.model.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ServerService {

    @Autowired
    private ServerMapper serverMapper;

    public List<Server> getAll(){
        return serverMapper.selectAll();
    }

    public List<Server> getAllServer(){
        return serverMapper.getAllServer();
    }

    public int save(Server server){
        return serverMapper.insertSelective(server);
    }

    public boolean exist(Server server){
        if (serverMapper.selectCount(server)>0){
            return true;
        }
            return false;
    }

    public int delete(Long id){
        return serverMapper.deleteByExample(id);
    }

}
