package com.example.stayawake;

import android.app.admin.DeviceAdminReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.teliapp.powervolume.R;


public class DarPolicy extends DeviceAdminReceiver 
{
    public DarPolicy() 
    {
        super();
    }

    public CharSequence onDisableRequested(Context context, Intent intent) 
    {
        return context.getResources().getString(R.string.warning_mesg);
    }

    public void onDisabled(Context context, Intent intent) 
    {
        SharedPreferences.Editor editor = context.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE).edit();
        editor.putBoolean("screen_enable", false);
        editor.putBoolean("pref_screen", false);
        editor.commit();
    }
}
