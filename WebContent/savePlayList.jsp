<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.chorizoinfo.hibernate.DAO"%>
<%@ page import="com.chorizoinfo.hibernate.Playlists"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo</title>
</head>
<body>
	<input type="hidden" id="idGoesHere" />
	<h1>Chorizo</h1>

	<p>Review your playlist and save:</p>

	<jsp:useBean id="playlistinfo"
		class="com.chorizoinfo.hibernate.Playlists">
	</jsp:useBean>
	<jsp:setProperty property="*" name="playlistinfo" />




	<!-- get user id-->
	<%
		String name = request.getParameter("playlistName");
		String tracks = request.getParameter("trackList");

		String userid = request.getParameter("idGoesHere");

		out.print(userid);

		Playlists p = new Playlists(name, tracks, userid);

		int i = DAO.addPlaylist(p);
		if (i > 0)
			out.print("Playlist successfully added");
		else
			out.println("Error; Playlist not added");
	%>



</body>
</html>