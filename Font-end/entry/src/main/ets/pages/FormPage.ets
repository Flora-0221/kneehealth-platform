import { promptAction, router } from '@kit.ArkUI';
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { GETRESULT } from '../apiService/APIConstant';
import { appHttpRequest } from '../apiService/NetWorkAPI';
import { ResponseResult } from '../model/ResponseResult';

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
struct FormPage{
  @State sectionScoreId_SF:number | boolean = false;
  @State sectionScoreId_KOOS:number | boolean = false;
  @State sectionScoreId_WOMAC:number | boolean = false;
  @State sectionScoreId_PROMIS:number | boolean = false;
  @State sectionScoreId_AKS:number | boolean = false;
  @State sectionScoreId_VAS:number | boolean = false;

  // @State sectionScoreId_SF:number | boolean = 56;
  // @State sectionScoreId_KOOS:number | boolean = 55;
  // @State sectionScoreId_WOMAC:number | boolean = 54;
  // @State sectionScoreId_PROMIS:number | boolean = 53;
  // @State sectionScoreId_AKS:number | boolean = 52;
  // @State sectionScoreId_VAS:number | boolean = 51;

  @State button_able:boolean = false;

  onPageShow(): void {
    const params = router.getParams() as Record<string, number | boolean> || {};


    if(params['sectionScoreId_SF']){
      this.sectionScoreId_SF = params['sectionScoreId_SF']
    }
    if(params['sectionScoreId_KOOS']){
      this.sectionScoreId_KOOS = params['sectionScoreId_KOOS']
    }
    if(params['sectionScoreId_WOMAC']){
      this.sectionScoreId_WOMAC = params['sectionScoreId_WOMAC']
    }
    if(params['sectionScoreId_PROMIS']){
      this.sectionScoreId_PROMIS = params['sectionScoreId_PROMIS']
    }
    if(params['sectionScoreId_AKS']){
      this.sectionScoreId_AKS = params['sectionScoreId_AKS']
    }
    if(params['sectionScoreId_VAS']){
      this.sectionScoreId_VAS = params['sectionScoreId_VAS']
    }


    // this.sectionScoreId_SF = params['sectionScoreId_SF'] ?? false;
    // this.sectionScoreId_KOOS = params['sectionScoreId_KOOS'] ?? false;
    // this.sectionScoreId_WOMAC = params['sectionScoreId_WOMAC'] ?? false;
    // this.sectionScoreId_PROMIS = params['sectionScoreId_PROMIS'] ?? false;
    // this.sectionScoreId_AKS = params['sectionScoreId_AKS'] ?? false;
    // this.sectionScoreId_VAS = params['sectionScoreId_VAS'] ?? false;


    if (
      this.sectionScoreId_SF !== false &&
        this.sectionScoreId_KOOS !== false &&
        this.sectionScoreId_WOMAC !== false &&
        this.sectionScoreId_PROMIS !== false &&
        this.sectionScoreId_AKS !== false &&
        this.sectionScoreId_VAS !== false
    ) {
      console.log("可以点击按钮了！")
      this.button_able = true;
    }

  }
  build() {
    Column(){
      Stack(){
        Text('填写表单')
          .fontWeight(900)
          .margin({bottom:40})
          .textAlign(TextAlign.Center)
          .margin({top: 5,bottom:20})
          .width('100%')

        Button({type:ButtonType.Normal}){
          Image($r('app.media.left_arrow'))
            .fillColor('#ff696969')
            .width('60%')
        }
        .borderWidth(2)
        .backgroundColor(Color.Transparent)
        .position({x:0,y:-5})
        .borderRadius(10)
        .borderColor('#28aeaeae')
        .width(40)
        .height(40)
        .onClick(()=>{
          router.back()
        })

      }
      .width('100%').padding({left:20})
      Scroll(){
        Column({space:20}){
          // Row({space:20}){
          //   Image($r('app.media.personal')).width(50).backgroundColor('#ffac00').padding(10).borderRadius(5)
          //   Column({space:8}){
          //     Text('个人信息填写')
          //     Text('2023-07-26')
          //       .fontSize(13)
          //       .fontColor($r('app.color.gray_default'))
          //   }.alignItems(HorizontalAlign.Start)
          //   Image($r('app.media.right')).width(10).margin({left:'30%',right:7})
          // }
          // .padding(10)
          // .backgroundColor(Color.White)
          // .borderRadius(10)
          // .onClick(()=>{
          //   router.pushUrl({url:'pages/Form/PersonInfoForm'})
          // })
          Row({space:20}){
            Image($r('app.media.link')).width(50).backgroundColor('#76dbd1').padding(10).borderRadius(5)
            Column({space:8}){
              Text('AKS 评分')
              Text('2023-07-26')
                .fontSize(13)
                .fontColor($r('app.color.gray_default'))
            }.alignItems(HorizontalAlign.Start).width(100)
            Image($r('app.media.right')).width(10).margin({left:'29%',right:7})
            if(this.sectionScoreId_AKS !==false){
              Image($r('app.media.finishes')).position({x:290,y:-15}).width(22)
            }

          }
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .onClick(()=>{
            router.pushUrl({url:'pages/Form/AKSForm'})
          })

          Row({space:20}){
            Image($r('app.media.health')).width(50).backgroundColor('#76dbd1').padding(10).borderRadius(5)
            Column({space:8}){
              Text('VAS 评分')
              Text('2023-07-26')
                .fontSize(13)
                .fontColor($r('app.color.gray_default'))
            }.alignItems(HorizontalAlign.Start).width(100)
            Image($r('app.media.right')).width(10).margin({left:'29%',right:7})
            if(this.sectionScoreId_VAS !==false){
              Image($r('app.media.finishes')).position({x:290,y:-15}).width(22)
            }
          }
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .onClick(()=>{
            router.pushUrl({url:'pages/Form/VAS'})
          })

          Row({space:20}){
            Image($r('app.media.write')).width(50).backgroundColor('#f47373').padding(10).borderRadius(5)
            Column({space:8}){
              Text('WOMAC 评分')
              Text('2023-07-26')
                .fontSize(13)
                .fontColor($r('app.color.gray_default'))
            }.alignItems(HorizontalAlign.Start).width(100)
            Image($r('app.media.right')).width(10).margin({left:'29%',right:7})
            if(this.sectionScoreId_WOMAC !==false){
              Image($r('app.media.finishes')).position({x:290,y:-15}).width(22)
            }
          }
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .onClick(()=>{
            router.pushUrl({url:'pages/Form/WOMACForm'})
          })

          Row({space:20}){
            Image($r('app.media.health')).width(50).backgroundColor('#ffac00').padding(10).borderRadius(5)
            Column({space:8}){
              Text('KOOS,JR. 评分')
              Text('2023-07-26')
                .fontSize(13)
                .fontColor($r('app.color.gray_default'))
            }.alignItems(HorizontalAlign.Start).width(120)
            Image($r('app.media.right')).width(10).margin({left:'22.8%',right:7})
            if(this.sectionScoreId_KOOS !==false){
              Image($r('app.media.finishes')).position({x:290,y:-15}).width(22)
            }
          }
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .onClick(()=>{
            router.pushUrl({url:'pages/Form/KOOSForm'})
          })

          Row({space:20}){
            Image($r('app.media.protect')).width(50).backgroundColor('#77dbd1').padding(10).borderRadius(5)
            Column({space:8}){
              Text('SF-12 评分')
              Text('2023-07-26')
                .fontSize(13)
                .fontColor($r('app.color.gray_default'))
            }.alignItems(HorizontalAlign.Start).width(120)
            Image($r('app.media.right')).width(10).margin({left:'22.8%',right:7})
            if(this.sectionScoreId_SF !==false){
              Image($r('app.media.finishes')).position({x:290,y:-15}).width(22)
            }
          }
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .onClick(()=>{
            router.pushUrl({url:'pages/Form/SFForm'})
          })

          Row({space:20}){
            Image($r('app.media.general_health')).width(50).backgroundColor('#f47473').padding(10).borderRadius(5)
            Column({space:8}){
              Text('综合评分')
              Text('2023-07-26')
                .fontSize(13)
                .fontColor($r('app.color.gray_default'))
            }.alignItems(HorizontalAlign.Start).width(120)
            Image($r('app.media.right')).width(10).margin({left:'22.8%',right:7})
            if(this.sectionScoreId_PROMIS !==false){
              Image($r('app.media.finishes')).position({x:290,y:-15}).width(22)
            }
          }
          .padding(10)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .onClick(()=>{
            router.pushUrl({url:'pages/Form/PROMISForm'})
          })


          Button('提交',{type:ButtonType.Normal})
            .borderRadius(10)
            .width('95%')
            .backgroundColor($r('app.color.green_app'))
            .margin({top:20})
            .enabled(this.button_able)
            .onClick(
              async ()=>{
                this.send()
              }
            )
        }.width('100%').alignItems(HorizontalAlign.Start).padding({left:20,top:20}).backgroundColor('#40c1c1c1').height(750)
      }.width('100%').height(700)
    }


  }


