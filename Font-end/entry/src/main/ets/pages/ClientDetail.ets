import { router, Type } from '@kit.ArkUI';
import prompt from '@ohos.promptAction';
interface Message{
  sender:string
  content:string
  time:string
}

@Entry
@Component

struct ChatInterface {
  @State inputText: string = '';
  @State messages: Message[]= [{ sender: 'patient', content: '医生您好。', time: '下午 2:00:10' },{ sender: 'patient', content: '什么时候换药？', time: '下午 2:01:42' }]; // 用于存储消息
  @State client: string[] = router.getParams().toString().split(','); // 获取传递的参数对象
  @State flag: number = 0;


  build() {
    Column() {
      // 顶部信息显示
      Row() {
        Button({type:ButtonType.Normal}){
          Image($r('app.media.left_arrow'))
            .fillColor('#ffffffff')
            .width('60%')
        }
        .borderWidth(1)
        .backgroundColor(Color.Transparent)
        .borderRadius(10)
        .margin({left:10})
        .borderColor('#fff')
        .width(40)
        .height(40)
        .onClick(()=>{
          router.back()
        })
        .layoutWeight(2)
        Row(){

          Column() {
            Text(this.client[0])
              .fontSize(18)
              .fontWeight(600)
              .fontColor('#fff');
          }
          .alignItems(HorizontalAlign.Start)
          Image($r('app.media.girl'))
            .borderRadius(54)
            .height(40)
            .width(40)
            .margin({ left: 10, right: 10 })
            .onClick(() => {
              router.pushUrl({url:'pages/PatientDetail'})
            })

        }
        .margin({left:'45%'})
        .layoutWeight(11)
      }
      .backgroundColor($r('app.color.green_app'))
      .margin({ top: 20, bottom: 20 })
      .width('100%')
      .height(80)

      // 消息显示区域
      Column() {
        ForEach( this.messages,(msg:Message)=> {
          Row() {
            if (msg.sender === 'patient') {
              // 患者消息
              Column() {
                Text(msg.time)
                  .fontSize(12)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Start);
                Text(msg.content)
                  .fontSize(18)
                  .fontColor('#ff323232')
                  .backgroundColor('#e0f7fa')
                  .borderRadius(10)
                  .padding({ top: 10, bottom: 10, left: 15, right: 15 })
                  .position({left:5,top:20})
                Text(msg.content)
                  .fontSize(18)
                  .fontColor(Color.Transparent)
                  .borderRadius(10)
                  .padding({ top: 10, bottom: 10, left: 15, right: 15 });

              }
              .width('95%')
              .margin({top:10})
            } else {
              // 医生消息
              Column() {
                Text(msg.time)
                  .fontSize(12)
                  .fontColor('#999999')
                  .textAlign(TextAlign.End)
                  .margin({bottom:5})

                  Text(msg.content)
                    .fontSize(18)
                    .fontColor(Color.Transparent)
                    .borderRadius(10)
                    .padding({ top: 10, bottom: 10, left: 15, right: 15 });
                  Text(msg.content)
                    .fontSize(18)
                    .fontColor('#ff323232')
                    .backgroundColor('#d1c4e9')
                    .borderRadius(10)
                    .position({right:5,top:20})
                    .padding({ top: 10, bottom: 10, left: 15, right: 15 });

              }
              .margin({top:10})
              // .backgroundColor(Color.Pink)
              .width('95%')
              // .position({right:10})
            }
          }
          .margin({ bottom: 10 });
        })
      }
      .flexGrow(1)
      .margin({ left: 10, right: 10 ,top:-30})
      .backgroundColor(Color.White)
      .borderRadius({topLeft:10,topRight:10})
      .width('100%')


      // 输入框和发送按钮
      Row() {
        TextInput({ text: this.inputText, placeholder: '请输入回复' })
          .onChange((value: string) => {
            this.inputText = value;
          })
          .width('70%')
          .height(40)
          .borderWidth(1)
          .borderColor('#cccccc')
          .margin({ right: 10 });

        Button('发送')
          .onClick(() => {
            if (this.inputText.trim() !== '') {
              const currentTime = new Date().toLocaleTimeString(); // 获取当前时间
              this.messages.push({ sender: 'doctor', content: this.inputText, time: currentTime });
              this.inputText = '';
              this.flag = 1;
            } else {
              prompt.showToast({
                message: '回复不能为空'
              });
            }
          })
          .width('15%')
          .height(40)
          .backgroundColor('#2a6049');
      }
      .margin({ bottom: 30 });
    }
    .width('100%')
    .height('100%');
  }
}
