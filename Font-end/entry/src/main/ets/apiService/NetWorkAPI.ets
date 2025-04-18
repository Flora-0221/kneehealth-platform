import axios, { AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig } from "@ohos/axios"
import { API } from './APIConstant'


export function  appHttpRequest(config:AxiosRequestConfig){
  const instance = axios.create({
    baseURL:API,
    timeout:5000
  })

  //请求拦截 将用户token放入头中

  // 请求拦截器，将用户token放入头中
  instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {

    if (AppStorage.Get('token')) {
      config.headers['Authorization'] = AppStorage.Get('token');
      console.info("放入请求头部的token是"+AppStorage.Get('token'));
    }
    // config.headers['Authorization'] = '1fc98f2668514537bff2d6342fa2f7e0';
    return config;
  }, (error:Error) => {
    console.error('Request Error:', error);
    return Promise.reject(error);
  });


  //响应拦截
  instance.interceptors.response.use((response: AxiosResponse)=>{
    return response
  })

  //发送请求
  return instance.request(config)



}
