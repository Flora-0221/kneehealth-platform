import jobChoose from '../view/register/jobChoose'
import { promptAction, router } from '@kit.ArkUI'
import prompt from '@ohos.promptAction';
import axios, { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { API, LOGIN_PATH, REGISTER_PATH } from '../apiService/APIConstant';
import { appHttpRequest } from '../apiService/NetWorkAPI';
import { ResponseResult } from '../model/ResponseResult';
import { url } from '@kit.ArkTS';

interface registerModel {
  // 在这里定义您要发送的参数
  /**
   * 用户密码
   */
  password?: string;

  /**
   * 用户手机号
   */
  phone?: string;

  /**
   * 用户性别
   */
  gender?:string;

  /**
   * 用户职业
   */

  occupation?:string;
}

@Entry
@Component

struct chooseJobPage {
  @State check:number=0 //单选项的下标

  @State paccount:string = (router.getParams() as Record<string,string>)['account']
  @State ppassword:string = (router.getParams() as Record<string,string>)['password']
  @State gender:string = (router.getParams() as Record<string,string>)['gender']

  @State isAble:boolean = false
  build() {
    Column(){
      Row(){
        Column(){
          Stack(){
            Text('你的身份')
              .margin({bottom:10})
              .width('100%')
              .fontWeight(700)
              .textAlign(TextAlign.Center)
            Button({type:ButtonType.Normal}){
              Image($r('app.media.left_arrow'))
                .fillColor('#ff696969')
                .width('60%')
            }
            .borderWidth(2)
            .backgroundColor(Color.Transparent)
            .position({x:0})
            .borderRadius(10)
            .borderColor('#28aeaeae')
            .width(40)
            .height(40)
            .onClick(()=>{
              router.back()

            })
          }
          jobChoose({ischeck:$check,radionum:2,radiotext:['医生','患者'],PicRoute:['app.media.doctor','app.media.patient']})
        }.margin({left:5,top:10,bottom:10}).borderRadius(7).padding(10).layoutWeight(4)
      }.width('100%')
      Button('下一步')
        .width('90%')
        .margin({top:160})
        .backgroundColor('#2a6049')
        .onClick(



          // new Promise<number>((resolve,reject)=>{
          //   const params: registerModel = {
          //     // 定义要发送的参数
          //     phone: this.paccount,
          //     password: this.ppassword,
          //     gender: this.ge1nder,
          //     occupation:this.check === 0 ? 'doctor' : 'patient'
          //   };
          //   const config: AxiosRequestConfig={method:'post',url:REGISTER_PATH,data: params}
          //   appHttpRequest(config)
          //     .then((res:AxiosResponse<ResponseResult<number>>)=>{
          //       if(res.status == 200){
          //         if(res.data.flag){
          //           if(res.data.data == null){
          //             reject("服务器异常，没有数据接收")
          //           }
          //           else{
          //             resolve(res.data.data)
          //           }
          //         }else {
          //           reject(res.data.message)
          //         }
          //
          //       }
          //       else{
          //         console.log("注册异常")
          //         reject("网络请求异常：code"+res.status)
          //       }
          //
          //     })
          //     .catch((error:String)=>{
          //       reject('网络请求异常：'+JSON.stringify(error))
          //     })
          //
          // })
          //   .then((data: number)=>{
          //     console.log("注册成功")
          //     console.info('data',JSON.stringify(data))
          //     prompt.showToast({
          //       message: '注册成功！'
          //     })
          //     router.pushUrl({
          //       url: 'pages/login',
          //       params:{
          //         account: this.paccount,
          //         password: this.ppassword
          //       }
          //
          //     })
          //   }).catch((error:string)=>{
          //   promptAction.showToast({message:error})
          // })

          async () => {
            console.log(this.check.toString());
            //   创建一个axios实例，内部做一些axios通用配置
            const axiosInstance = axios.create({
              baseURL: API
            })
            const res = await axiosInstance.post<null, null, registerModel>(REGISTER_PATH,
              { password: this.ppassword, phone: this.paccount,gender:this.gender,occupation:this.check === 0 ? 'doctor' : 'patient' }
            )
            AlertDialog.show({ message: JSON.stringify(res, null, 2) })
            router.pushUrl({url:'/pages/login'});
        })
    }
  }
}