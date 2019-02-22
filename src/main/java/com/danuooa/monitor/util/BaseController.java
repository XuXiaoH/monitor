/**
 * Author:  xxh
 * Date:    2019/2/1 14:36
 */
package com.danuooa.monitor.util;

import com.danuooa.monitor.util.annotation.Log;
import com.mcp.validate.BindResult;
import com.mcp.validate.exception.ValidateException;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.exception.ExceptionUtils;


public class BaseController {
    @Log
    protected Logger logger;

    @Autowired
    protected HttpSession httpSession;

    @Autowired
    protected HttpServletRequest httpServletRequest;

    @Autowired
    protected HttpServletResponse httpServletResponse;

    @ExceptionHandler({Exception.class})
    public Object handleException(HttpServletRequest req, Exception ex) {
        Throwable e = ExceptionUtils.getRootCause(ex);
        if (null != e) {
            ex = (Exception)e;
        }
        Result result;
        if (ex.getClass().isAssignableFrom(MissingServletRequestParameterException.class)) {
            MissingServletRequestParameterException msrpException = (MissingServletRequestParameterException)ex;
            this.logger.warn("请求:" + req.getRequestURI() + " 缺少参数：" + msrpException.getParameterName());
            result = new Result("请求参数错误");
        } else if (ex.getClass().isAssignableFrom(ValidateException.class)) {
            ValidateException validateException= (ValidateException) ex;
            BindResult bindResult = validateException.getBindResult();
            result = new Result(bindResult.getMessage());
        } else if (ex.getClass().isAssignableFrom(NumberFormatException.class)) {
            this.logger.warn("请求:" + req.getRequestURI() + " 参数类型错误" );
            result = new Result("传入的数据类型有误");
        } else {
            this.logger.error(ExceptionUtils.getStackTrace(ex));
            result = new Result("未知错误");
        }
        return new ResponseEntity(result, HttpStatus.OK);
    }
}
