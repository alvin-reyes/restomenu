package com.thub.restomenu.fragments;

import java.util.ArrayList;

import com.peppermint.restomenu.app.EmPrefs;
import com.peppermint.restomenu.app.Emrpc;
import com.peppermint.restomenu.app.NumberPicker;
import com.peppermint.restomenu.app.R;
import com.peppermint.restomenu.app.R.id;
import com.peppermint.restomenu.app.R.layout;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;

public class DeliveryDateDialogFragment extends DialogFragment {
	
	LayoutInflater li;
	String table;
	AutoCompleteTextView spin = null;
	EditText etPass = null;
	ArrayAdapter<String> adapter = null;
	Button deliveryBtnOk;
	Button deliveryBtnCancel;
	Button btnDiners;
	ProgressBar pbar;
	String sid;
	
	NumberPicker adultsNb;
	NumberPicker childrenNb;
	View v;
	
	ArrayList<String> items = null;
	Emrpc rpc = null;
	EmPrefs emp = null;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		li = (LayoutInflater) getActivity().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		this.setCancelable(false);
		emp = new EmPrefs(getActivity());
		rpc = new Emrpc(getActivity());
	}
	
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState) {
        v = li.inflate(R.layout.deliverydatedialog, container, false);
        deliveryBtnOk = (Button)v.findViewById(R.id.deliveryBtnOk);
        deliveryBtnCancel = (Button)v.findViewById(R.id.deliveryBtnCancel);
        
        deliveryBtnOk.setOnClickListener(new View.OnClickListener() {
        	@Override
			public void onClick(View v) {
        		FragmentManager fm = getActivity().getSupportFragmentManager();
            	FragmentTransaction ft ;
            	Fragment f = null;
        		f =  new FoodMenuFragment(false);
	    		if(fm.findFragmentByTag("rightfragment")!=null){
	    			ft = fm.beginTransaction();
	    			ft.setCustomAnimations(android.R.anim.fade_in,
	    	                android.R.anim.fade_out);
	    			ft.remove(fm.findFragmentByTag("rightfragment"));
	    			ft.commit();
	    		}
	    		ft = fm.beginTransaction();
	    		ft.setCustomAnimations(android.R.anim.fade_in,
	                    android.R.anim.fade_out);
    			ft.add(R.id.rightcontent,f,"rightfragment");
    			ft.commit();
    			
    			dismiss();
        	}
        });
        deliveryBtnCancel.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				dismiss();
			}
		});
        return v;
    }
	

    final Handler LoadItemsHandler = new Handler() {
  	  
        public void handleMessage(Message msg) {
        	
        	if(items!=null){
        		adapter = new ArrayAdapter<String>(getActivity(),
        				R.layout.autocompleteview, items);
        		spin.setAdapter(adapter);
        		adapter.notifyDataSetChanged();
        	}
        	pbar.setVisibility(View.GONE);
           
        };
    };
    
    // RUNNABLE
    private class LoadItemsRun implements Runnable{
    	
		@Override
		public void run() {
			
			items = rpc.getLoginNames() ;
			LoadItemsHandler.sendEmptyMessage(0);
		}
    	
    }
    
    final Handler NewSessionHandler = new Handler() {
    	  
        public void handleMessage(Message msg) {
        	if(msg.what==0)
        		pbar.setVisibility(View.GONE);
        	else if(msg.what==2){
        		getActivity().findViewById(R.id.btnConfig).setVisibility(View.VISIBLE);
        		pbar.setVisibility(View.GONE);
        		dismiss();
        	}
        	else{
        		((TextView)getActivity().findViewById(R.id.lblTable)).setText(table);
        		getActivity().findViewById(R.id.btnMenu).setEnabled(true);
        		getActivity().findViewById(R.id.btnDrinks).setEnabled(true);
        		getActivity().findViewById(R.id.btnWaiter).setEnabled(true);
        		getActivity().findViewById(R.id.btnOrder).setEnabled(true);
        		getActivity().findViewById(R.id.btnBill).setEnabled(true);
        		getActivity().findViewById(R.id.btnConfig).setVisibility(View.GONE);
//        		getActivity().findViewById(R.id.btnDelivery).setEnabled(true);
//        		getActivity().findViewById(R.id.btnTakeOut).setEnabled(true);
        		
        		sid = msg.getData().getString("sid");
        		emp.setSid(sid);
        		emp.commit();
        		pbar.setVisibility(View.GONE);
        		if(emp.getValue("restmode").equals(new String("allyoucaneat"))){
        			v.findViewById(R.id.tableLayout2).setVisibility(View.VISIBLE);
        			v.findViewById(R.id.tableLayout1).setVisibility(View.GONE);
        		}
        		else{
        			dismiss();
        			FragmentManager fm = getActivity().getSupportFragmentManager();
                	FragmentTransaction ft ;
    	    		if(fm.findFragmentByTag("rightfragment")!=null){
    	    			ft = fm.beginTransaction();
    	    			ft.setCustomAnimations(android.R.anim.fade_in,
    		                    android.R.anim.fade_out);
    	    			ft.remove(fm.findFragmentByTag("rightfragment"));
    	    			ft.commit();
    	    		}
        		}
        	}
        };
    };
    
    // RUNNABLE
    private class NewSessionRun implements Runnable{
    	
		@Override
		public void run() {
	
			Message msg = new Message();
			Bundle b = new Bundle();
			
			//Emrpc rpc = new Emrpc(getActivity());
			
			if(spin.getText().toString().equals(new String("admin"))){
				if(etPass.getText().toString().equals(new String(emp.getValue("password")))){
					msg.what=2;
					NewSessionHandler.sendMessage(msg);
				}
				else{
					msg.what=0;
					NewSessionHandler.sendMessage(msg);
				}
			return;
			}
			
    		if(rpc.newSession(spin.getText().toString(),etPass.getText().toString(), table)){
    			b.putString("sid", (String)rpc.getData());
    			msg.what = 1;
    			msg.setData(b);
    			NewSessionHandler.sendMessage(msg);
    		}
    		else{
    			msg.what = 0;
    			NewSessionHandler.sendMessage(msg);
    		}
		}
    	
    }

    final Handler DinersHandler = new Handler() {
  	  
        public void handleMessage(Message msg) {
        	if(msg.what==1){
        		dismiss();
        		FragmentManager fm = getActivity().getSupportFragmentManager();
            	FragmentTransaction ft ;
	    		if(fm.findFragmentByTag("rightfragment")!=null){
	    			ft = fm.beginTransaction();
	    			ft.setCustomAnimations(android.R.anim.fade_in,
		                    android.R.anim.fade_out);
	    			ft.remove(fm.findFragmentByTag("rightfragment"));
	    			ft.commit();
	    		}
        	}
        }
    };
    
 // RUNNABLE
    private class DinersRun implements Runnable{
    	
		@Override
		public void run() {
			
			if (rpc.setDinersNumber(sid, Integer.toString(adultsNb.getValue()) , Integer.toString(childrenNb.getValue()) )){
				DinersHandler.sendEmptyMessage(1);
			}
			else
			{
				DinersHandler.sendEmptyMessage(0);
			}
		}
    }
}
