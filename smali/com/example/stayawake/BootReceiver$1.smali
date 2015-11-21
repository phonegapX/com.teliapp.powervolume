.class Lcom/example/stayawake/BootReceiver$1;
.super Ljava/lang/Thread;
.source "BootReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/stayawake/BootReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/stayawake/BootReceiver;

.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$prefs:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Lcom/example/stayawake/BootReceiver;Landroid/content/SharedPreferences;Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/stayawake/BootReceiver$1;->this$0:Lcom/example/stayawake/BootReceiver;

    iput-object p2, p0, Lcom/example/stayawake/BootReceiver$1;->val$prefs:Landroid/content/SharedPreferences;

    iput-object p3, p0, Lcom/example/stayawake/BootReceiver$1;->val$context:Landroid/content/Context;

    .line 16
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 18
    iget-object v2, p0, Lcom/example/stayawake/BootReceiver$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 19
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string v2, "pref_enable"

    const/4 v3, 0x1

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 20
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 21
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/example/stayawake/BootReceiver$1;->val$context:Landroid/content/Context;

    const-class v3, Lcom/example/stayawake/SoundService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .local v1, "start":Landroid/content/Intent;
    const-string v2, "action"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 23
    iget-object v2, p0, Lcom/example/stayawake/BootReceiver$1;->val$context:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 24
    return-void
.end method
