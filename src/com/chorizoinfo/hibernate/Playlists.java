package com.chorizoinfo.hibernate;

public class Playlists {
	private int id;
	private String playlistname;
	private String trackList;
	private String userid;
	
	public Playlists(){
		
	}
	 public Playlists (String playlistname, String trackList, String userid){
		 this.playlistname=playlistname;
		 this.trackList=trackList;
		 this.userid=userid;
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
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTrackList() {
		return trackList;
	}
	public void setTrackList(String trackList) {
		this.trackList = trackList;
	}

}
