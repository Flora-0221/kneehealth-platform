import { router } from '@kit.ArkUI'
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { GETMYDATA,LOGOUT } from '../../apiService/APIConstant';
import { appHttpRequest } from '../../apiService/NetWorkAPI';
import { ResponseResult } from '../../model/ResponseResult';
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
@Preview
export default struct MineContent{

  @State nickName:string = '';
  @State email:string = '';

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
            this.email = res.data.data.email;
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


  }

  async logout():Promise<void>
  {
    new Promise<dataModel>((resolve,reject)=>{
      const config : AxiosRequestConfig = {
        method:'get',
        url:LOGOUT
      }

      appHttpRequest(config).then((res:AxiosResponse<ResponseResult<dataModel>>)=>{
        if(res.status == 200){
          if(res.data.success){
            prompt.showToast({
              message: "登出成功"
            })
            router.pushUrl({url:'pages/login'})
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
    }).catch((err:string)=>{
      console.log(err);
    })


  }
  build() {

    Column(){
      Column(){
        Row(){
          Text('个人')
            .fontColor(Color.White)
            .fontSize(20)
            .fontWeight(700)
            .layoutWeight(4)
          Button({type:ButtonType.Normal}){
            Image($r('app.media.Edit'))
              .height('10%')

          }.onClick(()=>{
            router.pushUrl({url:'pages/setting_personal_info'})
          })
            .fontColor(Color.White)
            .backgroundColor(Color.Transparent)
            .layoutWeight(1)


        }
        .width('100%')
        .padding({top:30,left:20,bottom:30})
        .justifyContent(FlexAlign.SpaceBetween)
        Column({space:10}){

          Image($r('app.media.user'))
            .width('25%')
            .backgroundColor($r('app.color.green_app'))
            .borderRadius('50%')
            .padding(10)

          Row({space:5}){
            Text(this.nickName)
              .fontSize(20)
              .fontColor('#264972')
              .fontWeight(800)
              .letterSpacing(1)
            Image($r('app.media.verified'))
              .width(20)
          }

          Text(this.email)
            .fontColor('#ff868686')
            .fontSize(15)
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .width('90%')
        .height(220)
        .shadow(1)
      }
      .width('100%')
      .height('35%')
      .backgroundColor('#2a6049')
      .borderRadius({bottomRight:60})

      Scroll(){
        Column(){
          Column({space:10}) {
            Text('列表')
              .fontWeight(700)
              .fontColor('#79889f')
            Row(){
              Stack(){
                Row().backgroundColor('#dfe7f5').width(45).height(45).borderRadius(10)
                Image($r('app.media.setting'))
                  .width('50%')
              }.layoutWeight(1).padding(5)
              Column(){
                Text('设置')
                  .fontSize(15)
                  .fontColor('#0e3462')
                  .fontWeight(700)
                Text('修改更新你的个人信息')
                  .fontSize(13)
                  .fontColor('#ff9b9b9b')
                  .fontWeight(500)
              }
              .layoutWeight(4)
              .padding(10)
              .alignItems(HorizontalAlign.Start)
              Image($r('app.media.right'))
                // .width('10%')
                // .layoutWeight(1)
                .size({height: 13,width:13})
                .margin({right:10})
            }
            .onClick(()=>{
              router.pushUrl({url:'pages/setting_personal_info'})
            })
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(10)
            .height(60)
            Row(){
              Stack(){
                Row().backgroundColor('#dfe7f5').width(45).height(45).borderRadius(10)
                Image($r('app.media.security'))
                  .width('50%')
              }.layoutWeight(1).padding(5)
              Column(){
                Text('安全')
                  .fontSize(15)
                  .fontColor('#0e3462')
                  .fontWeight(700)
                Text('修改密码')
                  .fontSize(13)
                  .fontColor('#ff9b9b9b')
                  .fontWeight(500)
              }
              .layoutWeight(4)
              .padding(10)
              .alignItems(HorizontalAlign.Start)
              Image($r('app.media.right'))
                // .width('10%')
                // .layoutWeight(1)
                .size({height: 13,width:13})
                .margin({right:10})
            }
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(10)
            .height(60)
            .onClick(()=>{
              router.pushUrl({url:'pages/change'})
            })
            Row(){
              Stack(){
                Row().backgroundColor('#dfe7f5').width(45).height(45).borderRadius(10)
                Image($r('app.media.alarming'))
                  .width('50%')
              }.layoutWeight(1).padding(5)
              Column(){
                Text('提醒')
                  .fontSize(15)
                  .fontColor('#0e3462')
                  .fontWeight(700)
                Text('修改提醒设置')
                  .fontSize(13)
                  .fontColor('#ff9b9b9b')
                  .fontWeight(500)
              }
              .layoutWeight(4)
              .padding(10)
              .alignItems(HorizontalAlign.Start)
              Image($r('app.media.right'))
                // .width('10%')
                // .layoutWeight(1)
                .size({height: 13,width:13})
                .margin({right:10})
            }
            .onClick(()=>{
              router.pushUrl({url:'pages/setting'})
            })
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(10)
            .height(60)

          }
          .width('90%')
          .height(100)
          // .margin({top:100})
          .alignItems(HorizontalAlign.Start)

          Column({space:10}) {
            Text('图表')
              .fontWeight(700)
              .fontColor('#79889f')
            Row(){
              Stack(){
                Row().backgroundColor('#dfe7f5').width(45).height(45).borderRadius(10)
                Image($r('app.media.chart'))
                  .width('50%')
              }.layoutWeight(1).padding(5)
              Column(){
                Text('展示数据')
                  .fontSize(15)
                  .fontColor('#0e3462')
                  .fontWeight(700)
                Text('健康数据可视化')
                  .fontSize(13)
                  .fontColor('#ff9b9b9b')
                  .fontWeight(500)
              }
              .layoutWeight(4)
              .padding(10)
              .alignItems(HorizontalAlign.Start)
              Image($r('app.media.right'))
                // .width('10%')
                // .layoutWeight(1)
                .size({height: 13,width:13})
                .margin({right:10})
            }
            .width('100%')
            .backgroundColor(Color.White)
            .borderRadius(10)
            .height(60)

          }
          .onClick(()=>{
            router.pushUrl({url:'pages/setting'})
          })
          .width('90%')
          .height(100)
          .margin({top:150})
          .alignItems(HorizontalAlign.Start)

          Button('退出登录')
            .width('90%')
            .margin({top:30,bottom:30})
            .backgroundColor('#2a6049')
            .onClick(()=>{
              this.logout();
            })
        }
      }
      .height(320)
      .margin({top:100})
      .width('100%')

    }
    .backgroundColor('#52dedede')
    .width('100%')
    .height('100%')
  }
}

