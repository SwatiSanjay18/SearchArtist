<%--This is the jsp page which displays the search result --%>
<%-- The page gets the attribute and casts it to its respective class --%>
<%@ page import="java.util.*" %>
<%@ page import="de.umass.lastfm.*" %>

<html>
	
	<body>
		Artist : <%= request.getAttribute("artist")%>
		<table>
			<tr>
				<th>Top Music Tracks</th>
				<th>Top Albums</th>
				<th>Similar Artist</th>
			</tr>
			<tr>
				<td>
					<% 
					Collection<Track>  tracks = (Collection<Track>) request.getAttribute("musicTracks");
					for (Track track : tracks) {
					%>									
					<table border="0"><tr><td><%=track.getName() %></td></tr></table>			
					<% 	}
					%>
				<td>
					<% 
					Collection<Album>  albums = (Collection<Album>) request.getAttribute("musicAlbums");
					for (Album album : albums) {
					%>
					<table border="0"><tr><td><%=album.getName() %></td></tr></table>
					<% 	}
					%>
				</td>
				<td>
					<% 
					Collection<Artist>  similarArtists = (Collection<Artist>) request.getAttribute("similarArtist");
					for (Artist similarArtist : similarArtists) {
					%>
					<table border="0"><tr><td><%=similarArtist.getName() %></td></tr></table>
					<% 	}
					%>
				</td>
			</tr>
		</table>
	</body>
</html>
