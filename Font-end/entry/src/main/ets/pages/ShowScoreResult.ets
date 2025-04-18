
import { promptAction, router } from '@kit.ArkUI';

interface sectionScore{
  scoreId:number
  userId:number
  sectionId:number
  totalScore:number
  surveyId:number
}

interface surveyScore {
  surveyId: number;
  userId: number;
  totalScore: number;
}

interface SurveyResult{
  sectionScores:sectionScore[]
  surveyScores: surveyScore
}

@Preview
@Component
@Entry
struct ShowPage{

  @State result:SurveyResult|boolean = false;

  @State sectionScoreId_SF:number | boolean = false;
  @State sectionScoreId_KOOS:number | boolean = false;
  @State sectionScoreId_WOMAC:number | boolean = false;
  @State sectionScoreId_PROMIS:number | boolean = false;
  @State sectionScoreId_AKS:number | boolean = false;
  @State sectionScoreId_VAS:number | boolean = false;

  @State total:number|boolean = false;
  onPageShow(): void {
    const param = (router.getParams() as Record<string, SurveyResult>)['survey_result'];
    param.sectionScores.forEach((item,index)=>{
      if(item.sectionId == 3){
        this.sectionScoreId_VAS = item.totalScore
      }else if(item.sectionId == 4){
        this.sectionScoreId_AKS = item.totalScore
      }else if(item.sectionId == 5){
        this.sectionScoreId_WOMAC = item.totalScore
      }else if(item.sectionId == 6){
        this.sectionScoreId_KOOS = item.totalScore
      }else if(item.sectionId == 7){
        this.sectionScoreId_SF = item.totalScore
      }else if(item.sectionId == 8){
        this.sectionScoreId_PROMIS = item.totalScore
      }
    })
    this.total = param.surveyScores.totalScore

  }
  build() {
    Column() {

      Stack(){
        Text('问卷结果')
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
        Column() {
          Column(){
            Text('恭喜你完成问卷！').fontWeight(600).fontSize(18).fontColor('#ff888888')
          }.borderWidth(1).padding(10).width('95%').borderRadius(20).margin({bottom:20}).borderColor('#babebebe')
          Column(){

            Row(){
              Text('问卷部分').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17).fontWeight(700)
              Text('对应得分').layoutWeight(2.5).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:55})
            Row(){
              Text('VAS 部分评分结果：').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17)
              Text(this.sectionScoreId_VAS.toString()).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:25})
            Row(){
              Text('AKS 部分评分结果：').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17)
              Text(this.sectionScoreId_AKS.toString()).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:25})
            Row(){
              Text('WOMAC 部分评分结果：').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17)
              Text(this.sectionScoreId_WOMAC.toString()).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:25})
            Row(){
              Text('KOOS,JR. 部分评分结果：').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17)
              Text(this.sectionScoreId_KOOS.toString()).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:25})
            Row(){
              Text('SF-12 部分评分结果：').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17)
              Text(this.sectionScoreId_SF.toString()).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:25})
            Row(){
              Text('PROMIS 部分评分结果：').layoutWeight(4).fontColor($r('app.color.green_app')).fontSize(17)
              Text(this.sectionScoreId_PROMIS.toString()).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(18).fontWeight(700)
            }.margin({top:30,left:25})
            Divider().width('94%').color('#a1ffffff').margin({top:20}).strokeWidth(1)

            Row(){
              Text('总分：').layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(20).fontWeight(700)
              Text(this.total.toString()).fontWeight(800).layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(40)
              Text('分').layoutWeight(1).fontColor($r('app.color.green_app')).fontSize(20)
            }.margin({top:40,left:30})
            Image($r('app.media.Result')).width(100).position({x:230,y:440})
          }.backgroundColor('#bacac2').width('95%').height(500).borderRadius(30)


          Column(){
            Row(){
              Image($r('app.media.suggestion2')).width(30)
              Text('医生建议：').fontColor(Color.White).margin({left:10})
            }.margin({bottom:10})

            Text('不要剧烈运动，坚持做康复训练，多摄入维生素和蛋白质').fontColor(Color.White)
          }
          .borderRadius(5)
          .backgroundColor('#bacac2')
          .margin({top:20})
          .width('95%')
          .padding(20)
          .alignItems(HorizontalAlign.Start)

          Button('我知道啦',{type:ButtonType.Normal})
            .backgroundColor(Color.Transparent)
            .borderWidth(2)
            .borderRadius(15)
            .padding(10)
            .borderColor($r('app.color.green_app'))
            .fontColor($r('app.color.green_app'))
            .width('95%')
            .margin({top:40})
            .onClick(()=>{
              router.back({url:'pages/MainIndex'})
            })

        }.alignItems(HorizontalAlign.Center).padding(20).width('100%').height(900)
        .padding({ top: 20, left: 20, right: 20 });
      }.height(800).borderRadius({ topLeft: 10, topRight: 10 })
      .backgroundColor('#ffeeeeee').width('102%').margin({ top: -5 });
    }
  }


}