
package com.thub.restomenu.fragments;

import java.util.ArrayList;
import java.util.Locale;

import com.peppermint.restomenu.app.Emrpc;
import com.peppermint.restomenu.app.R;
import com.peppermint.restomenu.app.RestoMenuActivity;
import com.peppermint.restomenu.app.R.id;
import com.peppermint.restomenu.app.R.layout;
import com.peppermint.restomenu.app.R.raw;
import com.peppermint.restomenu.app.R.string;


import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

public class TableListFragment extends Fragment {

	LayoutInflater li = null;
	ItemAdapter adapter = null;
	//ItemAdapter adapter = null;
	
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		li = getActivity().getLayoutInflater();
	}
	
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		
		View v = inflater.inflate(R.layout.menupager,container,false);
		((TextView)v.findViewById(R.id.menuTitle)).setText(R.string.tableList);
		GridView gridview = (GridView) v.findViewById(R.id.gridview);
		adapter = new ItemAdapter(getActivity());
    	gridview.setAdapter(adapter);
    	
    	//gridview.setOnItemClickListener(new OnItemClickListener() {
        //    public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
            	//v.setSelected(true);
            	//v.setPressed(true);
            	//adapter.selectedItemsList.add(String.valueOf(position));
        //    }
        //});
    	
    	
    	gridview.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> parent, View v, int position, long id) {
                //Toast.makeText(context, "" + position, Toast.LENGTH_SHORT).show();
            	FragmentManager fm = getActivity().getSupportFragmentManager();
            	FragmentTransaction ft = fm.beginTransaction();
            	DialogFragment f = new LoginFragment(adapter.itemsList.get(position)); 
            	Fragment prev = fm.findFragmentByTag("loginDialog");
                if (prev != null) {
                    ft.remove(prev);
                    ft.commit();
                }
                f.show(ft, "loginDialog");
            }
        });
    	
		return v;
    }
	
    /*
     * IMAGE ADAPTER FOR GRIDVIEW
     * 
     */
    
    private class ItemAdapter extends BaseAdapter {
        private Context context;
        
        private ArrayList<String> itemsList = null;
        private ArrayList<String> selectedItemsList = new ArrayList<String>();
        
        public ItemAdapter(Context c) {
            context = c;
        }
        
        public void setItemsList(ArrayList<String> arg0){
        	itemsList = arg0;
        }
        
        
        public ArrayList<String> getSelectedItemsList() {
			return selectedItemsList;
		}

		public void setSelectedItemsList(ArrayList<String> selectedItemsList) {
			this.selectedItemsList = selectedItemsList;
		}

		public int getCount() {
        	if (itemsList==null){
        		return 1;
        	}
        		
        	else
        		return itemsList.size();
        }

        public Object getItem(int position) {
        		if(itemsList!=null)
        			return itemsList.get(position);
        		else
        			return null;
        }
       

        public long getItemId(int position) {
            return 0;
        }

        // create a new ImageView for each item referenced by the Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
        	
        	if(itemsList==null){
        		if (convertView == null){
        			((GridView)parent).setNumColumns(1);
        			View v = li.inflate(R.layout.spinner, null);
        			v.setTag(new String("spinnerTag"));
        			new Thread(new LoadItemsRun()).start();
        			return v;
        		}
        		else
        			return  convertView;
        	}
        	else{
        		((GridView)parent).setNumColumns(GridView.AUTO_FIT);
        		
        		View v = null;
        		
        		if (convertView == null || ((String)convertView.getTag())!=null ) { 
        			v = li.inflate(R.layout.itemview, null);
        			((ImageView)v.findViewById(R.id.itemImage)).setScaleType(ImageView.ScaleType.FIT_CENTER);
        		} else {
        			v = convertView;
        		}
        		if(v!=null){
        			((ImageView)v.findViewById(R.id.itemImage)).setImageBitmap(BitmapFactory.decodeStream(
        				context.getResources().openRawResource(R.raw.table)));
        			((TextView)v.findViewById(R.id.itemTitle)).setText(itemsList.get(position));
        		}
        		return v;
        	}
        }
       
    }
    
    final Handler LoadItemsHandler = new Handler() {
  	  
        public void handleMessage(Message msg) {
        	
        	ArrayList<String> tmpList = msg.getData().getStringArrayList("tablesList");
        	tmpList.add(0,new String("Admin"));
        	adapter.setItemsList(tmpList);
        	adapter.notifyDataSetChanged();
           
        };
    };
    
    // RUNNABLE
    private class LoadItemsRun implements Runnable{
    	
		@Override
		public void run() {
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				Log.e(RestoMenuActivity.TAG,"200ms timout");
			}
			
			Emrpc rpc = new Emrpc(getActivity());
			Bundle bd = new Bundle();
			bd.putStringArrayList("tablesList",rpc.getTablesList() );
			Message msg = new Message();
			msg.setData(bd);
			LoadItemsHandler.sendMessage(msg);
		}
    	
    }
}
