.class public Lcom/example/stayawake/Settings;
.super Landroid/app/Activity;
.source "Settings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/stayawake/Settings$EnableClick;,
        Lcom/example/stayawake/Settings$SettingsFragment;
    }
.end annotation


# static fields
.field public static final GET_ADMIN_PERMISSION:I = 0x3039


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private showCancelDialog()V
    .locals 3

    .prologue
    .line 50
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 51
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f07000c

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 52
    const v1, 0x7f070009

    .line 53
    new-instance v2, Lcom/example/stayawake/Settings$1;

    invoke-direct {v2, p0}, Lcom/example/stayawake/Settings$1;-><init>(Lcom/example/stayawake/Settings;)V

    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 65
    const/high16 v1, 0x1040000

    .line 66
    new-instance v2, Lcom/example/stayawake/Settings$2;

    invoke-direct {v2, p0}, Lcom/example/stayawake/Settings$2;-><init>(Lcom/example/stayawake/Settings;)V

    .line 65
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 74
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 75
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 35
    const/16 v1, 0x3039

    if-ne p1, v1, :cond_0

    .line 36
    if-nez p2, :cond_1

    .line 37
    invoke-direct {p0}, Lcom/example/stayawake/Settings;->showCancelDialog()V

    .line 46
    :cond_0
    :goto_0
    return-void

    .line 38
    :cond_1
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 39
    const-string v1, "com.teliapp.PREFS"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/example/stayawake/Settings;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 40
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 41
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v1, "screen_enable"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 42
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 28
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/example/stayawake/Settings;->setContentView(I)V

    .line 30
    return-void
.end method
