/**
 * Author:  xxh
 * Date:    2019/2/1 16:07
 */
package com.danuooa.monitor.controller;


import com.danuooa.monitor.model.Server;
import com.danuooa.monitor.service.ServerService;
import com.danuooa.monitor.util.BaseController;
import com.danuooa.monitor.util.Result;
import com.danuooa.monitor.util.annotation.PermissionName;
import com.mcp.validate.annotation.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ServerController extends BaseController {
    @Autowired
    private ServerService serverService;

    @RequestMapping("/")
    String index(ModelMap modelMap){
        System.out.println("index");
        modelMap.put("list",serverService.getAll());
        modelMap.put("add",serverService.getAllServer());
        return "index";
    }

    //保存
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    Result save(
            @Check String ip,
            @Check String note,
            @Check(defaultValue="1") Short status,
            Long id

    ){
        Server server=new Server();
        server.setIp(ip);
        if (serverService.exist(server)){
            return new Result("IP已存在！");
        }
        server.setNote(note);
        server.setStatus(status);
        server.setId(id);
        if (serverService.save(server)==1){
            return new Result();
        }
        return new Result("保存时发生错误！");
    }

//    删除
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    @ResponseBody
    Result delete(
            @Check Long id
    ){
        if (serverService.delete(id)>0){
            return new Result();
        }
        return new Result("删除失败！");
    }

    //修改
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @PermissionName(value = "更新",parent = "list")
    @ResponseBody
    Result update(
            @Check Long id,
            @Check String ip,
            @Check String note,
            @Check (defaultValue = "0") Short status
    ){
       Server server= new Server();
       server.setId(id);
       server.setIp(ip);
       server.setNote(note);
       server.setStatus(status);

       if (serverService.update(server)){
           return new Result();
       }
       return new Result("操作失败！");
    }

    @RequestMapping(value = "get",method = RequestMethod.POST)
    @ResponseBody
    Result get(
            @Check Long id
    ){
        return new Result(serverService.get(id));
    }


}
