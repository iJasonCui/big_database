package com.lavalife.mobile.ui.search;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.lavalife.mobile.service.Profile;
import com.lavalife.mobile.task.DownloadImageTask;
import com.lavalife.mobile.task.SearchTask;
import com.lavalife.mobile.ui.MainActivity;
import com.lavalife.mobile.ui.ProfileActivity;
import com.lavalife.mobile.ui.R;

/**
 * Search List View
 * 
 * @author Jeff Yang
 * 
 */
public class SearchListFragment extends Fragment {

    public SearchListFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_list, container, false);
        final ListView listView = (ListView) rootView.findViewById(R.id.listview);
        ProgressBar progressBar = (ProgressBar) rootView.findViewById(R.id.loading_status);
        ImageAdapter adapter = new ImageAdapter(getActivity());
        new SearchTask(adapter, listView, progressBar).execute((Void) null);
        listView.setAdapter(adapter);

        listView.setOnItemClickListener(new OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                // String item = ((TextView)view).getText().toString();
                Profile profile =(Profile) (listView.getItemAtPosition(position));
                MainActivity activity = (MainActivity) getActivity();
                activity.showProfile(profile);
            }
        });

        return rootView;
    }

    public static class ImageAdapter extends ArrayAdapter<Profile> {

        public ImageAdapter(Context c) {
            super(c, 0);
        }

        public View getView(int position, View convertView, ViewGroup parent) {

            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.profile_item, null);
            }

            ImageView profileImage = (ImageView) convertView.findViewById(R.id.profile_image);
            profileImage.setAdjustViewBounds(true);
            profileImage.setScaleType(ImageView.ScaleType.CENTER_CROP);
            TextView nickname = (TextView) convertView.findViewById(R.id.profile_nickname);
            TextView detail = (TextView) convertView.findViewById(R.id.profile_detail);

            Profile profile = getItem(position);

            new DownloadImageTask(profileImage).execute(profile.getPictureUrl());
            nickname.setText(profile.getNickname());
            detail.setText(profile.getYearsOld() + ", " + profile.getLocation());

            return convertView;

        }

    }

}
