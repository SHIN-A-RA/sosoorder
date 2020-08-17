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

    @RequestMapping(value = "getSiGoongooApi", produces = "text/xml;charset=UTF-8")
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
            BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
            String returnLine;

            while ((returnLine = br.readLine()) != null) {
                result.append(returnLine + "\n");
            }
            urlconnection.disconnect();
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/xml;charset=UTF-8");
        response.getWriter().print(result.toString());
    }

    // 업종,상호명, 주소 가져오는.

    @RequestMapping(value = "getDataApi", produces = "text/xml;charset=UTF-8")
    public void getDataApi(HttpServletResponse response, @RequestParam String name) throws IOException {

        StringBuffer result = new StringBuffer();
        try {
            StringBuilder urlstr = new StringBuilder(
                    "http://apis.data.go.kr/B553077/api/open/sdsc/baroApi?resId=store&catId=dong&divId=signguCd");
            // 시도코드(대구:27) 시도코드를 name이란변수로받아옴
            urlstr.append("&" + URLEncoder.encode("key", "UTF-8") + "=" + name);
            // API서비스코드
            urlstr.append("&" + URLEncoder.encode("ServiceKey", "UTF-8")
                    + "=VwbBoXQgv%2B5U%2FxwjpiRV7TkZgK461se9253O5m%2Fg7s%2F7eVxbqfJZg5ECYk4g4XvqmPoXeYemAPFzG7Ndk9uetw%3D%3D");
            urlstr.append("&" + URLEncoder.encode("indsLclsCd", "UTF-8") + "=Q"); /*
                                                                                   * * Service Key
                                                                                   */
            URL url = new URL(urlstr.toString());
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            // 크롬에서한글로인코딩해주는부분(UTF8)
            BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
            String returnLine;

            while ((returnLine = br.readLine()) != null) {
                result.append(returnLine + "\n");
            }
            urlconnection.disconnect();
            //result로 받음
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //utf요청 > utf로 받음
        response.setContentType("text/xml;charset=UTF-8");
        //받은 result를 투스트링. 겟라이터로 요청받는다.
        response.getWriter().print(result.toString());
    }
}
