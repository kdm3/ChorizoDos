<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
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

<p> Your playlists include:</p>

<table>
<%  
List<Playlists> playlists = DAO.getUserPlaylist(3); 

for (Playlists p: playlists) {
	out.println ("<tr><td>" + p.getPlaylistname() + "</td><td>" +
		p.getPlaylisthref() + "</td><</tr>");
}
%>  
</table>
</body>
</html>