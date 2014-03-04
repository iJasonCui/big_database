package com.lavalife.mobile.ui;

import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.lavalife.mobile.service.LavalifePreference;
import com.lavalife.mobile.service.LavalifeService;
import com.lavalife.mobile.service.Profile;
import com.lavalife.mobile.ui.profile.ProfileFragment;
/**
 * Main activity is responsible for 3 UI items
 * a. Navigation drawer 
 * b. Action bar 
 * c. Tabs  
 * 
 * @author Jeff Yang
 *
 */
public class MainActivity extends FragmentActivity {
    private static String TAG = "Main";
    private DrawerLayout mDrawerLayout;
    private ListView mDrawerList;
    private ActionBarDrawerToggle mDrawerToggle;
    private TabsFragment mTabsFragment;
    private boolean isSearch = false;
    private int mCurrentPosition = 0;
    private CharSequence mTitle;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LavalifePreference pref = new LavalifePreference(getApplicationContext());
        new PingTask(pref).execute((Void) null);

        Log.d(TAG, "onCreated");
        setContentView(R.layout.activity_main);
        mTitle = getTitle();
        mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        mDrawerList = (ListView) findViewById(R.id.left_drawer);
        mDrawerLayout.setDrawerShadow(R.drawable.drawer_shadow, GravityCompat.START);
        // mDrawerList.setAdapter(new ArrayAdapter<String>(this,
        // R.layout.drawer_list_item, mPlanetTitles));

        DrawerMenuAdapter adapter = new DrawerMenuAdapter(this);
        adapter.add(new DrawerMenu(R.drawable.ic_carousel_grey, "Carousel", "3"));
        adapter.add(new DrawerMenu(R.drawable.ic_search_grey, "Search", "3"));
        adapter.add(new DrawerMenu(R.drawable.ic_connections_grey, "Connections", "1"));
        adapter.add(new DrawerMenu(R.drawable.ic_messages_grey, "Messages", "3"));
        adapter.add(new DrawerMenu(R.drawable.ic_hot_list_grey, "Hot List", ""));
        adapter.add(new DrawerMenu(R.drawable.ic_views_grey, "Views", ""));
        adapter.add(new DrawerMenu(R.drawable.ic_profile_grey, "My Profile", ""));
        mDrawerList.setAdapter(adapter);
        mDrawerList.setOnItemClickListener(new DrawerItemClickListener());

        // enable ActionBar app icon to behave as action to toggle nav drawer
        getActionBar().setDisplayHomeAsUpEnabled(true);
        //getActionBar().setHomeButtonEnabled(true);

        // ActionBarDrawerToggle ties together the the proper interactions
        // between the sliding drawer and the action bar app icon
        mDrawerToggle = new ActionBarDrawerToggle(this, mDrawerLayout, R.drawable.ic_drawer, R.string.drawer_open, R.string.drawer_close ) {
            public void onDrawerClosed(View view) {
                getActionBar().setTitle(mTitle);
                invalidateOptionsMenu();
            }

            public void onDrawerOpened(View drawerView) {
                invalidateOptionsMenu();
            }
        };

        mDrawerLayout.setDrawerListener(mDrawerToggle);

        if (savedInstanceState != null) {
            mCurrentPosition = savedInstanceState.getInt("currentPosition");
            Log.d(TAG, "onRestored:" + mCurrentPosition);
        }

        selectItem(mCurrentPosition);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        boolean drawerOpen = mDrawerLayout.isDrawerOpen(mDrawerList);
        menu.findItem(R.id.action_overflow).setVisible(!drawerOpen);
        boolean isGridView = LavalifeService.INSTANCE.isGridView();
        menu.findItem(R.id.action_list).setVisible(!drawerOpen && isGridView && isSearch);
        menu.findItem(R.id.action_grid).setVisible(!drawerOpen && !isGridView && isSearch);
        return super.onPrepareOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // The action bar home/up action should open or close the drawer.
        // ActionBarDrawerToggle will take care of this.
        if (mDrawerToggle.onOptionsItemSelected(item)) {
            return true;
        }

