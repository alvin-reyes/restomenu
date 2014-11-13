package com.thub.restomenu.fragments;

import com.peppermint.restomenu.app.R;
import com.peppermint.restomenu.app.R.layout;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class LeftMenuFragment extends Fragment {

	public LeftMenuFragment() {}

	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		return inflater.inflate(R.layout.leftmenu, null, true);
	}

}
