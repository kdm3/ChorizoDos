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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<div class="row">
		<div class="col-lg-2"></div>
		<div id="wrapper" class="col-lg-8">
			<h1 class="text-center">Chorizo</h1>
			<h2 class="text-center">Dynamic Playlist Builder</h2>
			<hr>
			<nav class="col-lg-12 navbar navbar-default">

			<ul class="navbar-nav nav">
				<li><a href="init">Create Playlist</a></li>
				<li><a href="userplaylists.jsp">View Playlists</a></li>
				<li><a href="#">About Us</a></li>
			</ul>
			</nav>
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-4">
					<p class="text-center">Chose a playlist from the dropdown.</p>
				</div>
				<div class="col-lg-4"></div>
			</div>
			<%
				String username = (String) request.getSession().getAttribute("userid");
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
					var select = document.getElementById("trackList").options[document
							.getElementById("trackList").selectedIndex]
							.getAttribute('name');
					var playFrame = document.getElementById("iFrame");
					playFrame.innerHTML = "<br><iframe src=\"https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
							+ select
							+ "\" frameborder=\"0\" allowtransparency=\"true\"></iframe>";
				}
			</script>
		</div>
	</div>
</body>
</html>