  async send() :Promise<void>{
    new Promise<SurveyResult>((resolve,reject)=>{
      const scoreId: number[] = [];


      scoreId.push(
        Number(this.sectionScoreId_SF),
        Number(this.sectionScoreId_KOOS),
      Number(this.sectionScoreId_WOMAC),
        Number(this.sectionScoreId_PROMIS),
        Number(this.sectionScoreId_AKS),
        Number(this.sectionScoreId_VAS)
      )
      console.log("发送的值为"+scoreId)
      const config : AxiosRequestConfig = {
        method:'get',
        url:GETRESULT,
        params:{scoreId: scoreId.join(',')}
      }

      appHttpRequest(config).then((res:AxiosResponse<ResponseResult<SurveyResult>>)=>{
        if(res.status == 200){
          if(res.data.data){
            resolve(res.data.data);
          }else{
            reject('没有数据 请求失败 存储失败')
          }
        }else {
          reject('网络请求异常:code ' + res.status)
        }
      })
        .catch((error:Error)=>{
          reject('网络请求异常:' + JSON.stringify(error))
        })
    }).then((data:SurveyResult)=>{
      console.info("存储用户作答成功" , JSON.stringify(data));
      promptAction.showToast({message:"存储成功"})
      router.pushUrl({url:'pages/ShowScoreResult',params:{survey_result : data}})

    }).catch((error:string)=>{
      promptAction.showToast({message:error})
      console.log(error)
    })
  }
}