package com.lavalife.mobile.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import android.util.Log;
/**
 * Singleton service of lavalife server side API   
 * 
 * @author Jeff Yang
 *
 */
public enum LavalifeService {
    INSTANCE;

    static String BASE_URL = "http://208.68.202.197";
    String token;
    boolean gridView = true;

    //TODO moved to preference
    public boolean isGridView() {
        return gridView;
    }

    public void setGridView(boolean gridView) {
        this.gridView = gridView;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String login(String email, String password) {
        String url = "/member/entrance/auth";
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("login", email));
        params.add(new BasicNameValuePair("password", password));
        params.add(new BasicNameValuePair("returnStatusOnly", "Y"));
        return getJSONFromUrl(url, params);
    }

    public String memberSearch(List<NameValuePair> params) {
        String url ="/member/dating/json/search/custom";
        return getJSONFromUrl(url + withToken(), params);
    }

    private String withToken() {
        return ";jsessionid=" + token;
    }

    public String guestSearch(String gender, String age) {
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("gender", "F"));
        params.add(new BasicNameValuePair("age", "18-88"));
        params.add(new BasicNameValuePair("countryId", "40"));
        String url = "/mobile/api/search.act";
        return getJSONFromUrl(url, params);
    }

    private String getJSONFromUrl(String url, List<NameValuePair> params) {
        InputStream is = null;
        String json = "";
        try {
            DefaultHttpClient httpClient = new DefaultHttpClient();
            HttpPost httpPost = new HttpPost(BASE_URL + url);
            httpPost.setEntity(new UrlEncodedFormEntity(params));
            HttpResponse httpResponse = httpClient.execute(httpPost);
            HttpEntity httpEntity = httpResponse.getEntity();
            is = httpEntity.getContent();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(is, "iso-8859-1"), 8);
            StringBuilder sb = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
            is.close();
            json = sb.toString();
            //Log.e("JSON", json);
        } catch (Exception e) {
            Log.e("Buffer Error", "Error converting result " + e.toString());
        }
        return json;

    }

}
