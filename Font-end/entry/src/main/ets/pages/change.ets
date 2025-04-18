import { router } from '@kit.ArkUI'
import prompt from '@ohos.promptAction';
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { CHANGEMYPASS } from '../apiService/APIConstant';
import { appHttpRequest } from '../apiService/NetWorkAPI';
import { ResponseResult } from '../model/ResponseResult';

@Entry
@Component
@Preview
struct register {
  @State account:string = ''
  @State password1:string = ''
  @State password2:string = ''
  @State isAble:boolean = false

  // 构建 -> 界面
  build() {
    Column({space: 15}){
      Stack(){
        Text('修改账号密码')
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
        .position({x:0})
        .borderRadius(10)
        .borderColor('#28aeaeae')
        .width(40)
        .height(40)
        .onClick(()=>{
          router.back()

        })

      }
      .width('100%')
      Image($r('app.media.login'))
        .width(150)
      Column({space: 15}){
        Text('输入手机号')
          .fontColor('#d28d8d8d')
          .fontSize(15)
          .fontWeight(600)
        TextInput({
          placeholder: '请输入手机号'
        })
          .placeholderColor('#d28d8d8d')
          .backgroundColor(Color.Transparent)
          .borderWidth(2)
          .borderColor('#86d2d2d2')
          .onChange((value:string)=>{
            this.account = value
            if ((this.account != '') && (this.password1 != '') && (this.password2 != '')) {
              this.isAble  = true
            }
          })
        Text('新密码')
          .fontColor('#d28d8d8d')
          .fontSize(15)
          .fontWeight(600)
        TextInput({
          placeholder: '请输入新密码，至少6位'
        })
          .placeholderColor('#d28d8d8d')
          .backgroundColor(Color.Transparent)
          .borderWidth(2)
          .borderColor('#86d2d2d2')
          .type(InputType.Password)
          .fontColor('#d28d8d8d')
          .onChange((value:string)=>{
            this.password1 = value
            if ((this.account != '') && (this.password1 != '') && (this.password2 != '')) {
              this.isAble  = true
            }
          })
        Text('确认新密码')
          .fontColor('#d28d8d8d')
          .fontSize(15)
          .fontWeight(600)
        TextInput({
          placeholder: '请再次输入新密码'
        })
          .placeholderColor('#d28d8d8d')
          .backgroundColor(Color.Transparent)
          .borderWidth(2)
          .borderColor('#86d2d2d2')
          .type(InputType.Password)
          .fontColor('#d28d8d8d')
          .onChange((value:string)=>{
            this.password2 = value
            if ((this.account != '') && (this.password1 != '') && (this.password2 != '')) {
              this.isAble  = true
            }
          })

      }
      .margin({top:20})
      .alignItems(HorizontalAlign.Start)
      Button('完成')
        .enabled(this.isAble)
        .width('100%')
        .margin({top:30})
        .backgroundColor('#2a6049')
        .onClick(async  () =>{
          this.change();
        })


    }
    .padding(30)
    .width('100%')
  }
  async change():Promise<void>{

      if(this.account == ''||this.password1 ==''|| this.password2==''){
        prompt.showToast({
          message: '账号或者密码不能为空'
        })
      }
      else if (this.password1 !== this.password2){
        prompt.showToast({
          message: '两次输入的密码不一致'
        })
      }
      else{
        new Promise<string>((resolve,reject)=>{
          const config : AxiosRequestConfig = {
            method:'put',
            url:CHANGEMYPASS,
            data:{
              "phone": this.account,
              "password": this.password2
            }

          }

          appHttpRequest(config).then((res:AxiosResponse<ResponseResult<string>>)=>{
            if(res.status == 200){
              if(res.data.data){
                prompt.showToast({
                  message: '修改成功'
                })
                resolve(res.data.data);
              }else{
                reject('没有数据 请求失败 无法更新')
              }
            }else {
              prompt.showToast({
                message: '网络请求异常'
              })
              reject('网络请求异常:code ' + res.status)
            }
          })
            .catch((error:Error)=>{
              reject('网络请求异常:' + JSON.stringify(error))
            })
        }).then((data:string)=>{
          console.info("修改密码成功" , JSON.stringify(data));
        }).catch((error:string)=>{
          prompt.showToast({
            message: '网络请求异常'
          })
          console.log(error)
        })
        router.back()
      }
    }

}