package com.example.stayawake;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.support.v4.app.NotificationCompat.Builder;
import android.util.Log;
import android.app.admin.DevicePolicyManager;
import com.teliapp.powervolume.R;


public class SoundService extends Service 
{
    class WakeHandler extends Handler 
    {
        public WakeHandler(Looper looper) 
        {
            super(looper);
        }

        public void handleMessage(Message msg) 
        {
            switch (msg.what) 
            {
                case ACTION_START: 
                {
                	SoundService.this.doPlayback();
                	break;
                }
                case ACTION_STOP: 
                {
                	SoundService.this.stopPlayback();
                	break;
                }
                case ACTION_KILL: 
                {
                	SoundService.this.stopService();
                	break;
                }
                case ACTION_TURN_OFF: 
                {
                	SoundService.this.turnOffScreen();
                	break;
                }
            }
        }
    }

    public static final String ACTION = "action";
    public static final int ACTION_CREATE = -1;
    public static final int ACTION_KILL = 2;
    public static final int ACTION_START = 0;
    public static final int ACTION_STOP = 1;
    public static final int ACTION_TURN_OFF = 3;
    private Handler mHandler;
    private Looper mLooper;
    private BroadcastReceiver mScreenOff;
    private BroadcastReceiver mScreenOn;
    private MediaPlayer mp;

    public SoundService() 
    {
        super();
    }

    private void doPlayback() 
    {
        if (this.mp != null) 
        {
            try 
            {
                this.mp.release();
            }
            catch(Exception e) 
            {
            }
        }
        Log.e(null, "do playback");
        this.mp = MediaPlayer.create(((Context)this), R.raw.empty);
        this.mp.setLooping(true);
        this.mp.setWakeMode(((Context)this), android.os.PowerManager.PARTIAL_WAKE_LOCK);
        try 
        {
            this.mp.start();
        }
        catch(IllegalStateException e) 
        {
            e.printStackTrace();
        }
    }

    private void makeErrorNotification() 
    {
        Builder builder = new Builder(((Context)this));
        builder.setContentInfo("Volume Power");
        builder.setSmallIcon(R.drawable.off);
        builder.setAutoCancel(true);
        builder.setContentTitle("You must be an administrator...");
        builder.setContentText("You must be a device administrator in order to use this feature. Click here to enable.");
        Intent activateDeviceAdminIntent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
        activateDeviceAdminIntent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, new ComponentName(((Context)this), DarPolicy.class));
        activateDeviceAdminIntent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "This app needs your permission to turn off your screen");       
        builder.setContentIntent(PendingIntent.getActivity(((Context)this), 1, activateDeviceAdminIntent, 0));
        NotificationManager manager = (NotificationManager)this.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager != null) 
        {
            manager.notify(100, builder.build());
        }
    }

    private Notification makeNotification() 
    {
        Builder builder = new Builder(((Context)this));
        builder.setContentInfo("Volume Power");
        builder.setSmallIcon(R.drawable.off);
        builder.setContentTitle("Turn off screen");
        Intent turnOff = new Intent(((Context)this), SoundService.class);
        turnOff.putExtra(ACTION, ACTION_TURN_OFF);
        builder.setContentIntent(PendingIntent.getService(((Context)this), 0, turnOff, android.content.Intent.FILL_IN_CLIP_DATA));
        return builder.build();
    }

    public IBinder onBind(Intent intent) 
    {
        return null;
    }

    public void onCreate() 
    {
        super.onCreate();
        HandlerThread handlerThread = new HandlerThread("background");
        handlerThread.start();
        this.mLooper = handlerThread.getLooper();
        this.mHandler = new WakeHandler(this.mLooper);
        this.prepareReceivers();
        if (this.shouldShowNotification()) 
        {
            this.startForeground(1, this.makeNotification());
        }
    }

    public void onDestroy() 
    {
        this.mLooper.quit();
        SharedPreferences.Editor editor = this.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE).edit();
        editor.putBoolean("pref_enable", false);
        editor.commit();
    }

    public int onStartCommand(Intent intent, int flags, int startId) 
    {
        int action = ACTION_CREATE;
        if (intent != null) 
        {
        	action = intent.getIntExtra(ACTION, ACTION_CREATE);
        }
        this.mHandler.dispatchMessage(this.mHandler.obtainMessage(action));
        return android.app.Service.START_STICKY;
    }

    private void prepareReceivers() 
    {
        IntentFilter filterOn = new IntentFilter(Intent.ACTION_SCREEN_ON);
        this.mScreenOn = new ScreenOnReceiver();
        this.registerReceiver(this.mScreenOn, filterOn);
        //...
        IntentFilter filterOff = new IntentFilter(Intent.ACTION_SCREEN_OFF);
        this.mScreenOff = new ScreenOffReceiver();
        this.registerReceiver(this.mScreenOff, filterOff);
    }

    private boolean shouldShowNotification() 
    {
        return this.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE).getBoolean("pref_screen", false);
    }

    private void stopPlayback() 
    {
        try 
        {
            if (this.mp != null) 
            {
                this.mp.stop();
            }
        }
        catch (Throwable t) 
        {
            try 
            {
                if (this.mp != null) 
                {
                    this.mp.release();
                    this.mp = null;
                }
                else 
                {
                }
                t.printStackTrace();
            }
            catch (Exception e) 
            {
            }
        }
    }

    private void stopService() 
    {
        if (this.mp != null) 
        {
            this.stopPlayback();
        }
        this.stopForeground(true);
        this.unregisterReceiver(this.mScreenOff);
        this.unregisterReceiver(this.mScreenOn);
        this.stopSelf();
    }

    private void turnOffScreen() 
    {
        try 
        {
            ((DevicePolicyManager)this.getSystemService(Context.DEVICE_POLICY_SERVICE)).lockNow();
        }
        catch (SecurityException e) 
        {
            this.makeErrorNotification();
        }
    }
}
