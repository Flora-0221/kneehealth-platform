import UserPrivacyDialog from '../dialog/UserPrivacyDialog'
import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';
import { router } from '@kit.ArkUI';

//定义常量存储首选项中的键
const H_STORE:string = 'JianXinKeepStore'
const IS_PRIVACY: string = 'isPrivacy'

@Entry
@Component
struct Index {
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  dialogController: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      cancel: ()=> {this.exitApp()},
      confirm: ()=>{this.onConfirm()}
    })
  })

  //答应了用户协议
  onConfirm(){
    //定义首选项
    let preferences = data_preferences.getPreferences(this.context,H_STORE)
    //异步处理首选项中的数据
    preferences.then((res)=>{
      //记录用户数据到首选项
      res.put(IS_PRIVACY,true).then(()=>{
        res.flush();
        //输出
        console.log('记录用户首选项成功');
      }).catch((err: Error)=>{
        //输出
        console.log('记录用户首选项失败,原因: '+err);
      })
    })
  }

  //退出app
  exitApp(){
    this.context.terminateSelf()
  }
  aboutToAppear(){
    let preferences = data_preferences.getPreferences(this.context, H_STORE)
    preferences.then((res)=>{
      res.get(IS_PRIVACY,false).then((isPrivate)=>{
        //判断传入的参数值
        if(isPrivate == true){
          //用户已经点击过同意
          this.aboutToDisappear()
        }
        else {
          //弹出弹窗
          this.dialogController.open()
        }

      })
    })
    this.dialogController.open()
  }

  //页面关闭
  aboutToDisappear() {
    setTimeout(()=>{
      router.replaceUrl({url:''})
    },2000)
  }

  build() {
    Column() {
      Image($r('app.media.bacColor'))
        .opacity(0.5)
        .position({x:0,y:0})
        .width('100%')
        .height('100%')
      Image($r('app.media.medical'))
        .width(300)
        .margin({top: 100})

      Text('欢迎进入健行助手')
        .id('medical')
        .fontSize(25)
        .fontWeight(700)
        .letterSpacing(0.1)
        .fontColor('#baffffff')
        .margin({top:20,bottom:100})
      Button('开 始')
        .fontSize(18)
        .backgroundColor('#2a6049')
        .width('70%')
        .padding({top:10,bottom:10})
        .onClick(()=>{
          router.replaceUrl({url:'pages/login'})
        })
    }
    .height('120%')
    .width('100%')
    .backgroundColor('#667ac88b')
    .margin({top:-40})

  }
}