import { router } from '@kit.ArkUI';


@Preview
@Component
@Entry
struct SF{
  @State message: string = 'SF评分'

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
        Text('SF 评分')
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
              this.radio('Health_state', '1', true, '极好')
              this.radio('Health_state', '2', false, '非常好')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('Health_state', '3', false, '好')
              this.radio('Health_state', '4', false, '还行')
            }.width('100%').padding(10)

            Row({ space: 10 }) {

              this.radio('Health_state', '5', false, '差')

            }.width('100%').padding(10)

          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('2. 您觉得您的健康状况限制您进行适度活动诸如搬桌子，搞卫生，打保龄球或高尔夫球吗')

            Row({ space: 10 }) {
              this.radio('activities_state', '1', true, '极大限制')
              this.radio('activities_state', '2', false, '稍有限制')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('activities_state', '3', false, '没有限制')
            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)


          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('3. 您觉得您的健康状况限制您爬数层楼梯吗')

            Row({ space: 10 }) {
              this.radio('ud_state', '1', true, '极大限制')
              this.radio('ud_state', '2', false, '稍有限制')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('ud_state', '3', false, '没有限制')
            }.width('100%').padding(10)



          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('4. 过去一周，您是否由于健康原因，想做的事不能完成')

            Row({ space: 10 }) {
              this.radio('do_thing_state', '1', true, '是')
              this.radio('do_thing_state', '2', false, '否')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('5. 过去一周，您是否由于健康原因，某些工作或日常活动受到限制')

            Row({ space: 10 }) {
              this.radio('do_activity_state', '1', true, '是')
              this.radio('do_activity_state', '2', false, '否')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('6. 过去一周，您是否由于情绪原因(郁闷或焦虑)，想做的事不能完成')

            Row({ space: 10 }) {
              this.radio('feeling_thing_state', '1', true, '是')
              this.radio('feeling_thing_state', '2', false, '否')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('7. 过去一周，您是否由于情绪原因(郁闷或焦虑)，不能像往常一样工作或做其他活动')

            Row({ space: 10 }) {
              this.radio('feeling_activity_state', '1', true, '是')
              this.radio('feeling_activity_state', '2', false, '否')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('8. 过去一周，疼痛在多大程度上妨碍你的正常工作(包括家外和家务劳动)')

            Row({ space: 10 }) {
              this.radio('hurt_def_home', '1', true, '一点也不')
              this.radio('hurt_def_home', '2', false, '轻微')
              this.radio('hurt_def_home', '3', false, '中度')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('hurt_def_home', '4', false, '很大程度')
              this.radio('hurt_def_home', '5', false, '严重影响')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('9. 过去一周，您有多少时间是心情平静')

            Row({ space: 10 }) {
              this.radio('feeling_of_week', '1', true, '一直都是')
              this.radio('feeling_of_week', '2', false, '大部分时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_of_week', '3', false, '较长时间')
              this.radio('feeling_of_week', '4', false, '有些时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {

              this.radio('feeling_of_week', '5', false, '偶尔')
              this.radio('feeling_of_week', '6', false, '完全没有')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('10. 过去一周，您有多少时间是精力充沛的')

            Row({ space: 10 }) {
              this.radio('feeling_of_energy', '1', true, '一直都是')
              this.radio('feeling_of_energy', '2', false, '大部分时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_of_energy', '3', false, '较长时间')
              this.radio('feeling_of_energy', '4', false, '有些时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {

              this.radio('feeling_of_energy', '5', false, '偶尔')
              this.radio('feeling_of_energy', '6', false, '完全没有')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('11. 过去一周，您有多少时间感到心情郁闷')

            Row({ space: 10 }) {
              this.radio('feeling_of_sad', '1', true, '一直都是')
              this.radio('feeling_of_sad', '2', false, '大部分时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_of_sad', '3', false, '较长时间')
              this.radio('feeling_of_sad', '4', false, '有些时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {

              this.radio('feeling_of_sad', '5', false, '偶尔')
              this.radio('feeling_of_sad', '6', false, '完全没有')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Divider().width('100%').vertical(false).height(4)

          Column({ space: 7 }) {
            this.Header('12. 过去一周，由于健康状况或情绪问题，您有多长时间因此而导致日常社交活动(像探访亲友等)受到限制')

            Row({ space: 10 }) {
              this.radio('feeling_of_def_of_activity', '1', true, '一直都是')
              this.radio('feeling_of_def_of_activity', '2', false, '大部分时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {
              this.radio('feeling_of_def_of_activity', '3', false, '较长时间')
              this.radio('feeling_of_def_of_activity', '4', false, '有些时间')
            }.width('100%').padding(5)

            Row({ space: 10 }) {

              this.radio('feeling_of_def_of_activity', '5', false, '偶尔')
              this.radio('feeling_of_def_of_activity', '6', false, '完全没有')
            }.width('100%').padding(5)


          }.width('100%').alignItems(HorizontalAlign.Start)

          Button('提交',{type:ButtonType.Normal})
            .borderRadius(10)
            .width('97%')
            .backgroundColor($r('app.color.green_app'))
            .margin({top:50})
            .onClick(()=>{
              router.back({url:'pages/FormPage',params:'sf'})
            })
        }
        .alignItems(HorizontalAlign.Start)
        .padding(20)
        .width('100%')
        .height(2400)

      } .height(800)
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('102%')
      .margin({top:-5})
    }

  }
}