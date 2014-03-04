package com.lavalife.mobile.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.lavalife.mobile.service.LavalifePreference;
/**
 * Dispatch/Entry activity to MainActivity with valid email and password
 * Otherwise start Login Activity
 *   
 * @author Jeff Yang 
 *
 */
public class EntryActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LavalifePreference pref = new LavalifePreference(getApplicationContext());
        Intent intent = new Intent(EntryActivity.this, pref.isValid() ? MainActivity.class : LoginActivity.class);
        startActivity(intent);
        finish();
    }
}
