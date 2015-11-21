.class Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/stayawake/Settings$SettingsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CheckClick"
.end annotation


# instance fields
.field private mContext:Landroid/app/Activity;

.field final synthetic this$1:Lcom/example/stayawake/Settings$SettingsFragment;


# direct methods
.method public constructor <init>(Lcom/example/stayawake/Settings$SettingsFragment;Landroid/app/Activity;)V
    .locals 0
    .param p2, "context"    # Landroid/app/Activity;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->this$1:Lcom/example/stayawake/Settings$SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    iput-object p2, p0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->mContext:Landroid/app/Activity;

    .line 146
    return-void
.end method

.method private showDialog(I)V
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 149
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->mContext:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 150
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 151
    const v1, 0x7f070009

    .line 152
    new-instance v2, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick$1;

    invoke-direct {v2, p0}, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick$1;-><init>(Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;)V

    .line 151
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 158
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 159
    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 5
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 163
    invoke-interface {p1, p2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 164
    .local v0, "isEnabled":Z
    const-string v2, "pref_screen"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 165
    if-eqz v0, :cond_2

    .line 166
    const-string v2, "screen_enable"

    invoke-interface {p1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 167
    iget-object v2, p0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->mContext:Landroid/app/Activity;

    # invokes: Lcom/example/stayawake/Settings$SettingsFragment;->checkPrivileges(Landroid/app/Activity;)V
    invoke-static {v2}, Lcom/example/stayawake/Settings$SettingsFragment;->access$0(Landroid/app/Activity;)V

    .line 169
    :cond_0
    const v2, 0x7f07000a

    invoke-direct {p0, v2}, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->showDialog(I)V

    .line 178
    :cond_1
    :goto_0
    return-void

    .line 171
    :cond_2
    const v2, 0x7f07000b

    invoke-direct {p0, v2}, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->showDialog(I)V

    goto :goto_0

    .line 173
    :cond_3
    const-string v2, "screen_enable"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    .line 174
    iget-object v2, p0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->this$1:Lcom/example/stayawake/Settings$SettingsFragment;

    const-string v3, "pref_screen"

    invoke-virtual {v2, v3}, Lcom/example/stayawake/Settings$SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    .line 175
    .local v1, "screen":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v1, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0
.end method
