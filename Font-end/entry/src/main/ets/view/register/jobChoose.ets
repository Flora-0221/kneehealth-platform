
import promptAction from '@ohos.promptAction';

@Component
export default struct jobChoose {
  @Link ischeck:number//默认选择第一个
  @State radionum:number=2//默认创建radio数量为2个
  @State radiotext:string[]=['一','二']//选项的文字，默认2个
  @State PicRoute:string[]=['app.media.female','app.media.male']

  build(){
    Row(){
      ForEach(this.radiotext,(item:string,index:number)=>{
        Stack({
          alignContent: Alignment.Center,
        }){
          Column(){
            Column(){

            }.height(183)
            Text(item)
              .width(160)
              .margin({left:10})
              .fontSize(14)
              .fontWeight(700)
              .textAlign(TextAlign.Center)
              .borderRadius(3)
              .padding({top:10})
              .height(60)
              .backgroundColor(index==this.ischeck?'#ffe3e3e3':'#ffffff')
              .onClick(()=>{
                this.ischeck=index
              })
          }
          .margin({left:-10})
          .height(210)

          Image($r(this.PicRoute[index]))
            .width(160)
            .height(190)
        }
        .margin(5)

      })
    }.height(24).width(250*this.radionum)
    .justifyContent(FlexAlign.Center)
    .margin({top:150})
    .borderRadius(3)
  }

}