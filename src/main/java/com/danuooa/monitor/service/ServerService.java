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

    public Server get(Long id){
        return serverMapper.selectByPrimaryKey(id);
    }

    //添加
    public int save(Server server){
        return serverMapper.insertSelective(server);
    }

    //删除
    public int delete(Long id){
        return serverMapper.deleteByPrimaryKey(id);
    }

    //修改
    public boolean update(Server server) {
        if(serverMapper.updateByPrimaryKeySelective(server)==1){
            return true;
        }
        return false;
    }

    public boolean exist(Server server){
        if (serverMapper.selectCount(server)>0){
            return true;
        }
        return false;
    }

}
