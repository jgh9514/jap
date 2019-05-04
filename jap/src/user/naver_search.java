package user;

// 네이버 검색 API 예제 - blog 검색
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;

import javax.websocket.Session;

import sun.net.www.http.HttpClient;

public class naver_search {


    public String test() {
        String clientId = "P2Gp6D05WMSSIOUJIXIP";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "KB37Gj44v6";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode("남자고데기", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/shop?query="+ text; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine+"\n");
                
            }
            br.close();
            System.out.println(response.toString());
            return response.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
		return null;
    }

}
