package com.auc.mavendemo.mapper;

import com.auc.mavendemo.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface DeptMapper
{
	public User findById(User user);
	public User judgeAccount(User user);
	public void reg(User user);
	public int findCountInfo(@Param("name")String name);
	public List<Test> findInfo(Map map);

	public void addInfo(Test test);
	public void updateInfo(Test test);
	public void deleteInfo(int id);

	public List<Rolemenu> selectMenu(Map map);

	public List<Demo> findMenu(Map map);
	public List<Demo> findAllMenu(int parentid);
	public void deleteMenu(int rid);
	public void addMenu(Map map);
	public void upload(FileInfo fileInfo);
	public int findCountFile(@Param("name")String name);
	public List<FileInfo> findFile(Map map);
	public void addLog(SystemLog log);
	public List<Demo> findAllMenu(Map map);
}
