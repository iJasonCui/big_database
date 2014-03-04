package com.lavalife.mobile.ui.profile;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.lavalife.mobile.service.Profile;
import com.lavalife.mobile.task.DownloadImageTask;
import com.lavalife.mobile.ui.R;

public class ProfileFragment extends Fragment {
    private Profile mProfile;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_profile, container, false);

        ImageView imageView = (ImageView) view.findViewById(R.id.profileview);
        new DownloadImageTask(imageView).execute(mProfile.getPictureUrl());
        return view;
    }
    
    public void setProfile(Profile profile) {
        mProfile = profile;
    }
}