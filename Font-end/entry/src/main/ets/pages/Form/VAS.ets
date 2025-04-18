import { promptAction, router } from '@kit.ArkUI';
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { GETQUESTIONS, RECORDANSWER } from '../../apiService/APIConstant';
import { appHttpRequest } from '../../apiService/NetWorkAPI';
import { ResponseResult } from '../../model/ResponseResult';
import selection from '../../utils/selection';


interface question_title {
  questionId: number;
  sectionId: number;
  questionText: string;
}

interface question_option {
  optionId:number,
  questionId:number,
  optionText:string,
  sectionId:number
}

interface Question {
  question: question_title,
  options: question_option[],
  answered:boolean,
  user_answer:string
}

@Preview
@Component
@Entry
struct VAS{
  @State slideValue :number = 0
  @State issueExtent: SelectOption[] = []
  @State questionData:Question[] = []
  @State button_able:boolean = false;
  @State str:string = ''

  @Builder Header(head:string){
    Text(head).fontSize(17).fontWeight(700)
  }
  async send() :Promise<void>{
    new Promise<number>((resolve,reject)=>{
      const questionId: number[] = [];
      const options: string[] = [];
      this.questionData[1].user_answer = this.slideValue.toString();
      this.questionData.forEach((item,index)=>{
        questionId[index] = item.question.questionId;
        options[index] = item.user_answer;
      })

      const config : AxiosRequestConfig = {
        method:'post',
        url:RECORDANSWER,
        data:{questionId:questionId,options:options}
      }

      appHttpRequest(config).then((res:AxiosResponse<ResponseResult<number>>)=>{
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
    }).then((data:number)=>{
      console.info("存储用户作答成功" , JSON.stringify(data));
      promptAction.showToast({message:"存储成功"})
      router.back({url:'pages/FormPage',params:{sectionScoreId_VAS : data}})

    }).catch((error:string)=>{
      promptAction.showToast({message:error})
      console.log(error)
    })
  }

  aboutToAppear(): void {
    console.log("页面开始加载 抓取问题数据")
    this.fetchQuestions()
  }
  async fetchQuestions(): Promise<void>{
    new Promise<Question[]>((resolve,reject)=>{
      const config : AxiosRequestConfig = {
        method:'get',
        url:GETQUESTIONS,
        params:{sectionId:3}
      }

      appHttpRequest(config).then((res:AxiosResponse<ResponseResult<Question[]>>)=>{
        if(res.status == 200){
          // console.info("获得的数据:" , JSON.stringify(res.data));
          if(res.data.data){
            // console.info("是否存储成功至data?:" , JSON.stringify(res.data.data));
            resolve(res.data.data);
          }else{
            reject('没有数据 请求失败 无法显示题目')
          }
        }else {
          reject('网络请求异常:code ' + res.status)
        }
      })
        .catch((error:Error)=>{
          reject('网络请求异常:' + JSON.stringify(error))
        })
    }).then((data:Question[])=>{
      this.questionData = data;
      console.info("抓取题目信息成功" , JSON.stringify(data));
      this.str = '      '+this.questionData[1].question.questionText;

      this.questionData.forEach((item,index)=>{
        item.answered = false;
        if(index == 0){
          item.options.forEach((option) => {
            this.issueExtent.push({ value: option.optionText });
          });
        }
      })


    }).catch((error:string)=>{
      promptAction.showToast({message:error})
    })
  }

  build() {
    Column(){
      Stack(){
        Text('VAS视觉模拟评分')
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
      Column() {
        Text(this.str)
          .width('90%')
          .fontWeight(600)
          .margin({bottom:20})
        Row(){
          Select(this.issueExtent).width('30%').selected(0).value("请选择").fontColor('#ff707070')
            .onSelect((index,value)=>{
              this.questionData[0].user_answer = value;
              this.questionData[0].answered = true;
              this.button_able = this.questionData.every(q => q.answered);
              console.log(value)
            })
            .margin({right:20})
          Text('膝疼痛')
        }
        .margin({bottom:20})
        Row(){
          Text('VAS评分：')
            .fontWeight(600)
            .margin({bottom:20})
          Text(this.slideValue.toString())
            .fontWeight(600)
            .margin({bottom:20})
            .fontColor('#2a6049')
            .fontSize(20)
        }


        Slider({
          value: this.slideValue,
          min: 0,
          max: 10,
          style: SliderStyle.InSet
        })
          .width('90%')
          // .showTips(true)
          .showSteps(true)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.slideValue = value
            this.questionData[1].answered = true;
            this.button_able = this.questionData.every(q => q.answered);
            console.info('value:' + value + 'mode:' + mode.toString())
          })

        Image($r('app.media.VAS'))
          .width('100%')
          .height(150)
          .margin({top:20})

        Button('提交',{type:ButtonType.Normal})
          .borderRadius(10)
          .width('95%')
          .backgroundColor($r('app.color.green_app'))
          .margin({top:50})
          .enabled(this.button_able)
          .onClick(async ()=>{
            this.send()
          })


      }
      .height(800)
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('102%')
      .margin({top:-5})
      .padding({top:20,left:10,right:10})
    }

  }
}