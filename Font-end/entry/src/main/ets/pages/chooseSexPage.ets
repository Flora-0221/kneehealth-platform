import jobChoose from '../view/register/jobChoose'
import { router } from '@kit.ArkUI'

@Entry
@Component

struct chooseSexPage {
  @State check:number=0 //自定义组件中季节选择，默认0

  @State paccount:string = (router.getParams() as Record<string,string>)['account']
  @State ppassword:string = (router.getParams() as Record<string,string>)['password']

  @State weekdate:string[]=['一','二','三','四','五','六','日']
  @State isAble:boolean = false
  build() {
    Column(){
      Row(){
          Column(){
            Stack(){
              Text('你的性别')
                .margin({bottom:10})
                .width('100%')
                .fontWeight(700)
                .textAlign(TextAlign.Center)
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
            jobChoose({ischeck:$check,radionum:2,radiotext:['女','男']})
          }.margin({left:5,top:10,bottom:10}).borderRadius(7).padding(10).layoutWeight(4)
        }.width('100%')
    // Text(this.weekdate[this.check]).fontSize(30).margin({ left: 20 })
      Button('下一步')
        // .enabled(this.isAble)
        .width('90%')
        .margin({top:160})
        .backgroundColor('#2a6049')
        .onClick(()=>{
            router.pushUrl({
              url: 'pages/chooseJobPage',
              params:{
                account: this.paccount,
                password: this.ppassword,
                gender: this.check === 0? 'female' : 'male'
              }
            })

        })
    }
  }
}