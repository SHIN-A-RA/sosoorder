package com.soso.app.soso;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.XML;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
 
@RestController
public class ActualDealController {
 
//  api 통해 내위치 주변 정보 가져오기
//  https://aramk.tistory.com/46
    @RequestMapping("sosoOrder")
    public Map<String, Object> getActualDealPrice(@RequestParam Map<String, Object> paramMap) throws Exception {
        //System.out.println("### getActualDealPrice paramMap=>"+paramMap);
        Map<String, Object> resultMap = new HashMap<>();
 
        try {
        	
        	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRadius"); /*URL*/
        	urlBuilder.append("?"+URLEncoder.encode("radius", "UTF-8")+"=500");
            urlBuilder.append("&"+URLEncoder.encode("cx", "UTF-8")+"=128.5896283");
            urlBuilder.append("&"+URLEncoder.encode("cy", "UTF-8")+"=35.8704736");
            urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=VwbBoXQgv%2B5U%2FxwjpiRV7TkZgK461se9253O5m%2Fg7s%2F7eVxbqfJZg5ECYk4g4XvqmPoXeYemAPFzG7Ndk9uetw%3D%3D"); /*Service Key*/

            URL url = new URL(urlBuilder.toString());
 
           // System.out.println("###url=>"+url);
 
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
           // System.out.println("Response Code:"+conn.getResponseCode());
 
            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
 
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line=rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
 
            org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
            String xmlJSONObjString = xmlJSONObj.toString();
            //System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);
 
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> map = new HashMap<>();
            map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
            Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
            Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
            Map<String, Object> items = null;
            List<Map<String, Object>> itemList = null;
 
            items = (Map<String, Object>) body.get("items");
            itemList = (List<Map<String, Object>>) items.get("item");
 
            System.out.println("### map="+map);
            System.out.println("### dataResponse="+dataResponse);
            System.out.println("### body="+body);
            System.out.println("### items="+items);
            System.out.println("### itemList="+itemList);
 
            resultMap.put("Result", "0000");
            resultMap.put("numOfRows", body.get("numOfRows"));
            resultMap.put("pageNo", body.get("pageNo"));
            resultMap.put("totalCount", body.get("totalCount"));
            resultMap.put("data", itemList);
 
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.clear();
            resultMap.put("Result", "0001");
        }
 
        return resultMap;
    }
}
 
