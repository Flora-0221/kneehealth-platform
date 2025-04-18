export class ResponseResult<T>{
  success:boolean;
  data:T | null;

  constructor(){
    this.success = false;
    this.data = null;
  }
}