import dataContent from '../view/dataContent/dataContent'
import HomeContent from '../view/HomeContent'
import MineContent from '../view/mine/MineContent'

@Entry
@Component
struct MainIndex {
@State selectIndex: number = 0


@Builder TabBarBuilder(index: number, normalIcon: ResourceStr,selIcon:ResourceStr, text: string){
  Column(){
    Image(this.selectIndex === index ? selIcon:normalIcon)
      .width(20)
    Text(text)
      .fontColor(this.selectIndex === index? '#2a6049':'#ababab')
      .fontSize(10)
  }
}


  build() {
    Tabs({
      barPosition: BarPosition.End,
      index: this.selectIndex
    }){
      //主页
      TabContent(){
        HomeContent()
      }
        .tabBar(this.TabBarBuilder(0,$r('app.media.ic_public_home'),$r('app.media.ic_public_home_filled'),"主页"))
      // 数据检测页
      TabContent(){
        dataContent()
      }
        .tabBar(this.TabBarBuilder(1,$r('app.media.ic_contacts_blood_type'),$r('app.media.ic_contacts_blood_type_filled'),"健康"))
      // 个人页
      TabContent(){
        MineContent()
      }
        .tabBar(this.TabBarBuilder(2,$r('app.media.ic_public_contacts'),$r('app.media.ic_public_contacts_filled'),"个人"))
    }
    .onChange((index: number)=>{
      this.selectIndex = index
    })

  }
}