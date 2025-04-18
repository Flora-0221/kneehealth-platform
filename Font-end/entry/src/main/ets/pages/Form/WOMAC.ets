
import { router } from '@kit.ArkUI';

@Preview
@Component
@Entry
struct WOMACForm{
  @State message: string = 'WOMAC测试'

  @Builder Header(head:string){
    Text(head).fontSize(17).fontWeight(700)
  }
  @Builder radio(group:string){

    Row({space:10}){
      Row({space:5}){
        Radio({value:'0',group:group}).checked(true).width(20).height(20)
        Text('0')
      }.margin({right:5})


      Row({space:5}){
        Radio({value:'1',group:group}).checked(false).width(20).height(20)
        Text('1')
      }.margin({right:5})

      Row({space:5}){
        Radio({value:'2',group:group}).checked(false).width(20).height(20)
        Text('2')
      }.margin({right:5})
      Row({space:5}){
        Radio({value:'3',group:group}).checked(false).width(20).height(20)
        Text('3')
      }.margin({right:5})
      Row({space:5}){
        Radio({value:'4',group:group}).checked(false).width(20).height(20)
        Text('4')
      }.margin({right:5})

    }.width('100%').margin({top:10})


  }


  build() {
    Column(){
      Stack(){
        Text('WOMAC 评分')
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
          Column(){
            this.Header('1. 最近两天在平地行走时膝关节疼痛程度')
            this.radio('walk_in_flat_floor')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('2. 最近两天在上下楼梯时膝关节疼痛程度')
            this.radio('ud_in_floor')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('3. 最近两天在床上睡觉时膝关节疼痛程度')
            this.radio('sleep_in_bed')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('4. 最近两天在坐着或躺着时膝关节疼痛程度')
            this.radio('sit_sleep')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('5. 最近两天站立时膝关节疼痛程度')
            this.radio('sleep_in_floor')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('6. 在您早晨刚醒的时候，您膝关节的僵硬程度')
            this.radio('jy_degree_wake_up')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('7. 白天，在您坐、躺或休息后，您膝关节僵硬程度')
            this.radio('jy_degree_the_day')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('8. 最近两天由于膝关节问题您下楼梯的困难程度')
            this.radio('down_hard')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('9. 最近两天由于膝关节问题您上楼梯的困难程度')
            this.radio('up_hard')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('10. 最近两天由于膝关节问题您从椅子上站起来的困难程度')
            this.radio('stand_up_from_chair_hard')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column(){
            this.Header('11. 最近两天由于膝关节问题您站起来的困难程度')
            this.radio('stand_up_hard')
          }.margin({top:20}).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('12. 最近两天由于膝关节问题您弯腰的困难程度')
            this.radio('bend_over_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('13. 最近两天由于膝关节问题您在平地行走的困难程度')
            this.radio('walk_on_flat_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('14. 最近两天由于膝关节问题您上下汽车的困难程度')
            this.radio('get_in_out_car_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('15. 最近两天由于膝关节问题您逛街购物的困难程度')
            this.radio('go_shopping_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('16. 最近两天由于膝关节问题您穿鞋袜的困难程度')
            this.radio('put_on_shoes_socks_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('17. 最近两天由于膝关节问题您起床的困难程度')
            this.radio('get_up_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('18. 最近两天由于膝关节问题您脱鞋袜的困难程度')
            this.radio('take_off_shoes_socks_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('19. 最近两天由于膝关节问题您上床躺下的时候的困难程度')
            this.radio('lie_down_on_bed_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('20. 最近两天由于膝关节问题您进出浴缸的时候的困难程度')
            this.radio('enter_exit_bathtub_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('21. 最近两天由于膝关节问题您坐着的困难程度')
            this.radio('sit_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('22. 最近两天由于膝关节问题您坐马桶或者站起来的时候的困难程度')
            this.radio('use_toilet_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('23. 最近两天由于膝关节问题您干比较重的家务活的困难程度')
            this.radio('do_heavy_housework_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)
          Divider().width('100%').vertical(false).height(4)
          Column() {
            this.Header('24. 最近两天由于膝关节问题您干比较轻的家务活的困难程度')
            this.radio('do_light_housework_hard')
          }.margin({ top: 20 }).alignItems(HorizontalAlign.Start)

          Button('提交',{type:ButtonType.Normal})
            .borderRadius(10)
            .width('97%')
            .backgroundColor($r('app.color.green_app'))
            .margin({top:50})
            .onClick(()=>{
              router.back({url:'pages/FormPage',params:'womac'})
            })
        }
        .alignItems(HorizontalAlign.Start)
        .padding(20)
        .width('100%')
        .height(3600)

      } .height(800)
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('102%')
      .margin({top:-5})
    }

  }
}