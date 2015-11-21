package com.example.stayawake;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;


public class BootReceiver extends BroadcastReceiver 
{
    public BootReceiver() 
    {
        super();
    }

    public void onReceive(Context context1, Intent intent) 
    {
        final Context context = context1;
        final SharedPreferences prefs = context.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE);
        if (prefs.getBoolean("pref_boot", false)) 
        {
            new Thread() {
                public void run() 
                {
                    SharedPreferences.Editor editor = prefs.edit();
                    editor.putBoolean("pref_enable", true);
                    editor.commit();
                    Intent start = new Intent(context, SoundService.class);
                    start.putExtra(SoundService.ACTION, SoundService.ACTION_CREATE);
                    context.startService(start);
                }
            }.start();
        }
    }
}
