<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo- Playlist Builder</title>
</head>
<body>
<center>
		<h1>Chorizo</h1>
		<p>Build a playlist by choosing a category or artist and the amount of time you want that choice to be played.
		</p>
		<h3>
			<button onclick='loadDoc()' value='category'>Button</button>
		</h3>
	</center>
	<script>
	
	//console.log("mytoke:" + "${token}");
	
function getCookie(){
		
	var params=window.location.search;
	
	console.log(params);
	
	}
	
	function loadDoc() {
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (xhttp.readyState == 4 && xhttp.status == 200) {
		    	//console.log(xhttp.responseText);
		    	var jsonObj = JSON.parse(xhttp.responseText);
		    	console.log(jsonObj);
		    	    	    
		    	
		    }
		  };
		
		  xhttp.open("GET", "https://api.spotify.com/v1/browse/categories?offset=0&limit=50", true);
		 xhttp.setRequestHeader("Authorization", "Bearer " + "${token}");
		  xhttp.send();
	}
		  </script>
</body>
</html>