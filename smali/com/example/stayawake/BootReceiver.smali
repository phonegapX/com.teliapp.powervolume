.class public Lcom/example/stayawake/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 14
    const-string v1, "com.teliapp.PREFS"

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 15
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "pref_boot"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 16
    new-instance v1, Lcom/example/stayawake/BootReceiver$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/example/stayawake/BootReceiver$1;-><init>(Lcom/example/stayawake/BootReceiver;Landroid/content/SharedPreferences;Landroid/content/Context;)V

    .line 25
    invoke-virtual {v1}, Lcom/example/stayawake/BootReceiver$1;->start()V

    .line 27
    :cond_0
    return-void
.end method
