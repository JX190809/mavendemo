package com.auc.mavendemo.entity;

import java.util.List;

public class Rolemenu
{
	private int rmid;
	private int rid;
	private int mid;
	private Menu menu;
	private List<Rolemenu> childList;

	public Rolemenu()
	{
	}

	public int getRmid()
	{
		return rmid;
	}

	public void setRmid(int rmid)
	{
		this.rmid = rmid;
	}

	public int getRid()
	{
		return rid;
	}

	public void setRid(int rid)
	{
		this.rid = rid;
	}

	public int getMid()
	{
		return mid;
	}

	public void setMid(int mid)
	{
		this.mid = mid;
	}

	public Menu getMenu()
	{
		return menu;
	}

	public void setMenu(Menu menu)
	{
		this.menu = menu;
	}

	public List<Rolemenu> getChildList()
	{
		return childList;
	}

	public void setChildList(List<Rolemenu> childList)
	{
		this.childList = childList;
	}

}
