//This class searches the tracks,albums and artist similar to the given artist
//The results are set as attributes and send for view.
package com.search;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import de.umass.lastfm.*;

public class SearchServlet extends HttpServlet{
    
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
		String strArtist = req.getParameter("artistName");
		String key = "c2b09000132cbd804f86ea1e36ba6b00"; 
				
		req.setAttribute("artist",strArtist);

		Collection<Track> tracksCollect = Artist.getTopTracks(strArtist,key);
		if(tracksCollect != null){
			req.setAttribute("musicTracks",tracksCollect);
		}	

		Collection<Album> albumsCollect = Artist.getTopAlbums(strArtist,key);
		if(albumsCollect != null){
			req.setAttribute("musicAlbums",albumsCollect);
		}

		Collection<Artist> similarArtists = Artist.getSimilar(strArtist,key);
		if(similarArtists != null){
			req.setAttribute("similarArtist",similarArtists);
		}
		
		RequestDispatcher view = req.getRequestDispatcher("artistResult.jsp");
		view.forward(req,res);
	}
}