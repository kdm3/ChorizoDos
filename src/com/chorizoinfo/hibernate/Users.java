package com.chorizoinfo.hibernate;


public class Users {
	private int id;
	private String userid;
	
	
	public Users() {
	}
	
	public Users(String userid){
		this.userid=userid;
	}
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @return the userid
	 */
	public String getUserid() {
		return userid;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	
}
