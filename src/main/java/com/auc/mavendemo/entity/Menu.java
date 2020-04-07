package com.auc.mavendemo.entity;

public class Menu
{
	private int mid;
	private String mname;
	private int parentid;
	private String url;

	public Menu()
	{
	}

	public int getMid()
	{
		return mid;
	}

	public void setMid(int mid)
	{
		this.mid = mid;
	}

	public String getMname()
	{
		return mname;
	}

	public void setMname(String mname)
	{
		this.mname = mname;
	}

	public int getParentid()
	{
		return parentid;
	}

	public void setParentid(int parentid)
	{
		this.parentid = parentid;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}


}
