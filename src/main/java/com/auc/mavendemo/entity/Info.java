package com.auc.mavendemo.entity;

import java.util.List;

public class Info
{
	private int code;
	private String msg;
	private int count;
	private List<Test> data;

	public Info()
	{
	}

	public Info(int code, String msg, int count, List<Test> data)
	{
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	public int getCode()
	{
		return code;
	}

	public void setCode(int code)
	{
		this.code = code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public List<Test> getData()
	{
		return data;
	}

	public void setData(List<Test> data)
	{
		this.data = data;
	}
}
