
import { promptAction, router } from '@kit.ArkUI';
import { Options } from '@mcui/mccharts/src/main/ets/components/mainpage/Options';
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { it } from '@ohos/hypium';
import { GETQUESTIONS, RECORDANSWER } from '../../apiService/APIConstant';
import { appHttpRequest } from '../../apiService/NetWorkAPI';
import { ResponseResult } from '../../model/ResponseResult';

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
struct AKSForm{
  @State message: string = 'KOOS'
  @State questionData:Question[] = []
  @State tempOptions:SelectOption[] = []
  @State str:string[] = []
  @State button_able:boolean = false;

  @Builder Header(head:string){
    Text(head).fontSize(17).fontWeight(700)
  }
  @Builder radio(group:string, value:string,checked:boolean,tex:string){
    Radio({value:value,group:group}).checked(checked).width(20).height(20)
      .onClick(()=>{
        this.questionData[(Number(group)%(this.questionData[0].question.questionId))].answered = true;
        this.questionData[(Number(group)%(this.questionData[0].question.questionId))].user_answer = tex;
        console.log("作答完成:" + group)
        this.button_able = this.questionData.every(q => q.answered);
      })
    Text(tex)
  }


  @Builder loadQuestions() {
    ForEach(this.questionData,(item:Question,index:number) => {
      // 渲染问题标题
      this.Header(index+1 +'. '+ item.question.questionText.toString());
      // 渲染选项
      Column({ space: 0 }) {
        ForEach(item.options,(option:question_option,index:number) => {
          Row({ space: 10 }) {
            this.radio(option.questionId.toString(), option.optionId.toString(), false, option.optionText);
          }.width('100%').padding(10);
        });

      }.width('100%').alignItems(HorizontalAlign.Start);

      Divider().width('100%').vertical(false).height(4);  // 问题之间的分隔线
    })
    Button('提交',{type:ButtonType.Normal})
      .borderRadius(10)
      .width('97%')
      .backgroundColor($r('app.color.green_app'))
      .margin({top:50})
      .enabled(this.button_able)
      .onClick(async ()=>{
        this.send()
      })

  }

  //发送题目信息
  async send() :Promise<void>{
    new Promise<number>((resolve,reject)=>{
      const questionId: number[] = [];
      const options: string[] = [];
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
      router.back({url:'pages/FormPage',params:{sectionScoreId_KOOS : data}})

    }).catch((error:string)=>{
      promptAction.showToast({message:error})
      console.log(error)
    })
  }

  aboutToAppear(): void {
    console.log("页面开始加载 抓取问题数据")
    this.fetchQuestions()
  }

  getSelection(item:Question){
    item.options.forEach((option) => {
      this.tempOptions.push({ value: option.optionText });
    });
  }

  build() {
    Column() {

      Stack(){
        Text('KOOS.JR. 评分')
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

          // 动态加载问卷题目和选项
          this.loadQuestions();
        }.alignItems(HorizontalAlign.Start).padding(20).width('100%').height(1300)
        .padding({ top: 50, left: 20, right: 20 });
      }.height(800).borderRadius({ topLeft: 10, topRight: 10 })
      .backgroundColor(Color.White).width('102%').margin({ top: -5 });
    }
  }

  async fetchQuestions(): Promise<void>{
    new Promise<Question[]>((resolve,reject)=>{
      const config : AxiosRequestConfig = {
        method:'get',
        url:GETQUESTIONS,
        params:{sectionId:6}
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
      this.questionData.forEach((item,index)=>{
        if(item.options.length > 10){
          this.getSelection(item);
        }
        item.answered = false;
      })
    }).catch((error:string)=>{
      promptAction.showToast({message:error})
    })
  }


}