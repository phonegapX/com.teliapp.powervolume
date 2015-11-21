package com.example.stayawake;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;


public class ScreenOnReceiver extends BroadcastReceiver 
{
    public ScreenOnReceiver() 
    {
        super();
    }

    public void onReceive(Context context, Intent intent) 
    {
        if (Intent.ACTION_SCREEN_ON.equals(intent.getAction())) 
        {
            Intent start = new Intent(context, SoundService.class);
            start.putExtra(SoundService.ACTION, SoundService.ACTION_STOP);
            context.startService(start);
        }
    }
}
