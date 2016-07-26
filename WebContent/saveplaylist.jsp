<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo</title>
</head>
<body>
<h1>Chorizo</h1>

<p> Review your playlist and save:</p>

<jsp:useBean id="playlistinfo" class="com.chorizoinfo.hibernate.Playlists">  
</jsp:useBean>  
<jsp:setProperty property="*" name="userInfo"/>
 



<!-- get user id-->
xhttp.open("GET","https://api.spotify.com/v1/me", true);
xhttp.setRequestHeader("Authorization", "Bearer " + "${token}");
xhttp.send();

<!-- String playlistname ="playlist name " from a text box-->


<!-- get tracklist from initAuth -->




<%  
String userid = ;
out.print(userid);



 Playlist p = new Playlist (name, trackList, userid);

 int i=DAO.addPlaylist(Playlist p); 
 if (i > 0)  
out.print("Playlist successfully added");  
else
out.println("Error; Playlist not added");
%>  



</body>
</html>