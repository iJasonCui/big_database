package com.lavalife.mobile.task;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;

import com.lavalife.mobile.service.LavalifeService;
import com.lavalife.mobile.service.Profile;

/**
 * Async task to search for a list of profile from back end It would also toggle
 * the view (show progress spin) while loading.
 * 
 * @author Jeff Yang
 * 
 */
public class SearchTask extends AsyncTask<Void, Void, List<Profile>> {
    public static String TAG = "SEARCH";

    private ArrayAdapter<Profile> mAdapter;
    private View mContentView;
    private View mProgressView;

    public SearchTask(ArrayAdapter<Profile> adapter, View contentView, View progressView) {
        this.mAdapter = adapter;
        this.mContentView = contentView;
        this.mProgressView = progressView;
    }

    protected List<Profile> doInBackground(Void... p) {
        try {
            return getMemberProfiles();
        } catch (JSONException e) {
            Log.wtf(TAG, e);
        }
        return new ArrayList<Profile>();
    }

    protected void onPreExecute() {
        showProgress(true);
    }

    protected void onPostExecute(final List<Profile> profiles) {
        showProgress(false);
        for (Profile p : profiles) {
            mAdapter.add(p);
        }
    }

    //TODO get search parameters from saved search
    private List<Profile> getMemberProfiles() throws JSONException {
        List<Profile> profiles = new ArrayList<Profile>();

        List<NameValuePair> params = new ArrayList<NameValuePair>();
        params.add(new BasicNameValuePair("c", "d"));
        params.add(new BasicNameValuePair("minAge", "18"));
        params.add(new BasicNameValuePair("maxAge", "40"));
        params.add(new BasicNameValuePair("dist", "150"));
        params.add(new BasicNameValuePair("picture", "YES"));
        params.add(new BasicNameValuePair("seekingWomen", "any"));
        params.add(new BasicNameValuePair("seekingMen", "any"));
        params.add(new BasicNameValuePair("seekingCouple", "any"));

        String json = LavalifeService.INSTANCE.memberSearch(params);
        JSONObject obj = new JSONObject(json);
        JSONArray jprofiles = obj.getJSONArray("list");

        for (int i = 0; i < jprofiles.length(); i++) {
            JSONObject o = jprofiles.getJSONObject(i);
            int age = o.getInt("age");
            String nickname = o.getString("nickname");
            String picture = o.getString("picture");
            String location = o.getString("location");
            int userId = o.getInt("userId");

            Profile p = new Profile();
            p.setUserId(userId);
            p.setPicture(picture);
            p.setYearsOld(age);
            p.setNickname(nickname);
            p.setLocation(location);
            profiles.add(p);
        }
        return profiles;
    }

    @TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
    private void showProgress(final boolean show) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB_MR2) {
            int shortAnimTime = mAdapter.getContext().getResources().getInteger(android.R.integer.config_shortAnimTime);

            mProgressView.setVisibility(View.VISIBLE);
            mProgressView.animate().setDuration(shortAnimTime).alpha(show ? 1 : 0).setListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    mProgressView.setVisibility(show ? View.VISIBLE : View.GONE);
                }
            });

            mContentView.setVisibility(View.VISIBLE);
            mContentView.animate().setDuration(shortAnimTime).alpha(show ? 0 : 1).setListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    mContentView.setVisibility(show ? View.GONE : View.VISIBLE);
                }
            });
        } else {
            mProgressView.setVisibility(show ? View.VISIBLE : View.GONE);
            mContentView.setVisibility(show ? View.GONE : View.VISIBLE);
        }
    }

}
