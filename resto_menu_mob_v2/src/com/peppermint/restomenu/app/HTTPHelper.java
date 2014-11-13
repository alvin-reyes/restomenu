
package com.peppermint.restomenu.app;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;

import android.content.Context;
import android.util.Log;

public class HTTPHelper {
	
	private String url = null;
	private String body = null;
	private Context context = null;
	
	public HTTPHelper(String uri,Context c){
		context = c;
		EmPrefs emp = new EmPrefs(context);
		String hostName = emp.getValue("server");

		if(hostName.contentEquals(""))
			hostName="null";
		url = "http://"+hostName+"/"+uri;
	}
	
	public void setBody(String b){
		body = b;
	}
	
	public String executePost(){
		String result = "";
		InputStream is = null;
		
		try{
			HttpClient httpclient = new DefaultHttpClient();
			//HttpConnectionParams.setSoTimeout(httpclient.getParams(), 5000);
			//HttpConnectionParams.setConnectionTimeout(httpclient.getParams(),5000); 
			
			HttpPost httppost = new HttpPost(url);
			Log.i(RestoMenuActivity.TAG, "Connecting to "+url);
			httppost.addHeader("Content-Type","application/json");
			httppost.setEntity(new StringEntity(body));
			
			HttpResponse response = httpclient.execute(httppost);
			HttpEntity entity = response.getEntity();
			is = entity.getContent();
		}catch(ClientProtocolException cp){
			Log.e("EasyMenu", "HTTP protocol error "+cp.toString());
		}
		catch(IOException e){
			Log.e("EasyMenu", "HTTP problem or the connection was aborted "+e.toString());
			return new String("{\"jsonrpc\":\"2.0\",\"error\":{\"code\":500,\"message\":\"HTTP Connection Error\"},\"id\":null}");
		}
		//convert response to string
		try{
			BufferedReader reader = new BufferedReader(new InputStreamReader(is,"iso-8859-1"),8);
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}
			is.close();
			result=sb.toString();
			Log.i(RestoMenuActivity.TAG, "Server answer "+ sb);
		}catch(IOException e){
			Log.e("EasyMenu", "Error converting result "+e.toString());
		}
		
		return result;
	}
	
	public InputStream fetch(){

		HttpEntity entity=null;
		try{
			HttpClient httpclient = new DefaultHttpClient();
			HttpConnectionParams.setSoTimeout(httpclient.getParams(), 5000);
			HttpConnectionParams.setConnectionTimeout(httpclient.getParams(),
					5000); 

			HttpGet httppost = new HttpGet(url);
			Log.e(RestoMenuActivity.TAG, "Connecting to "+url);
			HttpResponse response = httpclient.execute(httppost);
			entity = response.getEntity();
			return entity.getContent();
		}
		catch(Exception e){
			Log.e(RestoMenuActivity.TAG, "Error in http connection "+e.toString());
			return null;
		}
	}


}
