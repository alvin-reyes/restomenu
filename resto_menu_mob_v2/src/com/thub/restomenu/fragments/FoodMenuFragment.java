
package com.thub.restomenu.fragments;

import com.peppermint.restomenu.app.MenuPagerAdapter;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;

public class FoodMenuFragment extends Fragment {
	
	private boolean isDrinks;
	
	public FoodMenuFragment(boolean isDrinks){
		this.isDrinks = isDrinks;
	}
	
	@Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		LinearLayout ll = new LinearLayout(getActivity());
		ViewPager vp = new ViewPager(getActivity());
		MenuPagerAdapter mpa = new MenuPagerAdapter(getActivity(),isDrinks);
		vp.setAdapter(mpa);
		ll.addView(vp);
		return ll;
    }
	
}
