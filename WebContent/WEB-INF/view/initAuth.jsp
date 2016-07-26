<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo- Playlist Builder</title>
<style>
body {
	background-color: #ccc;
}

#form {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

#submitForm {
	background-color: #ccc;
	padding: 15px;
	margin-top: 15px;
	margin-left: 25%;
	width: 50%;
	border: 1px solid white;
	border-radius: 25px;
	color: #3e94ec;
	text-align: center;
}

#submitForm button {
	margin-top: 25px;
}

#submitForm input {
	margin: 15px;
}

h1, h2, p {
	margin: 25px auto;
	width: 50%;
	text-align: center;
}

hr {
	width: 75%;
}

input {
	margin-right: 15px;
}

#playList {
	width: 500px;
	margin: 0 auto;
}

#wrapper {
	width: 75%;
	margin: 25px auto;
	background-color: #3e94ec;
	font-family: "Roboto", helvetica, arial, sans-serif;
	font-size: 16px;
	font-weight: 400;
	text-rendering: optimizeLegibility;
	color: white;
	border-radius: 25px;
	border: 1px solid white;
	padding: 50px 0 300px 0;
}

iframe {
	width: 50%;
	margin-top: 50px;
	margin-left: 25%;
	margin-bottom: 0;
	padding: 0;
	text-align: center;
	padding: 0;
	margin-left: 25%;
}

table {
	width: 75%;
	margin: 25px auto;
	border-spacing: 0;
}

th {
	border-bottom: 1px solid white;
}

td {
	text-align: center;
}

.smallText {
	display: block;
	font-size: .75em;
}
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

	<div id="wrapper">
		<h1>Chorizo</h1>
		<h2>Dynamic Playlist Builder</h2>
		<hr>
		<p>
			Welcome <span id="userName"></span>! Build a playlist by choosing a
			category and number of desired songs for each category. Add as many
			categories as you like! <span class="smallText">Limit to 50
				songs per selection.</span>
		</p>
		<!--<form id="inputForm">-->
		<div id="form">
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
			<!--  <input type="text" name="songName"></input><br>-->
			Number: <input type="text" id="songNum" name="amount"></input>
			<button onclick='loadDoc()' type="button">Add Songs</button>
			<!--  </form> -->
		</div>
		<div id="playList"></div>
		<form id="submitForm" method="post" action="savePlayList.jsp">
			<center>
				Playlist Name: <input type="text" name="playlistName" />
			</center>
			<input id="idGoesHere" name="idGoesHere" type="hidden" /> <input
				id="hiddenField" name="trackList" type="hidden"
				value="secret data goes here" />
			<!--  <input id="holdDuration"	name="holdDuration" type="hidden"/> -->
			<center>
				<button type="submit">Save Playlist</button>
			</center>
		</form>
		<div id="here"></div>
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
				insert.appendChild(table);
			}
			
			//create new request
			var xhttp = new XMLHttpRequest();

			//test request
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var jsonObj = JSON.parse(xhttp.responseText);
					
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
					table.appendChild(tr);
					
					//parse duration from milisecons to Minute:Second format
					var mins = ((playlist.items[rand].track.duration_ms) / 1000) / 60;
					var secs = parseInt(((mins % 1) * 60));
					
					//get last tr and insert new td with song information from JSON oject
					table.lastChild.innerHTML = "<td>"
							+ playlist.items[rand].track.artists[0].name
							+ "</td><td>"
							+ playlist.items[rand].track.name
							+ "</td><td><image src=\"" + playlist.items[rand].track.album.images[0].url + "\" height=\"100\" width=\"100\" /></td><td>" + parseInt(mins) + ":" + secs + "</td>";

					//splitting uri on : to get song ID and adding it to trackList
					var split = playlist.items[rand].track.uri.split(":");
					trackList += split[2];
					
					//insert iframe into playFrame div
					playFrame.innerHTML = "<br><iframe src=\"https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
							+ trackList
							+ "\" frameborder=\"0\" allowtransparency=\"true\"></iframe>";
							
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
</body>
</html>