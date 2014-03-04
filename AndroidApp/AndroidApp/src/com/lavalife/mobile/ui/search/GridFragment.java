package com.lavalife.mobile.ui.search;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.ProgressBar;

import com.lavalife.mobile.service.Profile;
import com.lavalife.mobile.task.DownloadImageTask;
import com.lavalife.mobile.task.SearchTask;
import com.lavalife.mobile.ui.R;
/**
 * Search Grid View
 *  
 * @author Jeff Yang 
 *
 */
public class GridFragment extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_grid, container, false);
        GridView gridView = (GridView) rootView.findViewById(R.id.gridview);
        ProgressBar progressBar = (ProgressBar) rootView.findViewById(R.id.loading_status);
        ImageAdapter adapter = new ImageAdapter(getActivity());
        new SearchTask(adapter, gridView, progressBar).execute((Void) null);

        gridView.setAdapter(adapter);
        return rootView;
    }

    public static class ImageAdapter extends ArrayAdapter<Profile> {
        private Context mContext;

        public ImageAdapter(Context c) {
            super(c, 0);
            mContext = c;
        }

        public View getView(int position, View convertView, ViewGroup parent) {
            ImageView imageView;
            if (convertView == null) {
                imageView = new ImageView(mContext);
                imageView.setAdjustViewBounds(true);
                imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
            } else {
                imageView = (ImageView) convertView;
            }

            Profile profile = getItem(position);
            new DownloadImageTask(imageView).execute(profile.getPictureUrl());
            return imageView;
        }
    }
}