import { router } from '@kit.ArkUI'
import prompt from '@ohos.promptAction';
@Entry
@Component
@Preview
struct register {
  @State account:string = ''
  @State password1:string = ''
  @State password2:string = ''
  @State isAble:boolean = false

  // 构建 -> 界面
  build() {
    Column({space: 15}){
      Stack(){
        Text('注册')
          .fontWeight(900)
          .margin({bottom:40})
          .textAlign(TextAlign.Center)
          .margin({top: 5,bottom:20})
          .width('100%')

        Button({type:ButtonType.Normal}){
          Image($r('app.media.left_arrow'))
            .fillColor('#ff696969')
            .width('60%')
        }
          .borderWidth(2)
          .backgroundColor(Color.Transparent)
          .position({x:0})
          .borderRadius(10)
          .borderColor('#28aeaeae')
          .width(40)
          .height(40)
          .onClick(()=>{
            router.back()

          })

      }
      .width('100%')
      // .backgroundColor(Color.Gray)
      Image($r('app.media.login'))
        .width(150)
      Column({space: 15}){
        Text('输入手机号注册')
          .fontColor('#d28d8d8d')
          .fontSize(15)
          .fontWeight(600)
        TextInput({
          placeholder: '请输入账号'
        })
          .placeholderColor('#d28d8d8d')
          .backgroundColor(Color.Transparent)
          .borderWidth(2)
          .borderColor('#86d2d2d2')
          .onChange((value:string)=>{
            this.account = value
            if ((this.account != '') && (this.password1 != '') && (this.password2 != '')) {
              this.isAble  = true
            }
          })
        Text('密码')
          .fontColor('#d28d8d8d')
          .fontSize(15)
          .fontWeight(600)
        TextInput({
          placeholder: '请输入密码，至少6位'
        })
          .placeholderColor('#d28d8d8d')
          .backgroundColor(Color.Transparent)
          .borderWidth(2)
          .borderColor('#86d2d2d2')
          .type(InputType.Password)
          .fontColor('#d28d8d8d')
          .onChange((value:string)=>{
            this.password1 = value
            if ((this.account != '') && (this.password1 != '') && (this.password2 != '')) {
              this.isAble  = true
            }
          })
        Text('确认密码')
          .fontColor('#d28d8d8d')
          .fontSize(15)
          .fontWeight(600)
        TextInput({
          placeholder: '请再次输入密码'
        })
          .placeholderColor('#d28d8d8d')
          .backgroundColor(Color.Transparent)
          .borderWidth(2)
          .borderColor('#86d2d2d2')
          .type(InputType.Password)
          .fontColor('#d28d8d8d')
          .onChange((value:string)=>{
            this.password2 = value
            if ((this.account != '') && (this.password1 != '') && (this.password2 != '')) {
              this.isAble  = true
            }
          })

      }
      .margin({top:20})
      .alignItems(HorizontalAlign.Start)
      Button('下一步')
        .enabled(this.isAble)
        .width('100%')
        .margin({top:30})
        .backgroundColor('#2a6049')
        .onClick(()=>{
          if(this.account == ''||this.password1 ==''|| this.password2==''){
            prompt.showToast({
              message: '账号或者密码不能为空'
            })
          }
          else if (this.password1 !== this.password2){
            prompt.showToast({
              message: '两次输入的密码不一致'
            })
          }
          else{
            router.pushUrl({
              url: 'pages/chooseSexPage',
              params:{
                account: this.account,
                password: this.password1
              }
            })
          }
        })

    }
    .padding(30)
    .width('100%')
  }
}