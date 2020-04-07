package com.auc.mavendemo.aoplog;

import com.auc.mavendemo.entity.SystemLog;
import com.auc.mavendemo.entity.User;
import com.auc.mavendemo.service.LoginService;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;


/**
 * @author zx
 * @desc 切点类 
 */

@Aspect
@Component
public class SystemLogAspect {

    //注入Service用于把日志保存数据库  
    @Resource
    private LoginService loginService;
    @Autowired
    private HttpSession session;

    //Controller层切点
    @Pointcut("within(com.auc.mavendemo.controller.*)&&@annotation(com.auc.mavendemo.aoplog.Log)")
    public void controllerAspect() {
    }  

    /** 
     * 后置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点 
     */  
    @After("controllerAspect()")  
    public void after(JoinPoint joinPoint) throws Throwable{
        User user = (User) session.getAttribute("user");
        if(user==null){
            return;
        }
         try {
            String targetName = joinPoint.getTarget().getClass().getName();  
            String methodName = joinPoint.getSignature().getName();  
            Object[] arguments = joinPoint.getArgs();  
            Class targetClass = Class.forName(targetName);  
            Method[] methods = targetClass.getMethods();
            String operationType = "";
            String operationName = "";
             for (Method method : methods) {  
                 if (method.getName().equals(methodName)) {  
                    Class[] clazzs = method.getParameterTypes();  
                     if (clazzs.length == arguments.length) {  
                         operationType = method.getAnnotation(Log.class).operationType();
                         operationName = method.getAnnotation(Log.class).operationName();
                         break;  
                    }  
                }  
            }
            //*========控制台输出=========*//  
            System.out.println("=====controller后置通知开始=====");  
            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);  
            System.out.println("方法描述:" + operationName);  
            System.out.println("请求人:" + user.getAccount());
            //*========数据库日志=========*//  
            SystemLog log = new SystemLog();
            log.setLoguser(user.getAccount());
            log.setLogtype(operationType);
            log.setLogdetail(operationName);
            log.setLogresult("正常");
            log.setLogdate(new Date());
            //保存数据库
            loginService.addLog(log);
            System.out.println("=====controller后置通知结束=====");  
        }  catch (Exception e) {  
            //记录本地异常日志  
            System.out.println("[error]:后置通知异常==>异常信息:"+e.getMessage());
        }  
    }
}