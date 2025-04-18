import DateUtil from '../utils/DateUtil'
import axios, { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { API, GETMYDATA, LOGIN_PATH } from '../apiService/APIConstant';
import { appHttpRequest } from '../apiService/NetWorkAPI';
import { ResponseResult } from '../model/ResponseResult';
import { data } from '@kit.TelephonyKit';
import picker from '@ohos.file.picker';
import fs from '@ohos.file.fs';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import prompt from '@ohos.promptAction';
interface dataModel {
  id: number;
  nickName:string;
  icon:string;
  creteTime:Date;
  email:string;
  gender:string;
  country:string;
  address:string;
  occupation:string;
  birthdate:string;
  age:number;
  phone:string;
}



@Component

export default struct HomeContent{
  @State walkLevelTagcolor: string = "#fece46";
  @State walkLevel: string = "良好";
  @State tempeLevelTagcolor: string = "#2ccc70";
  @State tempeLevel: string = "优秀";
  @State activeLevelTagcolor: string = "#2ccc70";
  @State activeLevel: string="优秀";
  @State swalLevelTagcolor: string = "#2ccc70";
  @State swalLevel: string  = "优秀";
  @State walkScore: number = 87;
  @State swalScore: number = 90;
  @State swal: number = 1.5;
  @State activeScore: number = 100;
  @State active: number = 135;
  @State tempeScore: number = 100;
  @State tempe: number = 34.0;
  @State LevelTagcolor: string = '#2ccc70';
  @State isMeasuring: boolean = false; // 是否正在测量
  @State nickName:string = '';
  @State score: number = 96;
  @State Level: string = '优秀';

  // @State date: number = DateUtil.beginTimeOfDay(new Date())
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
  aboutToAppear() {
    console.log('抓取到的token是' + AppStorage.Get('token'));
    this.fetchData();
  }

  async fetchData():Promise<void>
  {
    new Promise<dataModel>((resolve,reject)=>{
      const config : AxiosRequestConfig = {
        method:'get',
        url:GETMYDATA
      }

      appHttpRequest(config).then((res:AxiosResponse<ResponseResult<dataModel>>)=>{
        if(res.status == 200){
          if(res.data.data){
            this.nickName = res.data.data.nickName;
            resolve(res.data.data)
          } else{
            reject("没有数据 请求失败" + res.data.success)
          }
        }else {
          reject("网络请求异常：code"+res.status)
        }
      })
        .catch( (error:Error)=>{
          reject('网络请求异常:' + JSON.stringify(error))
        })
    }).then((data:dataModel) =>{
      console.log("昵称是"+this.nickName);
      console.info('data是',JSON.stringify(data))
    }).catch((err:string)=>{
      console.log(err);
    })

    // if(res.data.success == true){
    //   this.nickName = res.data.data.nickName;
    //   console.log("昵称是"+this.nickName);
    // }else{
    //   (error: Error) => {
    //     console.info(JSON.stringify(error));
    //   }
    // }
  }

  progree_color(point:number):string {
  if(point<=40){
    return '#f47473'
  }
  else if(point>40 && point<=70){
    return '#fdce4c'
  }else{
    return'#2dcc70'
  }
}

  loadFile(): void{

    const documentSelectOptions = new picker.DocumentSelectOptions();
    documentSelectOptions.maxSelectNumber = 1; // 选择文档的最大数目（可选）
    documentSelectOptions.defaultFilePathUri = "file://docs/storage/Users/currentUser/test"; // 指定选择的文件或者目录路径（可选）
    documentSelectOptions.fileSuffixFilters = ['.txt']; // 选择文件的后缀类型，若选择项存在多个后缀名，则每一个后缀名之间用英文逗号进行分隔，而且后缀类型名不能超过100个（可选）。


    let uris: Array<string> = [];
    const documentViewPicker = new picker.DocumentViewPicker(); // 创建文件选择器实例
    documentViewPicker.select(documentSelectOptions).then((documentSelectResult: Array<string>) => {
      uris = documentSelectResult;
      console.info('documentViewPicker.select to file succeed and uris are:' + uris);


      this.startMeasurement(); // 开始计算逻辑

      // 选择了文件后弹出弹窗
      // AlertDialog.show({
      //   title: '正在计算',
      //   message: this.isMeasuring ? '计算中，请稍候...' : '正在计算中... 请稍后',
      //   autoCancel: true,
      //   alignment: DialogAlignment.Center, // 弹窗居中
      //   offset: { dx: 0, dy: -20 }, // 偏移量
      //   primaryButton: {
      //     value: '取消',
      //     fontColor: Color.Red, // 按钮字体颜色
      //     action: () => {
      //       console.log('计算已取消');
      //     },
      //   },
      //   secondaryButton: {
      //     value: '确定',
      //     fontColor: Color.Green,
      //     action: () => {
      //       if (!this.isMeasuring) {
      //         this.startMeasurement(); // 开始计算逻辑
      //       }
      //     },
      //   },
      //   cancel: () => {
      //     console.info('弹窗关闭');
      //   },
      // });
    }).catch((err: BusinessError) => {
      console.error(`Invoke documentViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
    })
  }

  build() {

    Column(){
      Column(){
        Text('你好,')
          .fontSize(15)
          .fontWeight(600)
          .margin({top: 10,bottom: 5,left: 20})
          .fontColor('#c7c8c8')
        Text(this.nickName)
          .fontSize(25)
          .fontWeight(700)
          .margin({left: 20})
          .fontColor('#ff323232')
        Stack(){
          Image($r('app.media.Card'))
            .width('98%')
          Column(){
            Text('膝关节综合评分')
              .fontColor('#2a6049')
              .fontSize(15)
              .fontWeight(600)
            Row({space:15}){
              // this.tag(this.Level,'#fece46',45)
              Column(){
                Text(this.Level)
                  .fontColor('#fff7fffa')
                  .fontSize(14)
              }
              .borderRadius(10)
              .backgroundColor(this.LevelTagcolor)
              .height(20)
              .width(45)
              .justifyContent(FlexAlign.Center)


              Text(this.score.toString())
                .fontColor('#fff')
                .fontSize(30)
                .fontWeight(700)
            }

            Text('分')
              .fontColor(Color.White)
              .fontSize(15)
              .fontWeight(600)

          }
          .margin({left:'57%',bottom:'3%',top:'3%'})
          .alignItems(HorizontalAlign.End)
          //日期显示

          // Text(DateUtil.formatDate(this.date))
          //   .fontSize(15)
          //   .fontWeight(600)
          //   .fontColor('#2a6049')
          //   .margin({left:'40%',top:'25%'})
          //   .letterSpacing(1.5)

          //评分状态条
          Progress({ value: this.score, total: 100, type: ProgressType.Linear })
            .width(160)
            .height(50)
            .margin({left:'40%',top:'26%'})
            .style({strokeWidth:6})
            .color(this.progree_color(86))
            .backgroundColor('#92ffffff')


        }
        .width('100%')
        .height(200)
        .margin({top:-10})
        // .backgroundImage($r('app.media.Card'))
        // .backgroundImageSize({width:'100%',height:160})

      }
      .width('100%')
      .height('35%')
      .alignItems(HorizontalAlign.Start)
      .margin({bottom:30})
    Scroll(){
        Column(){
          Row(){
            Flex({wrap:FlexWrap.Wrap}){
              Row(){
                Text('肿胀程度')
                  .fontWeight(800)
                  .fontSize(16)
                  .layoutWeight(4)
                Image($r("app.media.eggs"))
                  .width('20%')
                  .height('20%')
                  .layoutWeight(1)
              }
              .padding({top:15,left:10,right:10})
              Row(){
                Column(){
                  Row({space:5}){
                    Text(this.swal.toString())
                      .fontWeight(700)
                      .fontSize(25)
                    Text('/0')
                      .fontWeight(500)
                      .fontSize(15)
                      .fontColor('#ffa9a9a9')

                    // this.tag('正常','#2ecc71',45)
                    Column(){
                      Text(this.swalLevel)
                        .fontColor('#fff7fffa')
                        .fontSize(14)
                    }
                    .borderRadius(10)
                    .backgroundColor(this.swalLevelTagcolor)
                    .height(20)
                    .width(45)
                    .justifyContent(FlexAlign.Center)
                  }
                  Text('厘米')
                    .fontColor('#ffa9a9a9')
                    .fontWeight(600)
                    .fontSize(15)
                    .margin({top:5})
                }
                .margin({top:35,left:10,right:8})
                .alignItems(HorizontalAlign.Start)
                Button('+',{type:ButtonType.Normal})
                  .width(40)
                  .height(40)
                  .backgroundColor('#2a6049')
                  .margin({top:40})
                  .fontSize(30)
                  .fontWeight(500)
                  .borderRadius(10)
                  .padding(0)
              }

            }

            // .borderWidth(2)
            .borderRadius(10)
            .height(150)
            // .borderColor('#63c4c4c4')
            .margin({left:10,right:10})
            .layoutWeight(1)
            .backgroundColor('#3bbacac2')
            Flex({wrap:FlexWrap.Wrap}){
              Row(){
                Text('步态评分')
                  .fontWeight(800)
                  .fontSize(16)
                  .layoutWeight(4)
                Image($r("app.media.walk"))
                  .width('20%')
                  .height('20%')
                  .layoutWeight(1)
              }
              .padding({top:15,left:10,right:10})
              Row(){
                Column(){
                  Row({space:5}){
                    Text(this.walkScore.toString())
                      .fontWeight(700)
                      .fontSize(25)
                    Text('/100')
                      .fontWeight(500)
                      .fontSize(15)
                      .fontColor('#ffa9a9a9')

                    // this.tag('良好','#fece46',45)
                    Column(){
                      Text(this.walkLevel)
                        .fontColor('#fff7fffa')
                        .fontSize(14)
                    }
                    .borderRadius(10)
                    .backgroundColor(this.walkLevelTagcolor)
                    .height(20)
                    .width(45)
                    .justifyContent(FlexAlign.Center)
                  }

                  Text('分')
                    .fontColor('#ffa9a9a9')
                    .fontWeight(600)
                    .fontSize(15)
                    .margin({top:5})
                }
                .margin({top:35,left:10,right:30})
                .alignItems(HorizontalAlign.Start)

              }

            }
            // .borderWidth(2)
            .borderRadius(10)
            .height(150)
            // .borderColor('#63c4c4c4')
            .margin({left:10,right:10})
            .layoutWeight(1)
            .backgroundColor('#7affe2d3')
          }
          .width('100%')
          .margin({bottom:20})

          Row(){
            Flex({wrap:FlexWrap.Wrap}){
              Row(){
                Text('下肢皮肤温度')
                  .fontWeight(800)
                  .fontSize(16)
                  .layoutWeight(4)
                Image($r("app.media.temp"))
                  .width('22%')
                  .layoutWeight(1)

              }
              .padding({top:15,left:10,right:10})
              Row(){
                Image($r('app.media.drink'))
                  .width('80%')

              }
              .margin({top:30})
              .width('100%')
              .justifyContent(FlexAlign.Center)
              Row(){
                Column(){
                  Row({space:5}){
                    Text(this.tempe.toString())
                      .fontWeight(700)
                      .fontSize(25)
                    Text('/33-35')
                      .fontWeight(500)
                      .fontSize(15)
                      .fontColor('#ffa9a9a9')

                    // this.tag('良好','#fece46',45)

                    Column(){
                      Text(this.tempeLevel)
                        .fontColor('#fff7fffa')
                        .fontSize(14)
                    }
                    .borderRadius(10)
                    .backgroundColor(this.tempeLevelTagcolor)
                    .height(20)
                    .width(45)
                    .justifyContent(FlexAlign.Center)
                  }
                  Text('摄氏度')
                    .fontColor('#ffa9a9a9')
                    .fontWeight(600)
                    .fontSize(15)
                    .margin({top:5})
                }
                .margin({top:20,left:10,right:30})
                .alignItems(HorizontalAlign.Start)

              }

            }

            // .borderWidth(2)
            .borderRadius(10)
            .height(230)
            // .borderColor('#63c4c4c4')
            .margin({left:10,right:10})
            .layoutWeight(1)
            .backgroundColor('#7affe2d3')

            Column(){
              Flex({wrap:FlexWrap.Wrap}){
                Row(){
                  Text('膝关节活动范围(ROM)')
                    .fontWeight(800)
                    .fontSize(16)
                    .layoutWeight(4)
                  Image($r("app.media.knee_color"))
                    .width('22%')
                    .layoutWeight(1)
                }
                .padding({top:15,left:10,right:7})
                Row(){
                  Column(){

                    Row({space:5}){
                      Text(this.active.toString())
                        .fontWeight(700)
                        .fontSize(25)
                      Text('/135')
                        .fontWeight(500)
                        .fontSize(15)
                        .fontColor('#ffa9a9a9')

                      // this.tag('危险','#f47373',45)
                      Column(){
                        Text(this.activeLevel)
                          .fontColor('#fff7fffa')
                          .fontSize(14)
                      }
                      .borderRadius(10)
                      .backgroundColor(this.activeLevelTagcolor)
                      .height(20)
                      .width(45)
                      .justifyContent(FlexAlign.Center)
                    }
                    Text('度')
                      .fontColor('#ffa9a9a9')
                      .fontWeight(600)
                      .fontSize(15)
                      .margin({top:5,bottom:5})
                    this.tag('继续保持','#ffa9a9a9',120)

                  }
                  .margin({top:30,left:10,right:30})
                  .alignItems(HorizontalAlign.Start)

                }

              }

              // .borderWidth(2)
              .borderRadius(10)
              .height(100)
              // .borderColor('#63c4c4c4')
              .margin({left:10,right:10})
              .layoutWeight(3)
              .backgroundColor('#3bbacac2')
              Button('+ 上传',{type: ButtonType.Normal})
                .layoutWeight(1)
                .backgroundColor(Color.Transparent)
                .margin({top:10,left:10,right:10})
                .fontSize(16)
                .fontWeight(700)
                .borderRadius(20)
                .padding(0)
                .width('90%')
                .borderWidth(2)
                .borderColor('#ec7951')
                .fontColor('#ec7951')
                .onClick(() => {
                  this.loadFile();

                })



            }
            .layoutWeight(1)
            .height(230)

          }
        }
        .width('100%')
        .height(520)
    }
    .width('100%')
    .height(490)
    }
    .width('100%')
    .height('100%')
  }

  // 测量逻辑：5秒后生成随机数并更新分数和等级
  private startMeasurement(): void {

    prompt.showToast({
      message: "正在计算中，请稍后...",
      duration: 2000
    })
    this.isMeasuring = true; // 设置测量状态
    this.score = 0; // 重置分数
    this.Level = ''; // 重置等级

    setTimeout(() => {
      // 生成随机数 80-95
      // const randomScore = Math.floor(Math.random() * (95 - 80 + 1)) + 80;
      // this.score = randomScore;
        this.temptRandom();
      this.activityRandom();
      this.swellingRandom();
      this.walkStatus();

      // 假设已有各项评分
      const randomScore = Math.round((this.walkScore + this.swalScore + this.activeScore + this.tempeScore) / 4);
      this.score = randomScore;
      // 根据分数段设置等级
      if (randomScore <= 90) {
        this.Level = '良好';
        this.LevelTagcolor = '#fece46'
      } else {
        this.Level = '优秀';
        this.LevelTagcolor = '#2ccc70'
      }

      // 更新弹窗内容
      AlertDialog.show({
        title: '计算结果',
        message: `计算完成：分数为 ${this.score}，等级为 ${this.Level}。`,
        autoCancel: false,
        alignment: DialogAlignment.Center,
        primaryButton: {
          value: '关闭',
          action: () => {
            this.isMeasuring = false; // 测量结束
          },
        },
      });
    }, 2000); // 2秒后执行
  }

  //温度生成逻辑
  private temptRandom(): void {
    // 生成随机温度
    this.tempe = parseFloat((Math.random() * (35.5 - 32.5) + 32.5).toFixed(1));


    // 根据温度范围计算分数
    if (this.tempe >= 33.0 && this.tempe < 35.0) {
      this.tempeScore = 100; // 正常范围内直接得 100 分
    } else if ((this.tempe >= 32.5 && this.tempe < 33.0) || (this.tempe >= 35.0 && this.tempe < 35.5)) {
      const deviation = Math.abs(this.tempe - 34.0); // 偏离中心点 34.0 的绝对值
      const deduction = Math.floor(deviation / 0.1) * 2; // 每偏离 0.1°C 扣 2 分
      this.tempeScore = Math.max(80, 100 - deduction); // 确保最低分为 80 分
    } else {
      this.tempeScore = 0; // 超出范围返回 0 分
    }
    // 根据分数段设置等级
    if (this.tempeScore <= 90) {
      this.tempeLevel = '良好';
      this.tempeLevelTagcolor = '#fece46'
    } else {
      this.tempeLevel = '优秀';
      this.tempeLevelTagcolor = '#2ccc70'
    }

    // 打印结果
    console.info(`Temperature: ${this.tempe.toFixed(1)}°C, Score: ${this.tempeScore}`);
  }

  //活动度生成逻辑
  private activityRandom(): void {
    // 生成随机活动范围范围 [120, 150]
    this.active = parseFloat((Math.random() * (150 - 120) + 120).toFixed(1));

    // 根据活动范围计算分数
    const idealAngle = 135; // 最佳角度
    const maxDeductionPerDegree = 1.33; // 每偏差1°扣1.33分
    const maxScore = 100; // 满分
    const minScore = 80; // 最低分

    if (this.active === idealAngle) {
      this.activeScore = maxScore; // 完美角度直接满分
    } else if (this.active > 120 && this.active < 150) {
      const deviation = Math.abs(this.active - idealAngle); // 偏差值
      const deduction = deviation * maxDeductionPerDegree; // 计算扣分
      this.activeScore = Math.max(minScore, maxScore - deduction); // 确保最低分为80
    } else {
      this.activeScore = minScore; // 超出范围固定最低分
    }
    // 根据分数段设置等级
    if (this.activeScore <= 90) {
      this.activeLevel = '良好';
      this.activeLevelTagcolor = '#fece46'
    } else {
      this.activeLevel = '优秀';
      this.activeLevelTagcolor = '#2ccc70'
    }


    // 打印结果
    console.info(`Activity Range: ${this.active.toFixed(2)}°, Score: ${this.activeScore.toFixed(2)}`);
  }

  //肿胀程度生成逻辑
  private swellingRandom(): void {
    // 生成随机肿胀程度范围 [0.5, 2.5]
    this.swal = parseFloat((Math.random() * (2.5 - 0.5) + 0.5).toFixed(1));

    // 根据肿胀程度范围计算分数
    if (this.swal <= 0.5) {
      this.swalScore = 100; // 正常范围直接得 100 分
    } else if (this.swal > 0.5 && this.swal <= 2.5) {
      const difference = this.swal - 0.5; // 偏离正常范围的值
      const deduction = Math.floor(difference / 0.1) * 1; // 每偏离 0.1 cm 扣 1 分
      this.swalScore = Math.max(80, 100 - deduction); // 确保最低分为 80 分
    } else {
      this.swalScore = 80; // 超出范围固定 80 分
    }

    // 根据分数段设置等级
    if (this.swalScore <= 90) {
      this.swalLevel = '良好';
      this.swalLevelTagcolor = '#fece46'
    } else {
      this.swalLevel = '优秀';
      this.swalLevelTagcolor = '#2ccc70'
    }

    // 打印结果
    console.info(`Swelling: ${this.swal.toFixed(2)} cm, Score: ${this.swalScore}`);
  }

  private walkStatus(): void{
    // 生成随机肿胀程度范围 [0.5, 2.5]
    this.walkScore = parseFloat((Math.random() * (100 - 80) + 80).toFixed(1));
    // 根据分数段设置等级
    if (this.walkScore <= 90) {
      this.walkLevel = '良好';
      this.walkLevelTagcolor = '#fece46'
    } else {
      this.walkLevel = '优秀';
      this.walkLevelTagcolor = '#2ccc70'
    }
  }


}