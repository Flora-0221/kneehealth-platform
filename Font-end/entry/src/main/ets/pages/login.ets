import { promptAction, router } from '@kit.ArkUI'
import prompt from '@ohos.promptAction';
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { API, LOGIN_PATH } from '../apiService/APIConstant';

import axios from '@ohos/axios';


interface LoginResponse {
  success: boolean;
  data: LoginJobDTO;
}
interface LoginJobDTO{
  job: number;
  token:string;
}


interface loginModel {
  // 在这里定义您要发送的参数
  /**
   * 用户密码
   */
  password?: string;

  /**
   * 用户手机号
   */
  phone?: string;

}

@Entry
@Component

struct login {

  @State account:string = ''
  @State password:string = ''
  @State isShowProgress : boolean = false
  @State isAble:boolean = false

  async Login(): Promise<void>{
    if(this.account == ''||this.password == ''){
      prompt.showToast({
        message: '账号或者密码不能为空'
      })
    }else{
      const axiosInstance = axios.create({
        baseURL: API
      })

      const res =
        await axiosInstance.post<LoginResponse, AxiosResponse<LoginResponse, null>, loginModel>('/users/login',
          { password: this.password, phone: this.account }
        )

      if(res.data.success == true){
        this.isShowProgress = false;
        const token = res.data.data.token; // token在res.data.data中
        AppStorage.SetOrCreate('token',token);
        console.log(JSON.stringify(res));
        console.info("登录成功！");
        prompt.showToast({
          message: '登录成功！'
        })
        if(res.data.data.job == 0){
          router.pushUrl({url:'pages/MainIndex'});
        }else{
          router.pushUrl({url:'pages/DMainIndex'});
        }

      }else{

        (error: Error) => {
          prompt.showToast({
            message: '登录失败'
          })
          console.info("登录失败"+JSON.stringify(error));
        }
      }
      // AlertDialog.show({ message: JSON.stringify(res, null, 2) })
    }
  }
  // 构建 -> 界面
  build() {
    Stack(){
      Column({space: 15}){
        Text('登录')
          .fontWeight(700)
          .margin({bottom:40})
        Image($r('app.media.login'))
          .width(150)
        Column({space: 15}){
          Text('账号')
            .fontColor('#d28d8d8d')
            .fontSize(15)
            .fontWeight(600)
          TextInput({
            placeholder: '请输入账号'
          })
            .placeholderColor('#d28d8d8d')
            .backgroundColor(Color.Transparent)
            .borderWidth(2)
            .borderColor('#86d2d2d2')
            .maxLength(11)
            .type(InputType.Number)
            .onChange((value:string)=>{
              this.account = value
              if(this.account !=''&& this.password!=''){
                this.isAble = true
              }
            })
          Text('密码')
            .fontColor('#d28d8d8d')
            .fontSize(15)
            .fontWeight(600)
          TextInput({
            placeholder: '请输入密码'
          })
            .placeholderColor('#d28d8d8d')
            .backgroundColor(Color.Transparent)
            .borderWidth(2)
            .borderColor('#86d2d2d2')
            .type(InputType.Password)
            .fontColor('#d28d8d8d')
            .onChange((value:string)=>{
              this.password = value
              if(this.account !=''&& this.password!=''){
                this.isAble = true
              }
            })
        }
        .alignItems(HorizontalAlign.Start)
        Button('登录')
          .width('100%')
          .margin({top:30})
          .backgroundColor('#2a6049')
          .enabled(this.isAble)
          .onClick(
            async () => {
              this.isShowProgress = true;
              //   创建一个axios实例，内部做一些axios通用配置
              this.Login();
            })
        Row({space: 25}){
          Text('前往注册')
            .fontColor('#2a6049')
            .fontSize(15)
            .onClick(()=>{
              router.pushUrl({url:'pages/register'})
            })

          Text('忘记密码')
            .fontColor('#865b5b5b')
            .fontSize(15)
            .onClick(()=>{
              router.pushUrl({url:'pages/findPassword'})
            })
        }
      }
      .padding(30)
      .width('100%')
      Column(){
        if(this.isShowProgress){
          Stack(){
            Column().backgroundColor('#8ab7b7b7').width('100%').height('100%')
            LoadingProgress()
              .width(60)
              .height(60)
              .color('#2a6049')
          }

        }
      }
    }

  }
}