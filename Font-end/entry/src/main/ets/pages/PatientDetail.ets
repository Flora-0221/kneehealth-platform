import { router } from '@kit.ArkUI'
import lineChart from '../view/dataContent/lineChart'
import piChart from '../view/dataContent/piChart'


@Component
@Preview
@Entry

export default struct PatientDetail{

  @Builder descriptionBuilder(tex:string,color:string,size:number) {
    Text(tex)
      .fontSize(size)
        // .minFontSize("10.0vp")
      .fontColor(color)
      .fontWeight(FontWeight.Medium)
      .width('100%')
      .height("100%")
      .textAlign(TextAlign.Center)

  }

  @Builder tag(tex:string,color:string,width:number,m_left:number,m_right:number,m_top:number,m_bottom:number){

    Column(){
      Text(tex)
        .fontColor('#fff7fffa')
        .fontSize(14)

    }
    .borderRadius(10)
    .backgroundColor(color)
    .height(20)
    .width(width)
    .justifyContent(FlexAlign.Center)
    .margin({left:m_left,right:m_right,top:m_top,bottom:m_bottom})
  }

  build() {
    Column(){
      Column(){
        Stack(){
          Image($r('app.media.Pattern'))
          Text('患者档案')
            .fontWeight(900)
            .margin({bottom:20})
            .textAlign(TextAlign.Center)
            .margin({top: 5,bottom:20})
            .width('100%')
            .fontColor(Color.White)
            .position({y:0})

          Button({type:ButtonType.Normal}){
            Image($r('app.media.left_arrow'))
              .fillColor('#ffffffff')
              .width('60%')
          }
          .borderWidth(2)
          .backgroundColor(Color.Transparent)
          .position({x:0})
          .borderRadius(10)
          .borderColor('#28ffffff')
          .width(40)
          .height(40)
          .onClick(()=>{
            router.back()

          })

        }
        .width('100%')
        .padding({top:30,left:20})

      }
      .width('100%')
      .height('35%')
      .backgroundColor('#2a6049')
      .borderRadius({bottomRight:60})

      Scroll(){
        Column(){

          Image($r('app.media.girl')).width(100).borderRadius(50).margin({bottom:-60}).zIndex(10)
            // .position({top:-10,left:'35%'}).zIndex(10)
          Column({space:10}){
            Row(){
              Column(){
                Row(){
                  // Image($r('app.media.personal'))
                  //   .width(17)
                  //   .fillColor($r('app.color.green_app'))
                  //   .margin({right:5})
                  Text('姓名：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('小丽')
                    .fontWeight(500)
                    .fontSize(18)
                }.margin({bottom:5})

                Row(){

                  Text('邮箱：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('123@qq.com')
                    .fontWeight(500)
                    .fontSize(15)
                }.margin({bottom:5})

                Row(){

                  Text('性别：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('女')
                    .fontWeight(500)
                    .fontSize(17)
                }.margin({bottom:5})

                Row(){
                  Text('年龄：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('34')
                    .fontWeight(500)
                    .fontSize(17)
                }.margin({bottom:5})

                Row(){
                  Text('备注：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('怀孕')
                    .fontWeight(500)
                    .fontSize(17)
                }.margin({bottom:5})


              }
              .alignItems(HorizontalAlign.Start)
              // .width('50%')
              // .backgroundColor(Color.Pink)
              // .layoutWeight(1)
              .margin({right:20})
              Column(){
                Row(){
                  Text('手术日期：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('2021-3-12')
                    .fontWeight(500)
                    .fontSize(16)
                }.margin({bottom:5})
                Row(){
                  Text('地址：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('广东省广州市')
                    .fontWeight(500)
                    .fontSize(16)
                }.margin({bottom:5})
                Row(){
                  Text('工作：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('程序员')
                    .fontWeight(500)
                    .fontSize(16)
                }.margin({bottom:5})
                Row(){
                  Text('状况：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('正常')
                    .fontWeight(500)
                    .fontSize(16)
                }.margin({bottom:5})
                Row(){
                  Text('民族：')
                    .fontWeight(500)
                    .fontColor('#ff4c4c4c')
                  Text('汉族')
                    .fontWeight(500)
                    .fontSize(16)
                }.margin({bottom:5})

              }
              // .layoutWeight(1)
              // .backgroundColor(Color.Pink)
              .alignItems(HorizontalAlign.Start)
              .justifyContent(FlexAlign.Start)
            }
            .width('95%')

          }
          .justifyContent(FlexAlign.Center)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .width('96%')
          .height(220)
          .shadow(1)
          .padding({top:30})
          // .margin({top:-170})

          Scroll(){

            Row({space:35}){
              Row(){
                Image($r('app.media.eggs'))
                  .width(30)
                  .margin({right:10})
                Column({space:5}){
                  Text('肿胀程度')
                    .fontSize(12)
                    .fontWeight(500)
                    .fontColor('#ff6d6d6d')
                  Row({space:5}){
                    Text('2')
                      .fontSize(20)
                      .fontWeight(700)
                    Text('/0 厘米')
                      .fontSize(13)
                      .fontColor('#ff6d6d6d')
                  }

                }
                .alignItems(HorizontalAlign.Start)
              }
              Row(){
                Image($r('app.media.run'))
                  .width(30)
                  .margin({right:10})
                Column({space:5}){
                  Text('步态评分')
                    .fontSize(12)
                    .fontWeight(500)
                    .fontColor('#ff6d6d6d')
                  Row({space:5}){
                    Text('80')
                      .fontSize(20)
                      .fontWeight(700)
                    Text('/100 分')
                      .fontSize(13)
                      .fontColor('#ff6d6d6d')
                  }
                }
                .alignItems(HorizontalAlign.Start)
              }
              Row(){
                Image($r('app.media.knee_yellow'))
                  .width(30)
                  .margin({right:10})
                Column({space:5}){
                  Text('膝关节活动范围(ROM)')
                    .fontSize(12)
                    .fontWeight(500)
                    .fontColor('#ff6d6d6d')
                  Row({space:5}){
                    Text('100')
                      .fontSize(20)
                      .fontWeight(700)
                    Text('/180 度')
                      .fontSize(13)
                      .fontColor('#ff6d6d6d')
                  }
                }
                .alignItems(HorizontalAlign.Start)
              }
            }
            .padding({left:10,right:10})
          }
          .width('96%')
          .height(90)
          .margin({top:10})
          .scrollable(ScrollDirection.Horizontal)
          .scrollBarColor(Color.Transparent)
          .backgroundColor(Color.White)
          .borderWidth(1)
          .borderRadius(10)
          .borderColor('#7ec4c4c4')

          Row({space:5}){
            Column({space:5}){
              //问卷
              Column(){
                Row({space:5}){
                  Image($r('app.media.question')).width(40)
                  Text('问卷评估').fontSize(15).fontWeight(600)
                  // .margin({left:15,top:5})
                }.margin({left:-6})

                Row({space:5}){
                  Text('8.6').fontSize(20).fontWeight(700)
                  Text('/10.0分').fontSize(12).fontColor('#ff8a8888').margin({right:10})
                  this.tag('良好','#fdce4c',45,0,0,0,0)
                }.margin({top:5,bottom:15})

                this.tag('☺️评估良好，继续保持', '#8f8a8888',160,-7,0,0,0)
              }
              .height(130)
              .alignItems(HorizontalAlign.Start)
              .backgroundColor(Color.White)
              .borderRadius({topLeft:10,topRight:10})
              .width('50%')
              .shadow(1)
              .padding({top:10,left:15})
              //问卷按钮
              Column(){
                Button('查看问卷结果',{type:ButtonType.Normal})
                  .width('100%')
                  .borderRadius({bottomLeft:10,bottomRight:10})
                  .backgroundColor($r('app.color.blue_default'))
                  .onClick(()=>{
                    router.pushUrl({url:'pages/FormPage'})
                  })

              }
              .height(55)
              .width('50%')
            }
            .margin({top:10})


            //医生建议
            Column(){
              Text('医生建议:').fontSize(15).fontWeight(600).margin({left:15,top:5})

              Stack(){
                Image($r('app.media.doctor_girl'))
                  .width(150)
                  .position({y:16,x:7})
                Row({space:5}){

                  Text('建议不要过度运动，适当进行按摩，定期复诊').fontSize(15).fontColor('#ff8f8d8d').fontWeight(700)
                }.margin({left:12}).position({y:25,x:7}).width(145)
              }

            }
            .height(176)
            .alignItems(HorizontalAlign.Start)
            .backgroundColor(Color.White)
            .borderRadius(10)
            .width('48%')
            .shadow(1)
            .padding({top:10})
          }
          .justifyContent(FlexAlign.Start)
          .width('96%')
          .height(200)

          Row({space:5}){
            //饼图-肌群受力等
            Column(){
              Row({space:10}){
                Text('肌群受力').fontSize(15).fontWeight(600)
                this.tag('正常','#fdce4c',45,0,0,0,0)
              }.margin({left:15,top:5})
              piChart().height('100%').width('100%').margin({top:-15})
              // Row({space:5}){
              //   // Text('5.0').fontSize(20).fontWeight(700)
              //   // Text('mmol/L').fontSize(12).fontColor('#ff8a8888')
              //   this.tag('受力均衡，姿态正确','#bcbcbc',130,0,0,0,0)
              // }.margin({left:15,top:-35})
              Text('8/20').fontSize(12).fontWeight(600).fontColor('#bcbcbc').margin({top:-35,left:15})


            }
            .height(190)
            .alignItems(HorizontalAlign.Start)
            .backgroundColor(Color.White)
            .borderRadius(10)
            .width('50%')
            .shadow(1)
            .padding({top:10})

            Column({space:5}){
              //呼吸频率值
              Stack(){
                Image($r('app.media.bac_green')).borderRadius(10)
                Text('呼吸频率')
                  .fontColor(Color.White)
                  .position({x:15,y:15})
                  .fontWeight(600)
                  .fontSize(15)
                Image($r('app.media.breath'))
                  .width(20)
                  .position({x:'75%',y:15})
                Text('15')
                  .fontColor(Color.White)
                  .position({x:15,y:40})
                  .fontWeight(700)
                  .fontSize(23)
                Text('次/分钟')
                  .fontColor(Color.White)
                  .position({x:15,y:67})
                  .fontWeight(500)
                  .fontSize(10)
              }
              .width('100%')
              .height(90)


              // 体重
              Stack(){
                Image($r('app.media.bac_orange')).borderRadius(10)
                Text('下肢足底压力')
                  .fontColor(Color.White)
                  .position({x:15,y:15})
                  .fontWeight(600)
                  .fontSize(15)
                Image($r('app.media.weight'))
                  .width(20)
                  .position({x:'75%',y:15})
                Text('300')
                  .fontColor(Color.White)
                  .position({x:15,y:40})
                  .fontWeight(700)
                  .fontSize(23)
                Text('200-400kPa')
                  .fontColor(Color.White)
                  .position({x:15,y:67})
                  .fontWeight(500)
                  .fontSize(10)
              }
              .width('100%')
              .height(90)
            }
            .height(180)
            .alignItems(HorizontalAlign.Start)
            .width('48%')
          }
          .justifyContent(FlexAlign.Start)
          .width('96%')
          .height(200)





          //折线图-心率
          Column(){
            lineChart().height('100%').width('100%')
          }

          .height(200)
          .justifyContent(FlexAlign.Center)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .width('96%')
          .shadow(1)
          .padding(5)


        }
        .height(1000)
        // .backgroundColor(Color.Gray)

      }
      .height(650)
      .margin({top:-150})
      .width('100%')
      // .backgroundColor(Color.Pink)




    }
    .backgroundColor('#52dedede')
    .width('100%')
    .height('100%')



  }
}