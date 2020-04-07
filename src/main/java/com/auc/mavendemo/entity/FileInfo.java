package com.auc.mavendemo.entity;

import java.util.Date;

public class FileInfo
{
	private int fid;
	private String name;
	private String score;
	private String account;
	private String type;
	private Date time;
	private String state;

	public FileInfo()
	{
	}

	public int getFid()
	{
		return fid;
	}

	public void setFid(int fid)
	{
		this.fid = fid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getScore()
	{
		return score;
	}

	public void setScore(String score)
	{
		this.score = score;
	}

	public String getAccount()
	{
		return account;
	}

	public void setAccount(String account)
	{
		this.account = account;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	public Date getTime()
	{
		return time;
	}

	public void setTime(Date time)
	{
		this.time = time;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	@Override
	public String toString()
	{
		return "FileInfo{" + "fid=" + fid + ", name='" + name + '\'' + ", score='" + score + '\'' + ", account='" + account + '\'' + ", type='" + type + '\'' + ", time=" + time + ", state='" + state + '\'' + '}';
	}
}
