<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chorizo</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div>
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
					Chorizo<span class="chorizo subHead">Like Sausage, But
						Music.</span>
				</h1>
				<!--  <h3 class="text-center">Like Sausage, But Music.</h3>-->
				<div id="larger">
					<p class="text-center">
						In order to use the <span class="chorizo">Chorizo</span> App, you
						must first login to Spotify and have the Spotify Application
						running on your device.
					</p>
					<p class="text-center">
						By accessing this site, you're agreeing to <span class="chorizo">Chorizo</span>
						accessing your spotify account.
					</p>
					<p class="text-center">
						To create a playlist based on Spotify's categories and how many
						songs you want, <a href="init">click here </a> .
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
