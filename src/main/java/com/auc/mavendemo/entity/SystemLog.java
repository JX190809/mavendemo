package com.auc.mavendemo.entity;

import java.util.Date;

/**
 * 日志实体
 * 
 * @author zx
 * 
 */
public class SystemLog {
	private int lid;

	private String loguser;

	private String logtype;

	private String logdetail;

	private Date logdate;

	private String logresult;

	public SystemLog()
	{
	}

	public int getLid()
	{
		return lid;
	}

	public void setLid(int lid)
	{
		this.lid = lid;
	}

	public String getLoguser()
	{
		return loguser;
	}

	public void setLoguser(String loguser)
	{
		this.loguser = loguser;
	}

	public String getLogtype()
	{
		return logtype;
	}

	public void setLogtype(String logtype)
	{
		this.logtype = logtype;
	}

	public String getLogdetail()
	{
		return logdetail;
	}

	public void setLogdetail(String logdetail)
	{
		this.logdetail = logdetail;
	}

	public Date getLogdate()
	{
		return logdate;
	}

	public void setLogdate(Date logdate)
	{
		this.logdate = logdate;
	}

	public String getLogresult()
	{
		return logresult;
	}

	public void setLogresult(String logresult)
	{
		this.logresult = logresult;
	}

}
