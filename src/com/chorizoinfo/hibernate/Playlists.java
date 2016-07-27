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
	 * @return the playlisthref
	 */
	public String getTrackList() {
		return trackList;
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
	public void setTrackList(String trackList) {
		this.trackList = trackList;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	

}
