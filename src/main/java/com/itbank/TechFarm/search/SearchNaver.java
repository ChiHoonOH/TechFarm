package com.itbank.TechFarm.search;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
public class SearchNaver {	
    public List<Object> search(String target,String searchName, String startPage) {
        List<Object> list=new ArrayList<Object>();
    	String clientId = "";
        String clientSecret = "";
        try{
	         	File dir = new File(this.getClass().getResource("").getPath());
	 			File idfile = new File(dir, "clientId");
	 			File secretfile = new File(dir, "clientSecret");
	 			BufferedReader idbr = new BufferedReader(new FileReader(idfile));
	 			BufferedReader secretbr = new BufferedReader(new FileReader(secretfile));
	 
	 		clientId=idbr.readLine();
	 			clientSecret = secretbr.readLine();
	 			System.out.println(clientId);
	         }catch(IOException e){
	         	e.printStackTrace();
        	 }
        try {
            String text = URLEncoder.encode(searchName, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/"+target+".json?query="+text+"&start="+startPage;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            String json=response.toString();
            System.out.println(json);
            JSONParser parser=new JSONParser();
            JSONObject jobj=(JSONObject)parser.parse(json);
            Object total=(Object)jobj.get("total");
            Object time=(Object)jobj.get("lastBuildDate");
            list.add(total);
            list.add(time);
            JSONArray items=(JSONArray)jobj.get("items");
            for(int i=0;i<items.size();i++){
            	JSONObject temp=(JSONObject)items.get(i);
            	SearchDTO dto=new SearchDTO();
            	dto.setTitle((String)temp.get("title"));
            	dto.setLink((String)temp.get("link"));
            	dto.setDescription((String)temp.get("description"));
            	list.add(dto);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
