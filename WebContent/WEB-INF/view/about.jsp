<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.chorizoinfo.hibernate.DAO"%>
<%@ page import="com.chorizoinfo.hibernate.Playlists"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Playlists</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<div class="row frame">
		<div class="col-lg-3 red"></div>
		<div class="col-lg-3 orange"></div>
		<div class="col-lg-3 yellow"></div>
		<div class="col-lg-3 teal"></div>
	</div>
	<div class="row">
		<div class="col-lg-2"></div>
		<div id="wrapper" class="col-lg-8">
			<h1 class="text-center">
				Chorizo<span class="chorizo subHead">Like Sausage, But Music.</span>
			</h1>
			<hr>
			<nav class="col-lg-12 navbar navbar-default">

			<ul class="navbar-nav nav">
				<li><a href="init">Create Playlist</a></li>
				<li><a href="userPlayList">View Playlists</a></li>
				<li><a href="about">Team Chorizo</a></li>
			</ul>
			</nav>
			<div class="row">
				<div class="col-lg-4 round">
					<center>
						<image height="200px"
							src="https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAczAAAAJDQxODVmOGQwLTlhMzUtNGJmMy1hZjRiLWY2MWYzZjFlODFiNw.jpg" />
						<p>Robert Baxter</p>
						<p>
							<a href="mailto:baxterrp@gmail.com">baxterrp@gmail.com</a>
						</p>
						<p>
							<a href="https://www.linkedin.com/in/baxterrp">LinkedIn</a>
						</p>
						<p>
							<a href="https://www.github.com/baxterrp">Github</a>
						</p>
					</center>
				</div>
				<div class="col-lg-4 round">
					<center>
						<image height="200px"
							src="https://media.licdn.com/media/AAEAAQAAAAAAAAgbAAAAJGU0ZTY1YTI1LWM3ZDAtNGNlYy1hZmEzLWNiZTdhMjIyZTg3Yg.jpg" />
						<p>Kaitlin MacNeill</p>
						<p>
							<a href="mailto:macneill.kaitlin@gmail.com">macneill.kaitlin@gmail.com</a>
						</p>
						<p>
							<a href="https://www.linkedin.com/in/kaitlin-macneill">LinkedIn</a>
						</p>
						<p>
							<a href="https://www.github.com/kdm3">Github</a>
						</p>
					</center>
				</div>
				<div class="col-lg-4 round">
					<center>
						<image height="200px"
							src="https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAczAAAAJDg2MzEwYTE0LTgwZTAtNDcxMy1iMGM1LTgxNjdjNDhjNjg4ZQ.jpg" />
						<p>Eric Price</p>
						<p>
							<a href="mailto:email.ericprice@gmail.com">email.ericprice@gmail.com</a>
						</p>
						<p>
							<a href="https://www.linkedin.com/in/ericpricecreates">LinkedIn</a>
						</p>
						<p>
							<a href="https://www.github.com/Erpr">Github</a>
						</p>
					</center>
				</div>
			</div>
		</div>
	</div>
</body>
</html>