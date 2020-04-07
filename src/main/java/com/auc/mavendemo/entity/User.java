package com.auc.mavendemo.entity;

import java.util.List;

public class User
{
	private int uid;
	private String account;
	private String password;
	private int rid;
	private List<Test> list;

	public User()
	{
	}

	public User(String account, String password)
	{
		this.account = account;
		this.password = password;
	}

	public User(int uid, String account, String password)
	{
		this.uid = uid;
		this.account = account;
		this.password = password;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public int getRid()
	{
		return rid;
	}

	public void setRid(int rid)
	{
		this.rid = rid;
	}

	public List<Test> getList()
	{
		return list;
	}

	public void setList(List<Test> list)
	{
		this.list = list;
	}

	@Override
	public String toString()
	{
		return "User{" + "uid=" + uid + ", account='" + account + '\'' + ", password='" + password + '\'' + ", rid=" + rid + ", list=" + list + '}';
	}
}
