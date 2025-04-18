import axios from '@ohos/axios'

/**
 * 账号密码登录模型
 */
export  interface PostUserLoginPasswdData {
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

//如果不限定类型，post传的参数是任意的,会报错


@Entry
@Component
struct TestAxios {
  build() {
    Column() {
      Scroll() {
        Column({ space: 10 }) {
          Button('发送请求-约束请求参数格式')
            .onClick(
              async () => {
              //   创建一个axios实例，内部做一些axios通用配置
              const axiosInstance = axios.create({
                baseURL: 'http://localhost:8081'
              })
              const res = await axiosInstance.post<null, null, PostUserLoginPasswdData>('/users/register',
                { password: '1234', phone: '13829396233',gender:'male',occupation:'doctor' }
              )
              AlertDialog.show({ message: JSON.stringify(res, null, 2) })
            })
        }
      }
      .width('100%')
      .height('100%')
    }
  }
}
