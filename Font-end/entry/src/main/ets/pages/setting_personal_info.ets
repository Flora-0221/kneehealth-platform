import { router } from '@kit.ArkUI';
import { AxiosRequestConfig, AxiosResponse } from '@ohos/axios';
import { GETMYDATA, UPDATEMYDATA } from '../apiService/APIConstant';
import { appHttpRequest } from '../apiService/NetWorkAPI';
import { ResponseResult } from '../model/ResponseResult';
import selection from '../utils/selection';
import { JSON } from '@kit.ArkTS';
import prompt from '@ohos.promptAction';
import { emitter } from '@kit.BasicServicesKit';

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
  idCardNumber:string;
  ethnicity:string;
  hospitalId:string;
  height:number;
  weight:number;
  bmi:number;
  weightIncreaseAge:number;
  maritalStatus:string;
  workUnit:string;
  familyContactPhone:string;

}

interface updateRequestData{
  nickName : string
  email:string
  maritalStatus?:string
  ethnicity:string
  hospitalId?:string
   country ?:string
  address ?:string
  height ?:number
   weight ?:number
  bmi ?:number
  workUnit ?:string
  weightIncreaseAge ?:number
  idCardNumber ?:string
  familyContactPhone ?:string
  // birthdate?: Date
  age?: number
  gender ?: string


}



@Preview
@Component
@Entry
struct setting{



  @State marry_show?:string = '';
  @State mz_show:string = ''
  @State message: string = '个人信息'
  @State name?:string = '';
  @State ID?:string ='';
  @State phone ?:string = ''
  @State email ?:string = ''
  @State country ?:string = ''
  @State address ?:string = ''
  @State high ?:number = 0
  @State weight ?:number = 0;
  @State BMI ?:number = 0;
  @State gzdw ?:string = ''
  @State age_weight_grow ?:number = 0;
  @State IDCARD ?:string = ''
  @State family_phone ?:string = ''
  @State Birth?: Date = new Date()
  @State age?: number = 0
  @State gender_show ?: string = '女';



  @State mz: SelectOption[] = [
    { value: '汉族' },
    { value: '蒙古族' },
    { value: '回族' },
    { value: '藏族' },
    { value: '维吾尔族' },
    { value: '苗族' },
    { value: '彝族' },
    { value: '壮族' },
    { value: '布依族' },
    { value: '朝鲜族' },
    { value: '满族' },
    { value: '侗族' },
    { value: '瑶族' },
    { value: '白族' },
    { value: '土家族' },
    { value: '哈尼族' },
    { value: '哈萨克族' },
    { value: '傣族' },
    { value: '黎族' },
    { value: '僳僳族' },
    { value: '佤族' },
    { value: '畲族' },
    { value: '高山族' },
    { value: '拉祜族' },
    { value: '水族' },
    { value: '东乡族' },
    { value: '纳西族' },
    { value: '景颇族' },
    { value: '柯尔克孜族' },
    { value: '土族' },
    { value: '达斡尔族' },
    { value: '仫佬族' },
    { value: '羌族' },
    { value: '布朗族' },
    { value: '撒拉族' },
    { value: '毛南族' },
    { value: '仡佬族' },
    { value: '锡伯族' },
    { value: '阿昌族' },
    { value: '普米族' },
    { value: '塔吉克族' },
    { value: '怒族' },
    { value: '乌孜别克族' },
    { value: '俄罗斯族' },
    { value: '鄂温克族' },
    { value: '德昂族' },
    { value: '保安族' },
    { value: '裕固族' },
    { value: '京族' },
    { value: '塔塔尔族' },
    { value: '独龙族' },
    { value: '鄂伦春族' },
    { value: '赫哲族' },
    { value: '门巴族' },
    { value: '珞巴族' },
    { value: '基诺族' }
  ];


  @State marry: SelectOption[] = [{ value: '是' }, { value: '否' }]
  @State gender: SelectOption[] = [{ value: '男' }, { value: '女' },{ value: '其他' }]

