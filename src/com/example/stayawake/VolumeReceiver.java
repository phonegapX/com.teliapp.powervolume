package com.example.stayawake;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;


public class VolumeReceiver extends BroadcastReceiver 
{
    public VolumeReceiver() 
    {
        super();
    }

    private PowerManager.WakeLock getWakeLock(Context context) 
    {
        return ((PowerManager)context.getSystemService(Context.POWER_SERVICE)).newWakeLock(android.os.PowerManager.ACQUIRE_CAUSES_WAKEUP|android.os.PowerManager.FULL_WAKE_LOCK, "lock");
    }

    private boolean isScreenOff(Context context) 
    {
    	return ((PowerManager)context.getSystemService(Context.POWER_SERVICE)).isScreenOn() ? false : true;
    }

    public void onReceive(Context context, Intent intent) 
    {
        if (this.isScreenOff(context)) 
        {
            this.getWakeLock(context).acquire(1000);
        }
    }
}
