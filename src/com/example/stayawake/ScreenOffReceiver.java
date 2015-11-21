package com.example.stayawake;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;


public class ScreenOffReceiver extends BroadcastReceiver 
{
    public ScreenOffReceiver() 
    {
        super();
    }

    public void onReceive(Context context, Intent intent) 
    {
        Log.e(null, "Screen off1");
        if (Intent.ACTION_SCREEN_OFF.equals(intent.getAction())) 
        {
            Log.e(null, "Screen off2");
            Intent start = new Intent(context, SoundService.class);
            start.putExtra(SoundService.ACTION, SoundService.ACTION_START);
            context.startService(start);
        }
    }
}