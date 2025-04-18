import { router } from '@kit.ArkUI'

@Component

export default struct DHomeContent{

  @Builder tag(tex:string,color:string,width:number){

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
  }

  progress_color(point:number):string {
    if(point<=40){
      return '#f47473'
    }
    else if(point>40 && point<=70){
      return '#fdce4c'
    }else{
      return'#2dcc70'
    }
  }

  build() {

    Column(){

      Column() {
        Row() {
          Column() {
            Image($r('app.media.doctor'))
              .borderRadius(20)
              .height(64)
              .width(64)
              .margin({left:10})
          }
          .width('20%')
          .height('100%')
          .margin({left:10})


          Column() {
            Text('医生你好,')
              .fontSize(18)
              .margin({left: 20})
              .fontColor('#ff323232')
              .alignSelf(ItemAlign.Start)

            Text('今天怎么样？')
              .fontSize(21)
              .margin({top: 10, bottom: 5, left: 20})
              .alignSelf(ItemAlign.Start)
              .fontColor($r('app.color.green_app'))
              .fontWeight(700)
          }
          .width('50%')
          .height('100%')

          Column() {
            Column() {
              Column() {
                Text('2')
                  .fontSize(20)
                  .fontColor('white')
              }
              .borderRadius('50%')
              .width(25)
              .height(25)
              .backgroundColor('#2a6049')
              .margin({left: 40, top: -10, right: -5})

              Image($r('app.media.tip'))
                .borderRadius(10)
                .height(26)
                .width(26)
                .alignSelf(ItemAlign.Center)
            }
            .width(54)
            .height(54)
            .borderRadius(20)

            .shadow({
              color: '#8f8a8888', // 阴影颜色
              radius: 25, // 阴影模糊半径
            })
          }
          .width('20%')
          .height('100%')

        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .height(90)
      .margin({top: 20, bottom:0})
      // .backgroundColor('#7affe2d3')
      .padding({top:20})

      Column() {
        Column() {
          Row() {
            Image($r('app.media.search'))
              .borderRadius(10)
              .height(32)
              .width(32)
              .alignSelf(ItemAlign.Center)
              .margin({right: 10})

            TextInput({
              placeholder: '搜索患者、健康问题'
            })
              .placeholderColor('#d28d8d8d')
              .backgroundColor(Color.Transparent)
              .borderWidth(2)
              .borderColor('#86d2d2d2')
              .margin({right: 40})
          }
          .width('80%')

        }
        .width('100%')
        .height(64)
        .margin({top: 20})

      }
      .width('100%')
      .height(60)

      Column() {
        Row() {
          Column() {
            Row(){
              Image($r('app.media.inquire'))
                .width(40)
                .margin({right:5})
              Text('今日咨询')
                .fontSize(27)
                .fontWeight(700)
                .fontColor($r('app.color.green_app'))
            }.margin({top: 40, bottom: 15})

            Text('已完成9项中的4项')
              .fontSize(18)
              .fontColor('#ff515151')
              .margin({left:15})
          }
          .layoutWeight(4)
          .height('100%')

          Column() {
            RelativeContainer() {
              Text('4')
                .fontSize(40)
                .fontWeight(FontWeight.Bold)
                .fontColor($r('app.color.green_app'))

            }
            .width(30)
            .height(30)
            .margin({top: 50, left: 0})


            // 创建一个圆形进度条
            Progress({
              value: 4, // 当前进度值
              total: 9, // 总进度值
              type: ProgressType.Ring // 设置为圆形进度条
            })
              .width(110) // 设置进度条宽度
              .height(110) // 设置进度条高度，圆形进度条的宽高应相等
              .margin({left: '0%', top: -60, bottom: 20}) // 设置外边距
              .style({strokeWidth: 6}) // 设置进度条的线宽
              .color(this.progress_color(86)) // 设置进度条颜色，颜色值根据进度动态计算
              .backgroundColor('#8f8a8888')
          }
          .layoutWeight(3)
          .height('100%')
          .margin({right:10})
        }
        .width('100%')
        .height('100%')
      }
      .width('95%')
      .height(160)
      // .borderWidth(1)
      .borderRadius(20)
      .backgroundColor('#51bac9c2')
      .margin({top:20,bottom:10})
      // .backgroundColor('#7affe2d3')

        Column(){


          Row(){
            Flex({wrap:FlexWrap.Wrap}){
              Column() {
                Image($r("app.media.patientManage"))
                  .width(54)
                  .height(54)
                  .margin({left:30, top:20, bottom:5})
                Text('患者管理')
                  .fontColor($r('app.color.green_app'))
                  .fontSize(20)
                  .fontWeight(700)
                  .margin({left:30, bottom:10})
                  .onClick(() => {
                    router.pushUrl({url:'pages/ClientManage'})
                  })
              }
              .onClick(() => {
                router.pushUrl({url:'pages/ClientManage'})
              })
              .layoutWeight(4)

              Row() {
                Column() {
                  Text('患者康复信息')
                    .fontSize(18)
                    .fontWeight(FontWeight.Medium)
                    .margin({top: 40})
                  Text('咨询回复')
                    .fontSize(18)
                    .fontWeight(FontWeight.Medium)
                    .margin({top: 10})
                }

                Image($r("app.media.right_row"))
                  .width(48)
                  .height(48)
                  .margin({top:40, left: 30})
                  .onClick(() => {
                    router.pushUrl({url:'pages/ClientManage'})
                  })
              }
              .layoutWeight(6)
              .margin({left:20})
            }
            .borderRadius(10)
            .height(130)
            .width('50%')
            .margin({left:10,right:10})
            .layoutWeight(1)
            .borderColor('#7affe2d3')
            .borderWidth(1)
            .shadow({
              color: '#4ab5b5b5', // 阴影颜色
              radius: 15, // 阴影模糊半径
            })

            .backgroundColor('#fff0e9')



            // Flex({wrap:FlexWrap.Wrap}){
            //   Column() {
            //     Image($r("app.media.free_consultation"))
            //       .width(64)
            //       .height(64)
            //       .margin({left:50, top:30, bottom:10})
            //     Text('免费咨询')
            //       .fontSize(20)
            //       .margin({left:50, bottom:10})
            //   }
            // }
            // .borderRadius(10)
            // .height(150)
            // .margin({left:10,right:10})
            // .layoutWeight(1)
            // .borderColor('#3bbacac2')
            // .borderWidth(1)
            // .shadow({
            //   color: '#3bbacac2', // 阴影颜色
            //   radius: 15, // 阴影模糊半径
            // })
            // .backgroundColor('#3bbacac2')

          }
          .width('100%')
          .margin({bottom:10})


          Row(){
            Flex({wrap:FlexWrap.Wrap}){
              Column() {
                Image($r("app.media.scheduleManage"))
                  .width(54)
                  .fillColor('#eb744c')
                  .height(54)
                Text('日程安排')
                  .fontSize(20)
                  .margin({top:10})
              }
              .padding({top:30,left:40})
            }
            .borderRadius(10)
            .height(150)
            .margin({left:10,right:10})
            .layoutWeight(1)
            .borderColor('#3bbacac2')
            .borderWidth(1)
            .shadow({
              color: '#3bbacac2', // 阴影颜色
              radius: 15, // 阴影模糊半径
            })
            // .backgroundColor('#3bbacac2')

            Flex({wrap:FlexWrap.Wrap}){
              Column() {
                Image($r("app.media.inquire_history"))
                  .width(54)
                  .height(54)

                Text('咨询历史')
                  .fontSize(20)
                  .margin({top:10})
              }
              .padding({top:30,left:45})
            }
            .borderRadius(10)
            .height(150)
            .margin({right:10})
            .layoutWeight(1)
            .borderColor('#3bbacac2')
            .borderWidth(1)
            .shadow({
              color: '#3bbacac2', // 阴影颜色
              radius: 15, // 阴影模糊半径
            })
            // .backgroundColor('#7affe2d3')

          }
          .width('100%')
          .margin({bottom:10})


        }
        .width('100%')
        .height(520)

    }
    .width('100%')
    .height('100%')
  }
}