.class Lcom/example/stayawake/SoundService$WakeHandler;
.super Landroid/os/Handler;
.source "SoundService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/stayawake/SoundService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WakeHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/stayawake/SoundService;


# direct methods
.method public constructor <init>(Lcom/example/stayawake/SoundService;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/example/stayawake/SoundService$WakeHandler;->this$0:Lcom/example/stayawake/SoundService;

    .line 51
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 52
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 56
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 70
    :goto_0
    return-void

    .line 58
    :pswitch_0
    iget-object v0, p0, Lcom/example/stayawake/SoundService$WakeHandler;->this$0:Lcom/example/stayawake/SoundService;

    # invokes: Lcom/example/stayawake/SoundService;->doPlayback()V
    invoke-static {v0}, Lcom/example/stayawake/SoundService;->access$0(Lcom/example/stayawake/SoundService;)V

    goto :goto_0

    .line 61
    :pswitch_1
    iget-object v0, p0, Lcom/example/stayawake/SoundService$WakeHandler;->this$0:Lcom/example/stayawake/SoundService;

    # invokes: Lcom/example/stayawake/SoundService;->stopPlayback()V
    invoke-static {v0}, Lcom/example/stayawake/SoundService;->access$1(Lcom/example/stayawake/SoundService;)V

    goto :goto_0

    .line 64
    :pswitch_2
    iget-object v0, p0, Lcom/example/stayawake/SoundService$WakeHandler;->this$0:Lcom/example/stayawake/SoundService;

    # invokes: Lcom/example/stayawake/SoundService;->turnOffScreen()V
    invoke-static {v0}, Lcom/example/stayawake/SoundService;->access$2(Lcom/example/stayawake/SoundService;)V

    goto :goto_0

    .line 67
    :pswitch_3
    iget-object v0, p0, Lcom/example/stayawake/SoundService$WakeHandler;->this$0:Lcom/example/stayawake/SoundService;

    # invokes: Lcom/example/stayawake/SoundService;->stopService()V
    invoke-static {v0}, Lcom/example/stayawake/SoundService;->access$3(Lcom/example/stayawake/SoundService;)V

    goto :goto_0

    .line 56
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method
