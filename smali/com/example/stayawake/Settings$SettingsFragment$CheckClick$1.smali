.class Lcom/example/stayawake/Settings$SettingsFragment$CheckClick$1;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;->showDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;


# direct methods
.method constructor <init>(Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/stayawake/Settings$SettingsFragment$CheckClick$1;->this$2:Lcom/example/stayawake/Settings$SettingsFragment$CheckClick;

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    .line 155
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 156
    return-void
.end method
