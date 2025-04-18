@Preview
@CustomDialog

export default struct UserPrivacyDialog {
  controller: CustomDialogController = new CustomDialogController({builder:''})
  cancel: Function = ()=> {}
  confirm: Function = ()=> {}
  build() {
    Column({space:10}){
      Text($r('app.string.welcome_title'))
        .fontSize(20)
        .fontWeight(700)
        .margin({top:18,bottom:5})

      Text(){
        Span($r('app.string.Span_one'))
      }
      Text(){
        Span($r('app.string.Span_two1'))
        Span($r('app.string.Span_personal_privacy'))
          .fontColor('#85dd77')
        Span($r('app.string.Span_two2'))
        Span($r('app.string.Span_user_protocol'))
          .fontColor('#85dd77')
        Span($r('app.string.Span_two3'))
      }
      Text(){
        Span($r('app.string.Span_three'))
      }
      Button('同意')
        .fontColor(Color.White)
        .backgroundColor('#ff06ae27')
        .width(150)
        .onClick(()=>{
          this.confirm()
          this.controller.close()
        })

      Button('不同意')
        .fontColor('#d09d9d9d')
        .backgroundColor('#412ef550')
        .width(150)
        .onClick(()=>{
          this.cancel()
          this.controller.close()
        })

    }
    .width('80%')
    .height('75%')
  }
}