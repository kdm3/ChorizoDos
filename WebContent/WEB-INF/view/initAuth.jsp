

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo- Playlist Builder</title>
<style>
body {
	background-color: #3e94ec;
	font-family: "Roboto", helvetica, arial, sans-serif;
	font-size: 16px;
	font-weight: 400;
	text-rendering: optimizeLegibility;
	color: white;
}

form {
	width: 500px;
	margin: 0 auto;
}

h1, h2, p {
	margin: 25px auto;
	width: 50%;
	text-align: center;
}

#playList {
	width: 500px;
	margin: 0 auto;
}

iframe {
	width: 50%;
	margin-left: 25%;
	margin-top: 0;
	padding: 0;
	text-align: center;
}

table {
	width: 700px;
	margin: 25px auto;
	border-spacing: 0;
}

td {
	border: 1px solid black;
	padding: 5px;
}
</style>
</head>
<body>
	<h1>Chorizo</h1><h2>Dynammic Playlist Builder</h2><hr>
	<p>Build a playlist by choosing a category or artist and the amount
		of time you want that choice to be played.</p>
	<form id="inputForm">
		Category: <select name="songName">
			<option value="country">Country</option>
			<option value="workout">Workout</option>
			<option value="pop">Pop</option>
			<option value="mood">Mood</option>
			<option value="focus">Focus</option>
			<option value="sleep">Sleep</option>
			<option value="dinner">Dinner</option>
			<option value="kids">Kids</option>
			<option value="reggae">Reggae</option>
			<option value="rock">Rock</option>
			<option value="indie_alt">Indie</option>
			<option value="chill">Chill</option>
			<option value="hiphop">Hip-Hop</option>
			<option value="rnb">RnB</option>
			<option value="folk_americana">Folk_Americana</option>
			<option value="metal">Metal</option>
			<option value="soul">Soul</option>
			<option value="travel">Travel</option>
			<option value="jazz">Jazz</option>
			<option value="latin">Latin</option>
			<option value="punk">Punk</option>
			<option value="funk">Funk</option>
			<option value="classical">Classical</option>
		</select>
		<!--  <input type="text" name="songName"></input><br>-->
		Number: <input type="text" name="amount"></input>
		<button onclick='loadDoc(songName.value, amount.value)' type="button">Submit</button>
	</form>
	<div id="here"></div>
	<div id="playList"></div>
	<script>
		printFrame = false;
		trackList = "";

		function loadDoc(category, num) {
			//if no table exists, create it
			if (document.getElementsByTagName("table").length < 1) {
				var table = document.createElement("table");
				var insert = document.getElementById("here");
				insert.appendChild(table);
			}
			var xhttp = new XMLHttpRequest();

			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var jsonObj = JSON.parse(xhttp.responseText);
					for (var i = 0; i < num; i++) {
						var rand1 = parseInt(Math.random()
								* (jsonObj.playlists.items.length - 1) + 1);
						getTracks(jsonObj.playlists.items[rand1]);
					}
				} else {
					//console.log("bad playlist request");
				}
			};
			xhttp.open("GET", "https://api.spotify.com/v1/browse/categories/"
					+ category + "/playlists", true);
			xhttp.setRequestHeader("Authorization", "Bearer " + "${token}");
			xhttp.send();
			tr = document.createElement("tr");
			table.insertBefore(tr, table.firstChild);
			table.firstChild.innerHTML = "<th>Song Name</th><th>Artist</th>";
			//insert iframe here
			console.log(trackList);
		}
		function getTracks(playlist) {
			/*if (gotTracks)
				return;*/
			var playFrame = document.getElementById("playList");
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					if (trackList != "") {
						trackList += ",";
					}
					var playlist = JSON.parse(xhttp.responseText);
					var rand = parseInt(Math.random() * playlist.items.length
							- 1);
					//console.log(playlist.items[rand].track.name);
					var tr = document.createElement("tr");
					var table = document.getElementsByTagName("table")[0];
					table.appendChild(tr);
					table.lastChild.innerHTML = "<td>"
							+ playlist.items[rand].track.name + "</td><td>"
							+ playlist.items[rand].track.artists[0].name
							+ "</td>";
					var split = playlist.items[rand].track.uri.split(":");
					trackList += split[2];
					playFrame.innerHTML = "<br><iframe src=\"https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:"
							+ trackList
							+ "\" frameborder=\"0\" allowtransparency=\"true\"></iframe>";
				} else {
					//console.log("these tracks don't exist");
				}
			};

			xhttp.open("GET", playlist.tracks.href, true);
			//	"https://api.spotify.com/v1/users/spotify/playlists/"
			//		+ playlist + "/tracks", true);
			xhttp.setRequestHeader("Authorization", "Bearer " + "${token}");
			xhttp.send();

			//gotTracks = true;
		}
	</script>
</body>
</html>