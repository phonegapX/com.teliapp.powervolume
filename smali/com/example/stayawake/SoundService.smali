.class public Lcom/example/stayawake/SoundService;
.super Landroid/app/Service;
.source "SoundService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/stayawake/SoundService$WakeHandler;
    }
.end annotation


# static fields
.field public static final ACTION:Ljava/lang/String; = "action"

.field public static final ACTION_CREATE:I = -0x1

.field public static final ACTION_KILL:I = 0x2

.field public static final ACTION_START:I = 0x0

.field public static final ACTION_STOP:I = 0x1

.field public static final ACTION_TURN_OFF:I = 0x3


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mLooper:Landroid/os/Looper;

.field private mScreenOff:Landroid/content/BroadcastReceiver;

.field private mScreenOn:Landroid/content/BroadcastReceiver;

.field private mp:Landroid/media/MediaPlayer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/example/stayawake/SoundService;)V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->doPlayback()V

    return-void
.end method

.method static synthetic access$1(Lcom/example/stayawake/SoundService;)V
    .locals 0

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->stopPlayback()V

    return-void
.end method

.method static synthetic access$2(Lcom/example/stayawake/SoundService;)V
    .locals 0

    .prologue
    .line 210
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->turnOffScreen()V

    return-void
.end method

.method static synthetic access$3(Lcom/example/stayawake/SoundService;)V
    .locals 0

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->stopService()V

    return-void
.end method

