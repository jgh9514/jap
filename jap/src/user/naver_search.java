package user;

// ���̹� �˻� API ���� - blog �˻�
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
        String clientId = "P2Gp6D05WMSSIOUJIXIP";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
        String clientSecret = "KB37Gj44v6";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
        try {
            String text = URLEncoder.encode("���ڰ���", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/shop?query="+ text; // json ���
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml ���
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // ���� ȣ��
                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
            } else {  // ���� �߻�
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
