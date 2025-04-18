
import { router } from '@kit.ArkUI';

@Preview
@Component
@Entry
struct PROMIS{
  @State message: string = 'PROMIS评分'

  @Builder Header(head:string){
    Text(head).fontSize(17).fontWeight(700)
  }
  @Builder radio(group:string, value:string,checked:boolean,tex:string){
    Radio({value:value,group:group}).checked(checked).width(20).height(20)
    Text(tex)
  }
  @Builder selectList(addList: SelectOption[],name:string){
    Column({space:10}){
      // Text(name).fontSize(17)
      Select(addList).width('90%').selected(0).value(name).fontColor('#ff707070')
    }.width('100%').padding(10).alignItems(HorizontalAlign.Start)


  }
  build() {
    Column(){
      Stack(){
        Text('PROMIS 评分')
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
      Scroll() {
        Column({ space: 20 }) {


          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('1. 总体而言，您认为您的健康状况如何')

            Row({ space: 10 }) {
              this.radio('P_Health_state', '5', true, '极好')
              this.radio('P_Health_state', '4', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('P_Health_state', '3', false, '好')
              this.radio('P_Health_state', '2', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {

              this.radio('Health_state', '1', false, '差')

            }.width('100%').padding(10)

          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('2. 总体来说，您觉得您的生活质量如何')

            Row({ space: 10 }) {
              this.radio('living_quality', '5', true, '极好')
              this.radio('living_quality', '4', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('living_quality', '3', false, '好')
              this.radio('living_quality', '2', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('living_quality', '1', false, '差')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('3. 总体来说，您觉得您的身体状况如何')

            Row({ space: 10 }) {
              this.radio('body_quality', '5', true, '极好')
              this.radio('body_quality', '4', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('body_quality', '3', false, '好')
              this.radio('body_quality', '2', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('body_quality', '1', false, '差')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('4. 总体来说，您觉得您的心理健康状况如何(包括情绪、思考能力等)')

            Row({ space: 10 }) {
              this.radio('pycho_quality', '5', true, '极好')
              this.radio('pycho_quality', '4', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('pycho_quality', '3', false, '好')
              this.radio('pycho_quality', '2', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('pycho_quality', '1', false, '差')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('5. 总体来说，您对您的社交活动以及亲友关系满意程度怎么样')

            Row({ space: 10 }) {
              this.radio('mycd_activity', '5', true, '极好')
              this.radio('mycd_activity', '4', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('mycd_activity', '3', false, '好')
              this.radio('mycd_activity', '2', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('mycd_activity', '1', false, '差')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('6. 总体来说，您对您开展日常社交活动以及履行社会关系角色如何评价' +
              '(包括在家中或工作中作为父母、儿女、配偶、员工或是朋友等角色所进行的相关活动)')

            Row({ space: 10 }) {
              this.radio('social_activity', '5', true, '极好')
              this.radio('social_activity', '4', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('social_activity', '3', false, '好')
              this.radio('social_activity', '2', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('social_activity', '1', false, '差')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('7. 您的日常的体力活动如行走、爬楼梯、买菜或搬椅子等活动能否正常开展:')

            Row({ space: 10 }) {
              this.radio('energy_activity', '5', true, '完全可以')
              this.radio('energy_activity', '4', false, '大部分可以')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('energy_activity', '3', false, '部分可以')
              this.radio('energy_activity', '2', false, '少部分可以')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('energy_activity', '1', false, '完全不能')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('8. 您有多经常受自己的情绪(如焦虑、抑郁或易怒等)所影响?')

            Row({ space: 10 }) {
              this.radio('feeling_be_influence', '5', true, '从不')
              this.radio('feeling_be_influence', '4', false, '极少')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_be_influence', '3', false, '偶尔')
              this.radio('feeling_be_influence', '2', false, '经常')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('feeling_be_influence', '1', false, '总是')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('9. 您是否感觉疲惫?')

            Row({ space: 10 }) {
              this.radio('feeling_tire', '5', true, '不觉得')
              this.radio('feeling_tire', '4', false, '轻度')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_tire', '3', false, '中度')
              this.radio('feeling_tire', '2', false, '重度')
            }.width('100%').padding(10)

            Row({ space: 10 }) {
              this.radio('feeling_tire', '1', false, '极重度')

            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('10. 您的疼痛程度如何?')

            Row({ space: 10 }) {
              this.radio('feeling_influence', '5', true, '0')
              this.radio('feeling_influence', '4', false, '1')
              this.radio('feeling_influence', '4', false, '2')
              this.radio('feeling_influence', '4', false, '3')
              this.radio('feeling_influence', '4', false, '4')

            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_influence', '4', false, '5')
              this.radio('feeling_influence', '3', false, '6')
              this.radio('feeling_influence', '2', false, '7')
              this.radio('feeling_influence', '2', false, '8')
              this.radio('feeling_influence', '2', false, '9')

            }.width('100%').padding(10)

            Row({ space: 10 }) {

              this.radio('feeling_influence', '2', false, '10')
            }.width('100%').padding(10)

          }.width('100%').alignItems(HorizontalAlign.Start)

          Button('提交',{type:ButtonType.Normal})
            .borderRadius(10)
            .width('97%')
            .backgroundColor($r('app.color.green_app'))
            .margin({top:50})
            .onClick(()=>{
              router.back({url:'pages/FormPage',params:'PROMIS'})
            })


        }
        .alignItems(HorizontalAlign.Start)
        .padding(20)
        .width('100%')
        .height(2600)

      } .height(800)
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('102%')
      .margin({top:-5})
    }

  }
}