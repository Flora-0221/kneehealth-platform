
import DHomeContent from '../view/DHomeContent'
import ChatContent from '../view/Chat/ChatContent'
import HealthContent from '../view/Health/HealthContent'
import WorkContent from '../view/Work/WorkContent'
import DMineContent from '../view/DMine/DMineContent'

@Entry
@Component
struct DMainIndex {
  @State selectIndex: number = 0

  @Builder
  TabBarBuilder(index: number, normalIcon: ResourceStr, selIcon: ResourceStr, text: string) {
    Column() {
      Image(this.selectIndex === index ? selIcon : normalIcon)
        .width(20)
      Text(text)
        .fontColor(this.selectIndex === index ? '#2a6049' : '#ababab')
        .fontSize(10)
    }
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      index: this.selectIndex
    }) {
      // 主页
      TabContent() {
        DHomeContent()
      }
      .tabBar(this.TabBarBuilder(0, $r('app.media.ic_public_home'), $r('app.media.ic_public_home_filled'), "主页"))

      // 聊天页
      TabContent() {
        ChatContent()
      }
      .tabBar(this.TabBarBuilder(1, $r('app.media.ic_chap'), $r('app.media.ic_chap_filled'), "聊天"))

      // 健康页
      TabContent() {
        HealthContent()
      }
      .tabBar(this.TabBarBuilder(2, $r('app.media.ic_contacts_blood_type'), $r('app.media.ic_contacts_blood_type_filled'), "健康"))

      // 工作页
      TabContent() {
        WorkContent()
      }
      .tabBar(this.TabBarBuilder(3, $r('app.media.ic_work'), $r('app.media.ic_work_filled'), "工作"))

      // 个人页
      TabContent() {
        DMineContent()
      }
      .tabBar(this.TabBarBuilder(4, $r('app.media.ic_public_contacts'), $r('app.media.ic_public_contacts_filled'), "个人"))
    }
    .onChange((index: number) => {
      this.selectIndex = index
    })
  }
}