        // Handle action buttons
        switch (item.getItemId()) {
        case R.id.action_overflow:
            Toast.makeText(this, R.string.app_not_available, Toast.LENGTH_LONG).show();
            return true;
        case R.id.action_grid:
        case R.id.action_list:
            invalidateOptionsMenu();
            mTabsFragment.toggleResult();
            return true;
        default:
            return super.onOptionsItemSelected(item);
        }
    }

    private class DrawerItemClickListener implements ListView.OnItemClickListener {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
            selectItem(position);
        }
    }

    private void selectItem(int position) {
        mCurrentPosition = position;
        isSearch = (mCurrentPosition == 1);
        // update the main content by replacing fragments
        mDrawerList.setItemChecked(position, true);
        // setTitle(mMenuTitles[position]);
        mDrawerLayout.closeDrawer(mDrawerList);
        mTabsFragment = new TabsFragment();
        Bundle args = new Bundle();
        args.putInt(TabsFragment.MENU_ITEM_ID, position);
        mTabsFragment.setArguments(args);

        FragmentManager fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction().replace(R.id.content_frame, mTabsFragment).commit();
    }

    public void showProfile(Profile profile) {
        ProfileFragment pf = new ProfileFragment();
        pf.setProfile(profile);
        FragmentManager fragmentManager = getSupportFragmentManager();
        fragmentManager.beginTransaction().replace(R.id.content_frame, pf).addToBackStack("profile").commit();
        mDrawerToggle.setDrawerIndicatorEnabled(false);
        getActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public void setTitle(CharSequence title) {
        mTitle = title;
        getActionBar().setTitle(mTitle);
    }

    @Override
    public void onSaveInstanceState(Bundle savedInstanceState) {
        super.onSaveInstanceState(savedInstanceState);
        Log.d(TAG, "onSaved:" + mCurrentPosition);
        savedInstanceState.putInt("currentPosition", mCurrentPosition);
    }

    @Override
    public void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
    }

    /**
     * When using the ActionBarDrawerToggle, you must call it during
     * onPostCreate() and onConfigurationChanged()...
     */

    @Override
    protected void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        // Sync the toggle state after onRestoreInstanceState has occurred.
        mDrawerToggle.syncState();
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        // Pass any configuration change to the drawer toggls
        mDrawerToggle.onConfigurationChanged(newConfig);
    }

    public class DrawerMenu {
        public DrawerMenu(int icon, String name, String number) {
            this.icon = icon;
            this.name = name;
            this.number = number;
        }

        public int icon;
        public String name;
        public String number;

    }

    public class DrawerMenuAdapter extends ArrayAdapter<DrawerMenu> {

        public DrawerMenuAdapter(Context context) {
            super(context, 0);
        }

        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.drawer_list_item, null);
            }
            DrawerMenu menu = getItem(position);
            ImageView imageView = (ImageView) convertView.findViewById(R.id.menu_image);
            TextView title = (TextView) convertView.findViewById(R.id.menu_text);
            TextView number = (TextView) convertView.findViewById(R.id.menu_count);
            imageView.setImageResource(menu.icon);
            title.setText(menu.name);
            number.setText(menu.number);
            return convertView;
        }

    }
    
    private class PingTask extends AsyncTask<Void, Void, JSONObject> {
        LavalifePreference mPref;
       
        public PingTask(LavalifePreference pref) {
            mPref = pref; 
        }
        
        @Override
        protected JSONObject doInBackground(Void... params) {
            return ping();
        }

        @Override
        protected void onPostExecute(final JSONObject result) {
            //showProgress(false);
            try {
                if (result == null || !"OK".equals(result.getString("status"))) {
                    Intent myIntent = new Intent(MainActivity.this, LoginActivity.class);
                    startActivity(myIntent);
                    finish();
                } else {
                    LavalifeService.INSTANCE.setToken(result.getString("session"));
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        @Override
        protected void onCancelled() {
            //showProgress(false);
        }

        private JSONObject ping() {
            JSONObject json = null;
            try {
                json = new JSONObject(LavalifeService.INSTANCE.login(mPref.getLogin(), mPref.getPassword()));
                // Log.e("JSON", json.toString());
            } catch (JSONException e) {

            }
            return json;
        }
    }
}