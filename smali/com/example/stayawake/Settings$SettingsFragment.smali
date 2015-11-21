.class public Lcom/example/stayawake/Settings$SettingsFragment;
.super Landroid/preference/PreferenceFragment;
.source "Settings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/stayawake/Settings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SettingsFragment"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;
    }
.end annotation


# static fields
.field public static final PREFS:Ljava/lang/String; = "com.teliapp.PREFS"


# instance fields
.field private mCheckListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 81
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$0(Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 124
    invoke-static {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->checkPrivileges(Landroid/app/Activity;)V

    return-void
.end method

.method private static checkPrivileges(Landroid/app/Activity;)V
    .locals 5
    .param p0, "context"    # Landroid/app/Activity;

    .prologue
    .line 125
    const-string v3, "device_policy"

    invoke-virtual {p0, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/admin/DevicePolicyManager;

    .line 127
    .local v2, "policy":Landroid/app/admin/DevicePolicyManager;
    new-instance v1, Landroid/content/ComponentName;

    const-class v3, Lcom/example/stayawake/DarPolicy;

    invoke-direct {v1, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 128
    .local v1, "admin":Landroid/content/ComponentName;
    invoke-virtual {v2, v1}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 130
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 133
    .local v0, "activateDeviceAdminIntent":Landroid/content/Intent;
    const-string v3, "android.app.extra.DEVICE_ADMIN"

    .line 132
    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 137
    const-string v3, "android.app.extra.ADD_EXPLANATION"

    const-string v4, "This app needs your permission to turn off your screen"

    .line 136
    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    const/16 v3, 0x3039

    invoke-virtual {p0, v0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 141
    .end local v0    # "activateDeviceAdminIntent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method private prepare()V
    .locals 6

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    .line 107
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "pref_enable"

    const/4 v5, 0x0

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 108
    .local v1, "isEnabled":Z
    const-string v4, "pref_enable"

    invoke-virtual {p0, v4}, Lcom/example/stayawake/Settings$SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 109
    .local v0, "enable":Landroid/preference/Preference;
    if-eqz v1, :cond_0

    .line 110
    const v4, 0x7f070005

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setSummary(I)V

    .line 111
    const v4, 0x7f020002

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setIcon(I)V

    .line 112
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/example/stayawake/SoundService;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 113
    .local v3, "start":Landroid/content/Intent;
    const-string v4, "action"

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 114
    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 119
    .end local v3    # "start":Landroid/content/Intent;
    :goto_0
    new-instance v4, Lcom/example/stayawake/Settings$EnableClick;

    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/example/stayawake/Settings$EnableClick;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 120
    return-void

    .line 116
    :cond_0
    const v4, 0x7f070006

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setSummary(I)V

    .line 117
    const v4, 0x7f020001

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setIcon(I)V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 85
    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v0

    const-string v1, "com.teliapp.PREFS"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceManager;->setSharedPreferencesName(Ljava/lang/String;)V

    .line 86
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/example/stayawake/Settings$SettingsFragment;->addPreferencesFromResource(I)V

    .line 87
    new-instance v0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;

    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;-><init>(Lcom/example/stayawake/Settings$SettingsFragment;Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/example/stayawake/Settings$SettingsFragment;->mCheckListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 88
    invoke-direct {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->prepare()V

    .line 89
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 99
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onPause()V

    .line 100
    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 101
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 102
    iget-object v1, p0, Lcom/example/stayawake/Settings$SettingsFragment;->mCheckListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 103
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 92
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 93
    invoke-virtual {p0}, Lcom/example/stayawake/Settings$SettingsFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 95
    iget-object v1, p0, Lcom/example/stayawake/Settings$SettingsFragment;->mCheckListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 96
    return-void
.end method