  @Builder Header(head:string){
    Text(head).fontSize(17).fontWeight(700)
  }
  @Builder radio(group:string, value:string,checked:boolean,tex:string){
    Radio({value:value,group:group}).checked(checked).width(20).height(20)
    Text(tex)
  }
  @Builder selectList(addList: SelectOption[],name:string){
    Column({space:10}){
      // Text(name).fontSize(17)
      Select(addList).width('90%').selected(0).value(name).fontColor('#ff707070')
    }.width('100%').padding(10).alignItems(HorizontalAlign.Start)
  }

  onPageShow() {
    console.log("抓取数据中......")
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
            this.name = res.data.data.nickName;
            this.email = res.data.data.email;
            this.phone = res.data.data.phone;
            this.country = res.data.data.country;
            this.address = res.data.data.address;
            this.age = res.data.data.age;
            this.gender_show = res.data.data.gender === 'female' ? '女' :
              res.data.data.gender === 'male'   ? '男' :
                '其他';
            this.marry_show = res.data.data.maritalStatus === 'yes' ? '是':'否'
            this.mz_show = res.data.data.ethnicity;
            this.high = res.data.data.height;
            this.weight = res.data.data.weight;
            this.BMI = res.data.data.bmi;
            this.age_weight_grow = res.data.data.weightIncreaseAge;
            this.IDCARD = res.data.data.idCardNumber;
            this.ID = res.data.data.hospitalId;
            this.gzdw = res.data.data.workUnit;
            this.family_phone = res.data.data.familyContactPhone;



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
      console.log("昵称是"+this.name);
      console.info('data是',JSON.stringify(data))
    }).catch((err:string)=>{
      console.log(err);
    })


  }

  calculateAge() {
    if (this.Birth) {
      const today = new Date();
      let age = today.getFullYear() - this.Birth.getFullYear();
      const m = today.getMonth() - this.Birth.getMonth();
      if (m < 0 || (m === 0 && today.getDate() < this.Birth.getDate())) {
        age--;
      }
      this.age = age;
    }
  }


  build() {
    Column(){

      Stack(){
        Text('个人信息')
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

          Image($r('app.media.user')).width(70).height(70).borderRadius('50%').backgroundColor($r('app.color.green_app')).padding(10)
          Column({space:20}){

            Text('昵称').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.name
            }).width('100%')
            .onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.name = value;
            })

            Text('住院号').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.ID
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.ID = value;
            })

            Text('手机号').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.phone
            }).width('100%').enabled(false)

            Text('邮箱').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.email
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.email = value;
            })

            Text('国家').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.country
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.country = value;
            })

            Text('地址').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.address
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.address = value;
            })



            Text('身份证号').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.IDCARD
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.IDCARD = value;
            })

            Text('身高 (cm)').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.high?.toString()
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.high = Number(value);
            })

            Text('体重 (kg)').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.weight?.toString()
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.weight = Number(value);
            })

            Text('BMI').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.BMI?.toString()
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.BMI = Number(value);
            })

            Text('体重忽然增加时的年龄').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.age_weight_grow?.toString()
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.age_weight_grow = Number(value);
            })

            Text('工作单位').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.gzdw
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.gzdw = value;
            })

            Text('出生日期').fontWeight(700).margin({left:10})
            DatePicker({start:new Date('1900-01-01'),end: new Date(''),selected: $$this.Birth,}).height(60)
              .onChange((value: DatePickerResult) => {
                console.log('year:' + value.year + ' month:' + value.month + ' day:' + value.day);
                // 确保value.month和value.day不是undefined
                const year = value.year !== undefined ? value.year : 2024; // 默认为2024
                const month = value.month !== undefined ? value.month : 0; // 默认为0，即1月
                const day = value.day !== undefined ? value.day : 1; // 默认为1
                // 如果this.Birth不为undefined，则设置日期
                if (this.Birth) {
                  this.Birth.setFullYear(year, month - 1, day); // 注意：月份是从0开始的，所以需要减1
                }
                this.calculateAge();
              })


            Text('年龄').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.age?.toString()
            }).enabled(false)

            Text('家属电话').fontWeight(700).margin({left:10})
            TextInput({
              placeholder:this.family_phone
            }).width('100%').onChange((value) => {
              // 当输入框的值变化时，更新name变量
              this.family_phone = value;
            })

            Text('民族').fontWeight(700).margin({left:10})
            selection({
              selection: $mz,
              callback: (index: number, value?: string) => {
                console.info('民族:' + index + ': ' + (value ? value : ''));
              },
              placeholder:$mz_show
            })
              .margin({top:0}).width('100%')


            Text('是否结婚').fontWeight(700).margin({left:10})
            selection({
              selection: $marry,
              callback: (index: number, value?: string) => {
                console.info('婚姻:' + index + ': ' + (value ? value : ''));
              },
              placeholder:$marry_show
            })
              .margin({top:0}).width('100%')

            Text('性别').fontWeight(700).margin({left:10})
            selection({
              selection: $gender,
              callback: (index: number, value?: string) => {
                console.info('性别:' + index + ': ' + (value ? value : ''));
              },
              placeholder:$gender_show
            })
              .margin({top:0}).width('100%')

          }.alignItems(HorizontalAlign.Start)

          Row({space:20}){
            Button('修改账号密码',{type:ButtonType.Normal})
              .borderRadius(10)
              .width('45%')
              .backgroundColor($r('app.color.orange_default'))
              .margin({top:50})
              .onClick(()=>{
                router.pushUrl({url:'pages/change'})
              })

            Button('保存',{type:ButtonType.Normal})
              .borderRadius(10)
              .width('45%')
              .backgroundColor($r('app.color.green_app'))
              .margin({top:50})
              .onClick(
                async ()=>{
                  this.updateData();
                }
              )
          }
        }
        .padding(20)
        .width('100%')
        .height(2200)

      }
      .height(800)
      .borderRadius({topLeft:10,topRight:10})
      .backgroundColor(Color.White)
      .width('102%')
      .margin({top:-5})
    }

  }

  async  updateData():Promise<void> {
    new Promise<string>((resolve,reject)=>{
      const config : AxiosRequestConfig = {
        method:'put',
        url:UPDATEMYDATA,
        data:{
          nickName : this.name,
          email:this.email,
          maritalStatus:this.marry_show =='是'? 'yes' : 'no',
          ethnicity:this.mz_show,
          hospitalId:this.ID,
          country :this.country,
          address :this.address,
          height:Number(this.high),
          weight:Number(this.weight),
          bmi :Number(this.BMI),
          workUnit :this.gzdw,
          weightIncreaseAge :this.age_weight_grow,
          idCardNumber :this.IDCARD,
          familyContactPhone:this.family_phone,
          // birthdate?: Date
          age: this.age,
          gender : this.gender_show === '女' ? 'female' :
            this.gender_show === '男'   ? 'male' :
              'other'  }
      }

      appHttpRequest(config).then((res:AxiosResponse<ResponseResult<string>>)=>{
        if(res.status == 200){
          if(res.data.data){
            console.log("重新抓取数据");
            this.fetchData();
            resolve(res.data.data);
          }else{
            reject('没有数据 请求失败 无法更新')
          }
        }else {
          reject('网络请求异常:code ' + res.status)
        }
      })
        .catch((error:Error)=>{
          reject('网络请求异常:' + JSON.stringify(error))
        })
    }).then((data:string)=>{
      console.info("更新个人信息成功" , JSON.stringify(data));
      prompt.showToast({
        message: "更新个人信息成功"
      })
    }).catch((error:string)=>{

      console.log(error)
    })
  }
}