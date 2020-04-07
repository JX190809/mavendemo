package com.auc.mavendemo.entity;

import java.util.List;

public class Demo
{
	private String  title;
	private int id;
	private List<Demo> children;
//	private boolean checked;

	public Demo()
	{
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public List<Demo> getChildren()
	{
		return children;
	}

	public void setChildren(List<Demo> children)
	{
		this.children = children;
	}

//		public boolean isChecked()
//	{
//		return checked;
//	}
//
//	public void setChecked(boolean checked)
//	{
//		this.checked = checked;
//	}

}
