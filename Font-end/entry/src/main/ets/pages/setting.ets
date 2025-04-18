import { router } from '@kit.ArkUI';


@Preview
@Component
@Entry
struct setting{
  @State message: string = '通知设置'
  @State slideValue_normal :number = 0
  @State slideValue_voice :number = 0
  @State slideValue_moving :number = 0
  @State slideValue_upgrade :number = 0
  @State slideValue_warming :number = 0
  @State slideValue_newmessage :number = 0

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
        Text('通知设置')
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


          Row(){
            Text('常规').fontSize(17)
            Slider({
              value: this.slideValue_normal,
              min: 0,
              max: 1,
              style: SliderStyle.InSet
            })
              .selectedColor($r('app.color.green_app'))
              .trackThickness(22)
              .width('18%')
                // .showTips(true)
              .showSteps(true)
              .onClick(()=>{

                this.slideValue_normal = this.slideValue_normal === 1 ? 0 : 1;

              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.slideValue_normal = value
                console.info('value:' + this.slideValue_normal + 'mode:' + mode.toString())
              })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:20,right:20})

          Row(){
            Text('声音').fontSize(17)
            Slider({
              value: this.slideValue_voice,
              min: 0,
              max: 1,
              style: SliderStyle.InSet
            })
              .selectedColor($r('app.color.green_app'))

              .width('18%')
              .trackThickness(22)
              .showSteps(true)
              .onClick(()=>{

                this.slideValue_voice = this.slideValue_voice === 1 ? 0 : 1;

              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.slideValue_voice = value
                console.info('value:' + this.slideValue_voice + 'mode:' + mode.toString())
              })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:20,right:20})

          Row(){
            Text('震动').fontSize(17)
            Slider({
              value: this.slideValue_moving,
              min: 0,
              max: 1,
              style: SliderStyle.InSet
            })
              .selectedColor($r('app.color.green_app'))

              .width('18%')
              .trackThickness(22)
              .showSteps(true)
              .onClick(()=>{

                this.slideValue_moving = this.slideValue_moving === 1 ? 0 : 1;

              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.slideValue_moving = value
                console.info('value:' + this.slideValue_moving + 'mode:' + mode.toString())
              })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:20,right:20})

          Row(){
            Text('升级提示').fontSize(17)
            Slider({
              value: this.slideValue_upgrade,
              min: 0,
              max: 1,
              style: SliderStyle.InSet
            })
              .selectedColor($r('app.color.green_app'))

              .width('18%')
              .trackThickness(22)
              .showSteps(true)
              .onClick(()=>{

                this.slideValue_upgrade = this.slideValue_upgrade === 1 ? 0 : 1;

              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.slideValue_upgrade = value
                console.info('value:' + this.slideValue_upgrade + 'mode:' + mode.toString())
              })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:20,right:20})

          Row(){
            Text('运动提醒').fontSize(17)
            Slider({
              value: this.slideValue_warming,
              min: 0,
              max: 1,
              style: SliderStyle.InSet
            })
              .selectedColor($r('app.color.green_app'))

              .width('18%')
              .trackThickness(22)
              .showSteps(true)
              .onClick(()=>{

                this.slideValue_warming = this.slideValue_warming === 1 ? 0 : 1;

              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.slideValue_warming = value
                console.info('value:' + this.slideValue_warming + 'mode:' + mode.toString())
              })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:20,right:20})

          Row(){
            Text('新消息').fontSize(17)
            Slider({
              value: this.slideValue_newmessage,
              min: 0,
              max: 1,
              style: SliderStyle.InSet
            })
              .selectedColor($r('app.color.green_app'))
              .trackThickness(22)
              .width('18%')
                // .showTips(true)
              .showSteps(true)
              .onClick(()=>{

                this.slideValue_newmessage = this.slideValue_newmessage === 1 ? 0 : 1;

              })
              .onChange((value: number, mode: SliderChangeMode) => {
                this.slideValue_newmessage = value
                console.info('value:' + this.slideValue_newmessage + 'mode:' + mode.toString())
              })
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding({left:20,right:20})

          Button('保存',{type:ButtonType.Normal})
            .borderRadius(10)
            .width('97%')
            .backgroundColor($r('app.color.green_app'))
            .margin({top:50})
            .onClick(()=>{
              router.back()
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