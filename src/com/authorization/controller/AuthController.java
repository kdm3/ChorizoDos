package com.authorization.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chorizoinfo.hibernate.DAO;
import com.chorizoinfo.hibernate.Playlists;
import com.wrapper.spotify.Api;
import com.wrapper.spotify.models.AuthorizationCodeCredentials;

@Controller
public class AuthController {


	public static final String clientId = "f51aba0d64d444d3b91fa0654e5f6e7f";
	public static final String clientSecret = "4c16cc15358b4227b57ace621dd61ada";
	public static final String redirectURI = "http://localhost:8080/ChorizoDos/callback";
	// "http://localhost:8080/ChorizoDos/callback";
	// "http://chorizo-env.us-west-2.elasticbeanstalk.com/callback";

	@RequestMapping(value = "/init")
	public ModelAndView initAuth() {
		final Api api = Api.builder().clientId(clientId).clientSecret(clientSecret).redirectURI(redirectURI).build();

		final List<String> scopes = Arrays.asList("user-read-private", "user-read-email", "playlist-read-private",
				"playlist-modify-private", "playlist-modify-public");

		// pass a user-identifiable string using state variable
		final String state = "someExpectedStateString";

		String authorizeURL = api.createAuthorizeURL(scopes, state);

		return new ModelAndView("redirect:" + authorizeURL);
	}

	@RequestMapping(value = "/callback")
	public ModelAndView myCallback(@RequestParam("code") String code, @RequestParam("state") String state,
			Model model) {

		final Api api = Api.builder().clientId(clientId).clientSecret(clientSecret).redirectURI(redirectURI).build();
		String token = null;
		String rtoken = null;
		try {
			final AuthorizationCodeCredentials authorizationCodeCredentials = api.authorizationCodeGrant(code).build()
					.get();

			System.out.println("State: " + state);
			System.out.println(
					"Successfully retrieved an access token! " + authorizationCodeCredentials.getAccessToken());
			System.out
					.println("The access token expires in " + authorizationCodeCredentials.getExpiresIn() + " seconds");
			System.out.println("Luckily, I can refresh it using this refresh token! "
					+ authorizationCodeCredentials.getRefreshToken());

			api.setAccessToken(authorizationCodeCredentials.getAccessToken());
			api.setRefreshToken(authorizationCodeCredentials.getRefreshToken());

			token = authorizationCodeCredentials.getAccessToken();
			rtoken = authorizationCodeCredentials.getRefreshToken();
			System.out.println("This is the Token:" + token);
			System.out.println("This is the Refresh Token:" + rtoken);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		model.addAttribute("token", token);
		model.addAttribute("rtoken", rtoken);
		
		// return "/spotify/initAuth";
		return new ModelAndView("/initAuth");
	}

	@RequestMapping(value ="/savePlayList")
	public ModelAndView savePlayList(@RequestParam("playlistName") String name, @RequestParam("trackList") String tracks, @RequestParam("idGoesHere") String userid, HttpServletRequest request, Model model){
		
		//creates instance of playlist created by user
		Playlists p = new Playlists(name, tracks, userid);
		String result= "";
		request.getSession().setAttribute("userid", userid);
		System.out.println("You are " + userid);
		
		//adds playlist that is created above into the database
		int i = DAO.addPlaylist(p);
		if (i > 0)
			result= "Playlist successfully added";
		else
			result="Error; Playlist not added";
		model.addAttribute("result", result);
		
		return new ModelAndView("/savePlayList");
	}
	
	@RequestMapping(value ="/userPlayList")
	public ModelAndView userPlayList(HttpServletRequest request){
		//request.getSession().setAttribute("userid", userid);
		request.getSession().getAttribute("userid");
		return new ModelAndView("/userPlayList");
	}
	
	
	
}