<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.chorizoinfo.hibernate.DAO"%>
<%@ page import="com.chorizoinfo.hibernate.Playlists"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Playlists</title>
</head>
<body>
	<h1>Chorizo</h1>

	<%
		String username = (String) request.getSession().getAttribute("userid");
		out.println("<h2>Hello " + username + "</h2>");
	%>
	<p>Your playlists include:</p>
	<%
		//need session variable userid and pass it into dao
		String userid = username;

		List<Playlists> playlists = DAO.getUserPlaylist(userid);
		out.println("<select id=\"trackList\">");
		for (Playlists p : playlists) {
			out.println("<option name=\"" + p.getTrackList() + "\">" + p.getPlaylistname() + "</option>");//"<td>" + p.getTrackList() + "</td><</tr>");
		}
		out.println("</select");
	%>
	<input type="hidden" id="list" value="" />
	<button type="button" onclick='displayIframe()'>Play</button>
	<div id="iFrame"></div>
	<script>
		function displayIframe() {
			var select = document.getElementById("trackList").options[document.getElementById("trackList").selectedIndex].getAttribute('name');
			var playFrame = document.getElementById("iFrame");
			playFrame.innerHTML = "<br><iframe src=\"https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
					+ select
					+ "\" frameborder=\"0\" allowtransparency=\"true\"></iframe>";
		}
	</script>
</body>
</html>