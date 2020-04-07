package com.auc.mavendemo.entity;

public class Test
{
	private int id;
	private String name;
	private String money;
	private String address;
	private String tel;
	private User user;

	public Test()
	{

	}

	public Test(int id, String name, String address, String tel)
	{
		this.id = id;
		this.name = name;
		this.address = address;
		this.tel = tel;
	}

	public Test(int id, String name, String money, String address, String tel)
	{
		this.id = id;
		this.name = name;
		this.money = money;
		this.address = address;
		this.tel = tel;
	}



	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getMoney()
	{
		return money;
	}

	public void setMoney(String money)
	{
		this.money = money;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public User getUser()
	{
		return user;
	}

	public void setUser(User user)
	{
		this.user = user;
	}

	@Override
	public String toString()
	{
		return "Test{" + "id=" + id + ", name='" + name + '\'' + ", money='" + money + '\'' + ", address='" + address + '\'' + ", tel='" + tel + '\'' + ", user=" + user + '}';
	}
}
