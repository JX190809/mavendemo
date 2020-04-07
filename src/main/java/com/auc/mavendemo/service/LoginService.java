package com.auc.mavendemo.service;

import com.auc.mavendemo.entity.*;
import com.auc.mavendemo.mapper.DeptMapper;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LoginService
{

	@Resource
    private DeptMapper deptMapper;

    @Transactional
    public User login(User user){
        return deptMapper.findById(user);
    }

	@Transactional
	public String reg(String account,String password){
		User user=new User(account,password);

		User user1=deptMapper.judgeAccount(user);
		if(user1!=null){
			return "reg";
		}else{
			deptMapper.reg(user);
			return "login";
		}
	}

    @Transactional
    public List<Rolemenu> selectMenu(Map map){
        List<Rolemenu> list = deptMapper.selectMenu(map);

        for(int i=0;i<list.size();i++){
            map.put("parentid",list.get(i).getMid());
            List<Rolemenu> childList = deptMapper.selectMenu(map);
            list.get(i).setChildList(childList);
        }
        return list;
    }

    public void upload(FileInfo fileInfo){
	    deptMapper.upload(fileInfo);
    }

	@Transactional
	public int findCountInfo(String name){
		int count=deptMapper.findCountInfo(name);
		return count;
	}

	@Transactional
	public List findInfo(Map map){
		List<Test> list=deptMapper.findInfo(map);
		return list;
	}

	@Transactional
	public List findFile(Map map){
		List<FileInfo> list=deptMapper.findFile(map);
		return list;
	}

	@Transactional
	public int findCountFile(String name){
		int count=deptMapper.findCountFile(name);
		return count;
	}

	@Transactional
	public void addLog(SystemLog log){
		deptMapper.addLog(log);
	}

	@Transactional
	public List<Demo> findAllMenu(int parentid){
		List<Demo> alllist=deptMapper.findAllMenu(parentid);
		return alllist;
	}

	@Transactional
	public List<Demo> findMenu(Map map){
		List<Demo> list=deptMapper.findMenu(map);
		return list;
	}
}
