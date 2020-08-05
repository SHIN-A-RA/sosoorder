package com.soso.app.soso.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class ApiExplorer {
	public static void main(String[] args) {
		BufferedReader br = null;
		try {
			String urlstr = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius?radius=500&cx=128.5896283&cy=35.8704736&ServiceKey=VwbBoXQgv%2B5U%2FxwjpiRV7TkZgK461se9253O5m%2Fg7s%2F7eVxbqfJZg5ECYk4g4XvqmPoXeYemAPFzG7Ndk9uetw%3D%3D";
			URL url = new URL(urlstr);
		    HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		    urlconnection.setRequestMethod("GET");		
		    br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
		    String result = "";
		    String line;
		    while((line = br.readLine()) != null ) {
		    	result = result + line + "\n";
		    }
		    System.out.println(result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

}

