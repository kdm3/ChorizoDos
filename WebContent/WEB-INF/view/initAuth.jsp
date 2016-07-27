<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo- Playlist Builder</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style>
/*
#wrapper2{
	background-image: url("http://images2.fanpop.com/image/photos/9000000/Zoidberg-dr-zoidberg-9032706-1024-768.jpg");
	background-position: center;
	background-repeat: no-repeat;
	height: 700px;
}*/
</style>
</head>
<body>
	<c:set var="token" value="${token}" scope="session" />
	<script>

		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				console.log("worked");
				var jsonObj = JSON.parse(xhttp.responseText);
					document.getElementById("idGoesHere").value = jsonObj.id;
					document.getElementById("userName").innerHTML = jsonObj.id;
			} else {
				console.log("bad time");
			}
		};

		xhttp.open("GET", "https://api.spotify.com/v1/me", true);
		xhttp.setRequestHeader("Authorization", "Bearer " + " ${sessionScope.token}");
		xhttp.send();
	</script>
	<div class="row">
		<div class="col-lg-2"></div>
		<div id="wrapper" class="col-lg-8">
			<h1 class="text-center">Chorizo</h1>
			<h2 class="text-center">Dynamic Playlist Builder</h2>
			<hr>
			<div id="wrapper2">
				<nav class="col-lg-12 navbar navbar-default">

				<ul class="navbar-nav nav">

					<li><a href="init">Create Playlist</a></li>
					<li><a href="userPlayList">View Playlists</a></li>
					<li><a href="#">About Us</a></li>
				</ul>
				</nav>
				<div class="row">
					<div class="col-lg-4"></div>
					<div class="col-lg-4">
						<p class="text-center">
							Welcome <span id="userName"></span>! Build a playlist by choosing
							a category and number of desired songs for each category. Add as
							many categories as you like! <small><br>Limit to 15
								songs per selection.</small>
						</p>
					</div>
					<div class="col-lg-4"></div>
				</div>
				<!--<form id="inputForm">-->
				<div id="form" class="form-group text-center">
					Category: <select id="songName" name="songName">
						<option value="chill">Chill</option>
						<option value="classical">Classical</option>
						<option value="country">Country</option>
						<option value="dinner">Dinner</option>
						<option value="focus">Focus</option>
						<option value="folk_americana">Folk_Americana</option>
						<option value="funk">Funk</option>
						<option value="hiphop">Hip-Hop</option>
						<option value="indie_alt">Indie</option>
						<option value="jazz">Jazz</option>
						<option value="kids">Kids</option>
						<option value="latin">Latin</option>
						<option value="metal">Metal</option>
						<option value="mood">Mood</option>
						<option value="pop">Pop</option>
						<option value="punk">Punk</option>
						<option value="reggae">Reggae</option>
						<option value="rnb">RnB</option>
						<option value="rock">Rock</option>
						<option value="soul">Soul</option>
						<option value="travel">Travel</option>
						<option value="workout">Workout</option>
					</select>
				</div>
				<div class="form-group text-center">
					<!--  <input type="text" name="songName"></input><br>-->
					Number: <input type="text" id="songNum" name="amount"></input>
				</div>
				<div class="form-group text-center">
					<button id="addSongs" class="btn btn-info" onclick='loadDoc()'
						type="button">Add Songs</button>
				</div>
				<!--  </form> -->
				<div id="playList"></div>
				<form id="submitForm" method="post" action="savePlayList.html"
					target="resultframe">
					<input id="idGoesHere" name="idGoesHere" type="hidden" /> <input
						id="hiddenField" name="trackList" type="hidden"
						value="secret data goes here" />
					<div id="dynamicPlay"></div>
				</form>
				<div class="col-lg-2"></div>
				<div id="here" class="col-lg-8"></div>
				<div class="col-lg-2"></div>
				<script>
		printFrame = false;
		trackList = "";

		function loadDoc() {
			//get text boxes
			var category = document.getElementById("songName").value;
			var num = document.getElementById("songNum").value;
			
			//if no table exists, create it
			if (document.getElementsByTagName("table").length < 1) {
				var table = document.createElement("table");
				var insert = document.getElementById("here");
				var tbody = document.createElement("tbody");
				insert.appendChild(table);
				document.getElementsByTagName("table")[0].className = "table table-striped table-bordered";
				document.getElementsByTagName("table")[0].appendChild(tbody);
			}
			
			//create new request
			var xhttp = new XMLHttpRequest();

			//test request
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var jsonObj = JSON.parse(xhttp.responseText);
					document.getElementById("addSongs").innerHTML = "Add More Songs";
					document.getElementById("dynamicPlay").innerHTML = "<iframe scrolling=\"no\" frameBorder=\"0\" name=\"resultframe\" width=\"100%\" height=\"40\"></iframe><div class=\"form-group text-center\">Playlist Name: <input type=\"text\" name=\"playlistName\" /> <button class=\"btn btn-info\" type=\"submit\">Save Playlist</button></div>";					
					
					//this loop controls how many songs will be grabbed.
					//need to get duration of songs and compare them to num
					//would not increment in for() format
					for (var i = 0; i < num; i++) {
						//random number used to grab random playlist by index value
						var rand1 = parseInt(Math.random()
								* (jsonObj.playlists.items.length - 1) + 1);
						
						//getTracks method passes a playlist
						getTracks(jsonObj.playlists.items[rand1]);
						
						//i += durationOfCurrentSong;
					}
				} else {
					console.log("bad playlist request");
				}
			};
			
			//open api - create header with token - send
			xhttp.open("GET", "https://api.spotify.com/v1/browse/categories/"
					+ category + "/playlists", true);
			xhttp.setRequestHeader("Authorization", "Bearer " + "${token}");
			xhttp.send();
			
			//create new table row and insert before other rows to create header - innerHTML writes html code inside <tr>
			tr = document.createElement("tr");
			table.insertBefore(tr, table.firstChild);
			table.firstChild.innerHTML = "<th>Artist</th><th>Song Title</th><th>Album Cover</th><th>Duration</th>";
			//console.log(trackList);
		}
		
		
		function getTracks(playlist) {
			
			//create fields
			var secret = document.getElementById("hiddenField");
			var playFrame = document.getElementById("playList");
			
			//new request
			var xhttp = new XMLHttpRequest();
			
			//test request
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					
					//if trackList string is not emtpy add a comma to separate song id's
					if (trackList != "") {
						trackList += ",";
					}
					
					//parse response into JSON object - create random number based on number of indexes in playlist
					//create elements for inserting rows
					var playlist = JSON.parse(xhttp.responseText);
					var rand = parseInt(Math.random() * playlist.items.length
							- 1);
					var tr = document.createElement("tr");
					var table = document.getElementsByTagName("table")[0];
					var tbody = document.getElementsByTagName("tbody")[0];
					tbody.appendChild(tr);
					
					//parse duration from milisecons to Minute:Second format
					var mins = ((playlist.items[rand].track.duration_ms) / 1000) / 60;
					var secs = parseInt(((mins % 1) * 60));
					
					//get last tr and insert new td with song information from JSON oject
					tbody.lastChild.innerHTML = "<td>"
							+ playlist.items[rand].track.artists[0].name
							+ "</td><td>"
							+ playlist.items[rand].track.name
							+ "</td><td><image src=\"" + playlist.items[rand].track.album.images[0].url + "\" height=\"100\" width=\"100\" /></td><td>" + parseInt(mins) + ":" + secs + "</td>";

					//splitting uri on : to get song ID and adding it to trackList
					var split = playlist.items[rand].track.uri.split(":");
					trackList += split[2];
					
					//insert iframe into playFrame div
					playFrame.innerHTML = "<center><iframe src=\"https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
							+ trackList
							+ "\" frameborder=\"0\" allowtransparency=\"true\"></iframe></center>";
							
					//insert trackList into hidden field to use for POSTing
					hiddenField.value = trackList;
				} else {
					console.log("these tracks don't exist");
				}
			};

			xhttp.open("GET", playlist.tracks.href, true);
			xhttp.setRequestHeader("Authorization", "Bearer " + "${token}");
			xhttp.send();
		}
	</script>
			</div>
		</div>
	</div>
	<div class="col-lg-2"></div>
</body>
</html>