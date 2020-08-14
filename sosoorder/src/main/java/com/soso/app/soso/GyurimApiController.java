package com.soso.app.soso;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GyurimApiController {

	// 시군구가져오는.
	
	@RequestMapping("getSiGoongooApi")
	public void getSiGoongooApi(HttpServletResponse response, @RequestParam String name) throws IOException {
	
		StringBuffer result = new StringBuffer();
		try {
			StringBuilder urlstr = new StringBuilder(
					"http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=dong&catId=cty");
			urlstr.append("&" + URLEncoder.encode("ctprvnCd", "UTF-8") + "=" + name);
			urlstr.append("&" + URLEncoder.encode("ServiceKey", "UTF-8")
					+ "=VwbBoXQgv%2B5U%2FxwjpiRV7TkZgK461se9253O5m%2Fg7s%2F7eVxbqfJZg5ECYk4g4XvqmPoXeYemAPFzG7Ndk9uetw%3D%3D"); /*
																																 * Service
																																 * Key
																																 */
			URL url = new URL(urlstr.toString());
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
			String returnLine;
			result.append("<xmp>");
			while ((returnLine = br.readLine()) != null) {
				result.append(returnLine + "\n");
			}
			urlconnection.disconnect();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.append("</xmp>");
		response.setContentType("application/xml;charset=UTF-8");
		response.getWriter().print(result.toString());
	}
	
	

	// 업종,상호명, 주소 가져오는.
	
	@RequestMapping(value="getDataApi", produces = "application/text; charset=utf8")
	public void getDataApi(HttpServletResponse response, @RequestParam String name) throws IOException {
	
		StringBuffer result = new StringBuffer();
		try {
			StringBuilder urlstr = new StringBuilder(
					"http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=store&catId=dong&divId=signguCd");
			urlstr.append("&" + URLEncoder.encode("key", "UTF-8") + "=" + name);
			urlstr.append("&" + URLEncoder.encode("ServiceKey", "UTF-8")
					+ "=VwbBoXQgv%2B5U%2FxwjpiRV7TkZgK461se9253O5m%2Fg7s%2F7eVxbqfJZg5ECYk4g4XvqmPoXeYemAPFzG7Ndk9uetw%3D%3D"); 
			urlstr.append("&"+URLEncoder.encode("indsLclsCd", "UTF-8")+"=Q");													/*																 * Service
																																 * Key
																																 */
			URL url = new URL(urlstr.toString());
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
			String returnLine;
			result.append("<xmp>");
			while ((returnLine = br.readLine()) != null) {
				result.append(returnLine + "\n");
			}
			urlconnection.disconnect();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		result.append("</xmp>");
		response.setContentType("application/xml;charset=UTF-8");
		response.getWriter().print(result.toString());
	}
}