.method private doPlayback()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 121
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 123
    :try_start_0
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 129
    :cond_0
    :goto_0
    const/4 v1, 0x0

    const-string v2, "do playback"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    const/high16 v1, 0x7f050000

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    iput-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    .line 131
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1, v3}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 132
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p0, v3}, Landroid/media/MediaPlayer;->setWakeMode(Landroid/content/Context;I)V

    .line 134
    :try_start_1
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    .line 138
    :goto_1
    return-void

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_1

    .line 124
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private makeErrorNotification()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 184
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v1, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 185
    .local v1, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const-string v3, "Volume Power"

    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 186
    const v3, 0x7f020001

    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 187
    invoke-virtual {v1, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 188
    const-string v3, "You must be an administrator..."

    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 189
    const-string v3, "You must be a device administrator in order to use this feature. Click here to enable."

    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 191
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 194
    .local v0, "activateDeviceAdminIntent":Landroid/content/Intent;
    const-string v3, "android.app.extra.DEVICE_ADMIN"

    .line 195
    new-instance v4, Landroid/content/ComponentName;

    const-class v5, Lcom/example/stayawake/DarPolicy;

    invoke-direct {v4, p0, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 193
    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 198
    const-string v3, "android.app.extra.ADD_EXPLANATION"

    const-string v4, "This app needs your permission to turn off your screen"

    .line 197
    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 202
    const/4 v3, 0x0

    .line 199
    invoke-static {p0, v6, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 203
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lcom/example/stayawake/SoundService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    .line 204
    .local v2, "manager":Landroid/app/NotificationManager;
    if-eqz v2, :cond_0

    .line 205
    const/16 v3, 0x64

    invoke-virtual {v1}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 207
    :cond_0
    return-void
.end method

.method private makeNotification()Landroid/app/Notification;
    .locals 4

    .prologue
    .line 169
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v0, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 170
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const-string v2, "Volume Power"

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 171
    const v2, 0x7f020001

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 172
    const-string v2, "Turn off screen"

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 173
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/example/stayawake/SoundService;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 174
    .local v1, "turnOff":Landroid/content/Intent;
    const-string v2, "action"

    const/4 v3, 0x3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 176
    const/4 v2, 0x0

    .line 178
    const/high16 v3, 0x10000000

    .line 175
    invoke-static {p0, v2, v1, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 180
    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    return-object v2
.end method

.method private prepareReceivers()V
    .locals 3

    .prologue
    .line 87
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 88
    .local v1, "filterOn":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 89
    new-instance v2, Lcom/example/stayawake/ScreenOnReceiver;

    invoke-direct {v2}, Lcom/example/stayawake/ScreenOnReceiver;-><init>()V

    iput-object v2, p0, Lcom/example/stayawake/SoundService;->mScreenOn:Landroid/content/BroadcastReceiver;

    .line 90
    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mScreenOn:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/example/stayawake/SoundService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 92
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 93
    .local v0, "filterOff":Landroid/content/IntentFilter;
    new-instance v2, Lcom/example/stayawake/ScreenOffReceiver;

    invoke-direct {v2}, Lcom/example/stayawake/ScreenOffReceiver;-><init>()V

    iput-object v2, p0, Lcom/example/stayawake/SoundService;->mScreenOff:Landroid/content/BroadcastReceiver;

    .line 94
    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 95
    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mScreenOff:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v0}, Lcom/example/stayawake/SoundService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 96
    return-void
.end method

.method private shouldShowNotification()Z
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 221
    const-string v1, "com.teliapp.PREFS"

    invoke-virtual {p0, v1, v2}, Lcom/example/stayawake/SoundService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 222
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "pref_screen"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method private stopPlayback()V
    .locals 3

    .prologue
    .line 142
    :try_start_0
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 143
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_1

    .line 149
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 150
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 156
    :cond_1
    :goto_0
    return-void

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    :try_start_3
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_1

    .line 149
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    .line 150
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 152
    :catch_1
    move-exception v1

    goto :goto_0

    .line 146
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    .line 148
    :try_start_4
    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    if-eqz v2, :cond_2

    .line 149
    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->release()V

    .line 150
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 155
    :cond_2
    :goto_1
    throw v1

    .line 152
    :catch_2
    move-exception v1

    goto :goto_0

    :catch_3
    move-exception v2

    goto :goto_1
.end method

.method private stopService()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/example/stayawake/SoundService;->mp:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 160
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->stopPlayback()V

    .line 162
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/example/stayawake/SoundService;->stopForeground(Z)V

    .line 163
    iget-object v0, p0, Lcom/example/stayawake/SoundService;->mScreenOff:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/example/stayawake/SoundService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 164
    iget-object v0, p0, Lcom/example/stayawake/SoundService;->mScreenOn:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/example/stayawake/SoundService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 165
    invoke-virtual {p0}, Lcom/example/stayawake/SoundService;->stopSelf()V

    .line 166
    return-void
.end method

.method private turnOffScreen()V
    .locals 3

    .prologue
    .line 212
    :try_start_0
    const-string v2, "device_policy"

    invoke-virtual {p0, v2}, Lcom/example/stayawake/SoundService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/admin/DevicePolicyManager;

    .line 213
    .local v0, "dpm":Landroid/app/admin/DevicePolicyManager;
    invoke-virtual {v0}, Landroid/app/admin/DevicePolicyManager;->lockNow()V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    .end local v0    # "dpm":Landroid/app/admin/DevicePolicyManager;
    :goto_0
    return-void

    .line 214
    :catch_0
    move-exception v1

    .line 215
    .local v1, "e":Ljava/lang/SecurityException;
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->makeErrorNotification()V

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 31
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 75
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 76
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "background"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 77
    .local v0, "back":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 78
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/example/stayawake/SoundService;->mLooper:Landroid/os/Looper;

    .line 79
    new-instance v1, Lcom/example/stayawake/SoundService$WakeHandler;

    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mLooper:Landroid/os/Looper;

    invoke-direct {v1, p0, v2}, Lcom/example/stayawake/SoundService$WakeHandler;-><init>(Lcom/example/stayawake/SoundService;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/example/stayawake/SoundService;->mHandler:Landroid/os/Handler;

    .line 80
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->prepareReceivers()V

    .line 81
    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->shouldShowNotification()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    const/4 v1, 0x1

    invoke-direct {p0}, Lcom/example/stayawake/SoundService;->makeNotification()Landroid/app/Notification;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/example/stayawake/SoundService;->startForeground(ILandroid/app/Notification;)V

    .line 84
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 113
    iget-object v1, p0, Lcom/example/stayawake/SoundService;->mLooper:Landroid/os/Looper;

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    .line 114
    const-string v1, "com.teliapp.PREFS"

    invoke-virtual {p0, v1, v2}, Lcom/example/stayawake/SoundService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 115
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v1, "pref_enable"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 116
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 117
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 100
    const/4 v0, -0x1

    .line 101
    .local v0, "action":I
    if-eqz p1, :cond_0

    .line 102
    const-string v2, "action"

    const/4 v3, -0x1

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 105
    :cond_0
    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 106
    .local v1, "msg":Landroid/os/Message;
    iget-object v2, p0, Lcom/example/stayawake/SoundService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->dispatchMessage(Landroid/os/Message;)V

    .line 107
    const/4 v2, 0x1

    return v2
.end method
