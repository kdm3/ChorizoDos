package com.chorizoinfo.hibernate;

public class Playlists {
	private int id;
	private String playlistname;
	private String playlisthref;
	private int userid;
	
	public Playlists(){
		
	}
	 public Playlists (String playlistname, String playlisthref, int userid){
		 this.playlistname=playlistname;
		 this.playlisthref=playlisthref;
		 this.setUserid(userid);
	 }
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @return the playlistname
	 */
	public String getPlaylistname() {
		return playlistname;
	}
	/**
	 * @return the playlisthref
	 */
	public String getPlaylisthref() {
		return playlisthref;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @param playlistname the playlistname to set
	 */
	public void setPlaylistname(String playlistname) {
		this.playlistname = playlistname;
	}
	/**
	 * @param playlisthref the playlisthref to set
	 */
	public void setPlaylisthref(String playlisthref) {
		this.playlisthref = playlisthref;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}

}
