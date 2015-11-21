.class Lcom/example/stayawake/Settings$EnableClick;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/stayawake/Settings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EnableClick"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    iput-object p1, p0, Lcom/example/stayawake/Settings$EnableClick;->mContext:Landroid/content/Context;

    .line 188
    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 9
    .param p1, "enable"    # Landroid/preference/Preference;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 192
    iget-object v6, p0, Lcom/example/stayawake/Settings$EnableClick;->mContext:Landroid/content/Context;

    const-string v7, "com.teliapp.PREFS"

    invoke-virtual {v6, v7, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 193
    .local v2, "prefs":Landroid/content/SharedPreferences;
    const-string v6, "pref_enable"

    invoke-interface {v2, v6, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 195
    .local v1, "isEnabled":Z
    const/4 v6, 0x0

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "here "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    new-instance v3, Landroid/content/Intent;

    iget-object v6, p0, Lcom/example/stayawake/Settings$EnableClick;->mContext:Landroid/content/Context;

    const-class v7, Lcom/example/stayawake/SoundService;

    invoke-direct {v3, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 198
    .local v3, "startOrKill":Landroid/content/Intent;
    if-nez v1, :cond_0

    .line 199
    const v6, 0x7f070005

    invoke-virtual {p1, v6}, Landroid/preference/Preference;->setSummary(I)V

    .line 200
    const v6, 0x7f020002

    invoke-virtual {p1, v6}, Landroid/preference/Preference;->setIcon(I)V

    .line 201
    const-string v6, "action"

    const/4 v7, -0x1

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 208
    :goto_0
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 209
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v6, "pref_enable"

    if-eqz v1, :cond_1

    :goto_1
    invoke-interface {v0, v6, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 210
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 212
    iget-object v4, p0, Lcom/example/stayawake/Settings$EnableClick;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v3}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 214
    return v5

    .line 203
    .end local v0    # "edit":Landroid/content/SharedPreferences$Editor;
    :cond_0
    const v6, 0x7f070006

    invoke-virtual {p1, v6}, Landroid/preference/Preference;->setSummary(I)V

    .line 204
    const v6, 0x7f020001

    invoke-virtual {p1, v6}, Landroid/preference/Preference;->setIcon(I)V

    .line 205
    const-string v6, "action"

    const/4 v7, 0x2

    invoke-virtual {v3, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto :goto_0

    .restart local v0    # "edit":Landroid/content/SharedPreferences$Editor;
    :cond_1
    move v4, v5

    .line 209
    goto :goto_1
.end method
