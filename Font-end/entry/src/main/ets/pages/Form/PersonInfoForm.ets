import { router } from '@kit.ArkUI';
@Preview
@Component
@Entry
struct PersonInfo{
  @State message: string = '个人信息'

  build() {
    Column(){

      Stack(){
        Text('个人信息填写')
          .fontWeight(700)
          .margin({bottom:40})
          .textAlign(TextAlign.Center)
          .margin({top: 5,bottom:10})
          .width('100%')
          .fontColor(Color.White)
          .fontSize(18)

        Button({type:ButtonType.Normal}){
          Image($r('app.media.left_arrow'))
            .fillColor('#ffffffff')
            .width('60%')
        }
        .borderWidth(2)
        .backgroundColor(Color.Transparent)
        .position({x:0,y:15})
        .borderRadius(10)
        .borderColor('#28ffffff')
        .width(40)
        .height(40)
        .onClick(()=>{
          router.back()
        })

      }
      .width('100%').padding({left:20}).backgroundColor($r('app.color.green_app')).height(80)

      Column({space:25}){
        Row({space:20}){
          Text('性别').fontSize(18).fontWeight(700)
          Text('女')
          Radio({value:'female',group:'sexGroup'}).checked(true).width(20).height(20)
          Text('男')
          Radio({value:'male',group:'sexGroup'}).checked(false).width(20).height(20)
        }

        Row({space:20}){
          Text('姓名').fontSize(18).fontWeight(700)
          TextInput({
            placeholder:'请输入真实姓名'
          }).width('60%')
        }

        Row({space:20}){
          Text('住院号').fontSize(18).fontWeight(700)
          TextInput({
            placeholder:'请输入住院号'
          }).width('60%')
        }

        Row({space:20}){
          Text('手术时间').fontSize(18).fontWeight(700)
          DatePicker({start:new Date('1900-01-01'),end: new Date('')})
        }
        .height(60)
        .width('55%')
        .onAreaChange((value)=>{
          console.log('日期改变了:'+value);
        })

        Row({space:20}){
          Text('出生日期').fontSize(18).fontWeight(700)
          DatePicker({start:new Date('1900-01-01'),end: new Date('')})
        }
        .height(60)
        .width('55%')
        .onAreaChange((value)=>{
          console.log('日期改变了:'+value);
        })

        Button('提交',{type:ButtonType.Normal})
          .borderRadius(10)
          .width('97%')
          .backgroundColor($r('app.color.green_app'))
          .margin({top:20})
          .enabled(false)
      }.alignItems(HorizontalAlign.Start)
      .padding({top:50,left:20,right:20})
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('101%')
      .margin({top:-5})


    }

  }
}