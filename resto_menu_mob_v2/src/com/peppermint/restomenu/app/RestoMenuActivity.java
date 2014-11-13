
package com.peppermint.restomenu.app;


import java.io.FileNotFoundException;

import com.peppermint.restomenu.app.R;
import com.thub.restomenu.fragments.DeliveryDateDialogFragment;
import com.thub.restomenu.fragments.ErrorFragment;
import com.thub.restomenu.fragments.FoodMenuFragment;
import com.thub.restomenu.fragments.PayBillFragment;
import com.thub.restomenu.fragments.ReviewPlaceFragment;
import com.thub.restomenu.fragments.SettingsFragment;
import com.thub.restomenu.fragments.TableListFragment;


import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewPager;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.View.OnLongClickListener;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;


public class RestoMenuActivity extends FragmentActivity {
    /** Called when the activity is first created. */
	
	public static final String TAG = "RestoMenu";
	
	MenuPagerAdapter adapter = null;
	ViewPager pager = null;
	
	ProgressBar pBar = null;
	
	EmPrefs emp = null;
	Emrpc rpc = null;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
		getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
				WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.main);
        
        emp = new EmPrefs(this);
        rpc = new Emrpc(this);
        
//        try {
//			((ImageView)findViewById(R.id.logoImg)).setImageBitmap(BitmapFactory.decodeStream(
//					openFileInput("logo.img")));
//		} catch (FileNotFoundException e) {
//			Log.e(RestoMenuActivity.TAG,"Error image file not found: "+e.getMessage());
//		}
        
        this.findViewById(R.id.lblTable).setClickable(true);
        this.findViewById(R.id.lblTable).setOnLongClickListener(new OnLongClickListener(){

			@Override
			public boolean onLongClick(View v) {
				
				((TextView)findViewById(R.id.lblTable)).setText("");
        		findViewById(R.id.btnMenu).setEnabled(false);
        		findViewById(R.id.btnDrinks).setEnabled(false);
        		findViewById(R.id.btnWaiter).setEnabled(false);
        		findViewById(R.id.btnOrder).setEnabled(false);
        		findViewById(R.id.btnBill).setEnabled(false);
        		findViewById(R.id.btnConfig).setVisibility(View.GONE);
				
		        FragmentManager fm = getSupportFragmentManager();
		    	FragmentTransaction ft ;
		    	Fragment f = null;
		    	f = new TableListFragment();
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
				return true;
			}
        	
        });
        
        FragmentManager fm = getSupportFragmentManager();
    	FragmentTransaction ft ;
    	Fragment f = null;
    	f = new TableListFragment();
    	ft = fm.beginTransaction();
		ft.setCustomAnimations(android.R.anim.fade_in,
                android.R.anim.fade_out);
		ft.add(R.id.rightcontent,f,"rightfragment");
		ft.commit();
        
    }
    
    public void leftMenuClicked (View v){
    	FragmentManager fm = getSupportFragmentManager();
    	FragmentTransaction ft ;
    	Fragment f = null;
    	
    	switch(v.getId()){
	    	case R.id.btnMenu:
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
	    		
	    		break;
	    	case R.id.btnDrinks:
	    		f =  new FoodMenuFragment(true);
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
	    		break;
	    	case R.id.btnOrder:
	    		f =  new ReviewPlaceFragment();
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
	    		break;	
	    	case R.id.btnBill:
	    		f =  new PayBillFragment();
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
	    		break;	
	    	case R.id.btnWaiter:
	    		if(rpc.callWaiter(emp.getSid())){
	    			ft = fm.beginTransaction();
	    			ErrorFragment ferr = new ErrorFragment(getResources().getString(R.string.waiterNotified)); 
	    			Fragment prev = fm.findFragmentByTag("errorDialog");
	    			if (prev != null) {
	    				ft.remove(prev);
	    				ft.commit();
	    			}
	    			ferr.show(ft, "errorDialog");
	    		}
	    		break;
	    	case R.id.btnConfig:
	    		f =  new SettingsFragment();
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
    			break;
//	    	case R.id.btnTakeOut:
//	    		f =  new FoodMenuFragment(false);
//	    		if(fm.findFragmentByTag("rightfragment")!=null){
//	    			ft = fm.beginTransaction();
//	    			ft.setCustomAnimations(android.R.anim.fade_in,
//	    	                android.R.anim.fade_out);
//	    			ft.remove(fm.findFragmentByTag("rightfragment"));
//	    			ft.commit();
//	    		}
//	    		ft = fm.beginTransaction();
//	    		ft.setCustomAnimations(android.R.anim.fade_in,
//	                    android.R.anim.fade_out);
//    			ft.add(R.id.rightcontent,f,"rightfragment");
//    			ft.commit();
//	    		
//	    		break;	
//	    	case R.id.btnDelivery:
//	    		//Toast.makeText(context, "" + position, Toast.LENGTH_SHORT).show();
//	    		ft = fm.beginTransaction();
//            	DialogFragment deliveryDateDialogFragment = new DeliveryDateDialogFragment(); 
//            	Fragment prev = fm.findFragmentByTag("deliveryDateDialog");
//                if (prev != null) {
//                    ft.remove(prev);
//                    ft.commit();
//                }
//                deliveryDateDialogFragment.show(fm,"deliveryDateDialog");
//	    		break;	
	    	default:
	    		break;
    	}
	 }
    
}
