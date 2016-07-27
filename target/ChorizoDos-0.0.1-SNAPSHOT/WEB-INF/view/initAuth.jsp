

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chorizo- Playlist Builder</title>
</head>
<body>
	<center>
		<h1>Chorizo</h1>
		<p>Build a playlist by choosing a category or artist and the
			amount of time you want that choice to be played.</p>
		<form>
			Band Name: <input type="text" name="songName"></input><br>
			Amount of Songs: <input type="text" name="amount"></input>
			<button onclick='loadDoc(songName.value, amount.value)' id="addSongs"
				type="button">Submit</button>
		</form>
		<div id="here"></div>
	</center>
	<script>
		var gotTracks = false;
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
					console.log("bad playlist request");
				}
			};
			xhttp.open("GET", "https://api.spotify.com/v1/browse/categories/"
					+ category + "/playlists", true);
			xhttp
					.setRequestHeader(
							"Authorization",
							"Bearer "
									+ "BQDH_3oOAOcn7kXqQ2gSa5q_RmdPuTkWKvqwXes-9pv-VSUQ4gQ_H1qAMj1Yw7IYz06Vlaqyeh0PVeOeJTkAjWkXiUOzpJ1bwbwvsEaSc3t68rca5AJpCEGwoHrcJpBI6QTSuhu_3e_IW9y_RuB8vZLC0el5mFtMXqtU7SVkZfP37BZa7kFw4eMeoi9b7MROL88_zV9ZgQiapr2BErFQ3Emn");
			xhttp.send();
		}
		function getTracks(playlist) {
			/*if (gotTracks)
				return;*/
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var playlist = JSON.parse(xhttp.responseText);
					var rand = parseInt(Math.random() * playlist.items.length
							- 1);
					//console.log(playlist.items[rand].track.name);
					var tr = document.createElement("tr");
					var table = document.getElementsByTagName("table")[0];
					table.appendChild(tr);
					tr.appendChild(document
							.createTextNode(playlist.items[rand].track.name));

				} else {
					console.log("these tracks don't exist");
				}
			};

			xhttp.open("GET", playlist.tracks.href, true);
			//	"https://api.spotify.com/v1/users/spotify/playlists/"
			//		+ playlist + "/tracks", true);
			xhttp
					.setRequestHeader(
							"Authorization",
							"Bearer "
									+ "BQDH_3oOAOcn7kXqQ2gSa5q_RmdPuTkWKvqwXes-9pv-VSUQ4gQ_H1qAMj1Yw7IYz06Vlaqyeh0PVeOeJTkAjWkXiUOzpJ1bwbwvsEaSc3t68rca5AJpCEGwoHrcJpBI6QTSuhu_3e_IW9y_RuB8vZLC0el5mFtMXqtU7SVkZfP37BZa7kFw4eMeoi9b7MROL88_zV9ZgQiapr2BErFQ3Emn");
			xhttp.send();

			//gotTracks = true;
		}
	</script>
</body>
</html>