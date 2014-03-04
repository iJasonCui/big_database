package com.lavalife.mobile.service;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class LavalifePreference {

    public static final String KEY_LOGIN = "lllogin";
    public static final String KEY_PASSWORD = "llpassword";
    private static final String APP_SHARED_PREFS = LavalifePreference.class.getSimpleName();
    private SharedPreferences _sharedPrefs;
    private Editor _prefsEditor;

    public LavalifePreference(Context context) {
        this._sharedPrefs = context.getSharedPreferences(APP_SHARED_PREFS, Activity.MODE_PRIVATE);
        this._prefsEditor = _sharedPrefs.edit();
    }

    public String getLogin() {
        return _sharedPrefs.getString(KEY_LOGIN, "");
    }

    public String getPassword() {
        return _sharedPrefs.getString(KEY_PASSWORD, "");
    }

    public void saveLogin(String login, String password) {
        _prefsEditor.putString(KEY_LOGIN, login);
        _prefsEditor.putString(KEY_PASSWORD, password);
        _prefsEditor.commit();
    }
    
    public boolean isValid() {
        return getLogin() != null && getPassword() != null && !getLogin().isEmpty() && !getPassword().isEmpty(); 
    }
}