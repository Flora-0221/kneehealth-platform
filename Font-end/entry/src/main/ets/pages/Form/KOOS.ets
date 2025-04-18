import { router } from '@kit.ArkUI';


@Preview
@Component
@Entry
struct Koos{
  @State message: string = 'KOOS,JR.评分'

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
        Text('KOOS,JR. 评分')
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
            this.Header('1. 最近一个星期，在以膝关节中心做旋转时，您膝关节疼痛达到何种程度')
            Row({ space: 10 }) {

              Radio({ value: '40', group: 'Spin_Hurt_Group' }).checked(true).width(20).height(20)
              Text('没有疼痛')

              Radio({ value: '30', group: 'Spin_Hurt_Group' }).checked(false).width(20).height(20)
              Text('轻微')

            }.width('100%').padding(10)

            Row({ space: 10 }) {

              Radio({ value: '20', group: 'Spin_Hurt_Group' }).checked(false).width(20).height(20)
              Text('中等')

              Radio({ value: '10', group: 'Spin_Hurt_Group' }).checked(false).width(20).height(20)
              Text('严重')


            }.width('100%').padding(10)

            Row({ space: 10 }) {

              Radio({ value: '0', group: 'Spin_Hurt_Group' }).checked(false).width(20).height(20)
              Text('非常严重')

            }.width('100%').padding(10)

          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('2. 最近一个星期，在完全伸直膝关节时，您膝关节疼痛达到何种程度')
            Row({ space: 10 }) {

              Radio({ value: '40', group: 'sz_Hurt_Group' }).checked(true).width(20).height(20)
              Text('没有疼痛')

              Radio({ value: '30', group: 'sz_Hurt_Group' }).checked(false).width(20).height(20)
              Text('轻微')

            }.width('100%').padding(10)

            Row({ space: 10 }) {

              Radio({ value: '20', group: 'sz_Hurt_Group' }).checked(false).width(20).height(20)
              Text('中等')

              Radio({ value: '10', group: 'sz_Hurt_Group' }).checked(false).width(20).height(20)
              Text('严重')


            }.width('100%').padding(10)

            Row({ space: 10 }) {

              Radio({ value: '0', group: 'sz_Hurt_Group' }).checked(false).width(20).height(20)
              Text('非常严重')

            }.width('100%').padding(10)

          }.width('100%').alignItems(HorizontalAlign.Start)


          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('3. 最近一个星期，在下蹲从地上捡东西时，您膝关节疼痛达到何种程度')
            Row({ space: 10 }) {

              Radio({ value: '40', group: 'HurtGroup' }).checked(true).width(20).height(20)
              Text('没有困难')

              Radio({ value: '30', group: 'HurtGroup' }).checked(false).width(20).height(20)
              Text('轻微困难')

            }.width('100%').padding(10)

            Row({ space: 10 }) {

              Radio({ value: '20', group: 'HurtGroup' }).checked(false).width(20).height(20)
              Text('中等困难')

              Radio({ value: '10', group: 'HurtGroup' }).checked(false).width(20).height(20)
              Text('非常困难')


            }.width('100%').padding(10)

            Row({ space: 10 }) {

              Radio({ value: '0', group: 'HurtGroup' }).checked(false).width(20).height(20)
              Text('极其严重')

            }.width('100%').padding(10)

          }.width('100%').alignItems(HorizontalAlign.Start)

          Button('提交',{type:ButtonType.Normal})
            .borderRadius(10)
            .width('97%')
            .backgroundColor($r('app.color.green_app'))
            .margin({top:50})
            .onClick(()=>{
              router.back({url:'pages/FormPage',params:'koos'})
            })

        }
        .alignItems(HorizontalAlign.Start)
        .padding(20)
        .width('100%')
        .height(950)

      }
      .height(800)
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('102%')
      .margin({top:-5})
    }

  }
}