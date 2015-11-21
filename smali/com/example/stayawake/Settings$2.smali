.class Lcom/example/stayawake/Settings$2;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/stayawake/Settings;->showCancelDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/stayawake/Settings;


# direct methods
.method constructor <init>(Lcom/example/stayawake/Settings;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/stayawake/Settings$2;->this$0:Lcom/example/stayawake/Settings;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 69
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 70
    iget-object v0, p0, Lcom/example/stayawake/Settings$2;->this$0:Lcom/example/stayawake/Settings;

    # invokes: Lcom/example/stayawake/Settings$SettingsFragment;->checkPrivileges(Landroid/app/Activity;)V
    invoke-static {v0}, Lcom/example/stayawake/Settings$SettingsFragment;->access$0(Landroid/app/Activity;)V

    .line 71
    return-void
.end method
