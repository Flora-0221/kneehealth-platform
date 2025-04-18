import { router } from '@kit.ArkUI';

@Entry
@Component
struct ClientManage {
  @State rank: string = 'app.media.desc';
  @State placeholderMeg: string = '输入患者姓名或ID进行快速搜索';
  @State ClientList: string[] = [
    '玲玲(ID:0)',
    '张三(ID:1)',
    '王四(ID:2)',
    '李雷(ID:3)',
    '韩梅梅(ID:4)',
    '赵六(ID:5)',
    '钱七(ID:6)',
    '孙八(ID:7)',
    '周九(ID:8)',
    '吴十(ID:9)',
    '郑十一(ID:10)',
    '王十二(ID:11)',
    '张十三(ID:12)',
    '陈十四(ID:13)',
    '褚十五(ID:14)',
    '卫十六(ID:15)',
    '蒋十七(ID:16)',
    '沈十八(ID:17)',
    '韩十九(ID:18)',
    '杨二十(ID:19)',
    '朱二十一(ID:20)',
    '秦二十二(ID:21)',
    '尤二十三(ID:22)'
  ];
  @State positive_stateMeg: string = '恢复良好'
  @State negative_stateMeg: string = '需要关注'

  @State positive_stateColor: string = '#2a6049'
  @State negative_stateColor: string = '#f47473'

  @State selected_index: number = 0

  @State filterCondition: string = ''; // '', 'positive', 'negative'

  // 用一个状态来表示每个病人的状态
  @State patientStatusList: string[] = ['positive', 'negative', 'positive', 'negative', 'positive', 'positive', 'positive','positive', 'positive', 'negative', 'positive', 'negative', 'positive', 'positive', 'negative', 'positive', 'negative', 'positive',];

  @State patientDateList: string[] = [
    '09月22日 12:26',
    '09月21日 09:26',
    '09月21日 15:01',
    '09月19日 10:08',
    '09月18日 21:26',
    '09月17日 12:12',
    '09月16日 19:29',
    '09月16日 12:56',
    '09月14日 12:46',
    '09月10日 07:06',
    '09月09日 20:45',
    '09月07日 05:06',
    '09月06日 23:45',
  ];

  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  @State inputText: string = ''

  @State patientMap: Map<number, string> = new Map<number, string>([
    [1, '90'],
    [2, '80'],
  ]);

  build() {

    Scroll() {
      Column() {

        Column(){
          Column() {
            Column() {
              Button({type:ButtonType.Normal}){
                Image($r('app.media.left_arrow'))
                  .fillColor('#ffffffff')
                  .width('60%')
              }
              .borderWidth(1)
              .backgroundColor(Color.Transparent)
              .borderRadius(10)
              // .margin({left:5})
              .borderColor('#fff')
              .width(40)
              .height(40)
              .position({left:5})
              .onClick(()=>{
                router.back()
              })
              Row() {
                // Image($r('app.media.search'))
                //   .borderRadius(10)
                //   .height(22)
                //   .width(22)
                //   .alignSelf(ItemAlign.Center)
                //   .margin({right: 10})

                TextInput({
                  placeholder: this.placeholderMeg
                })
                  .height(40)
                  .width(260)
                  .placeholderColor('#bfffffff')
                  .backgroundColor(Color.Transparent)
                  .borderWidth(2)
                  .borderColor('#86d2d2d2')
                  .margin({left: 30})
                  .onChange((value: string) => {
                    this.inputText = value; // 将输入的文本内容更新到状态变量中
                  })
              }
              .width('95%')
              .margin({top:5,left:80})

            }
            .width('100%')
            .height(64)
            .margin({top: 20})
          }
          .width('100%')
          .height(100)
        }
        .backgroundColor($r('app.color.green_app'))




        Row() {
          Button() {
            Text('全部')
              .fontSize(18)
              .fontColor(this.selected_index === 0 ? '#000000' : '#d28d8d8d')
              .fontWeight(this.selected_index === 0 ? FontWeight.Bold : FontWeight.Normal)
          }
          .type(ButtonType.Capsule)
          .width(64)
          .height(36)
          .backgroundColor(this.selected_index === 0 ? '#e6e6e6e6' : '#ffffff')
          .onClick(() => {
            this.selected_index = 0
            this.filterCondition = ''
          })
          .margin({right:5})

          Button() {
            Text('恢复良好')
              .fontSize(18)
              .fontColor(this.selected_index === 1 ? '#ffffff' : '#d28d8d8d')
              .fontWeight(this.selected_index === 1 ? FontWeight.Bold : FontWeight.Normal)
          }
          .type(ButtonType.Capsule)
          .width(96)
          .height(36)
          .backgroundColor(this.selected_index === 1 ? this.positive_stateColor : '#ffffff')
          .onClick(() => {
            this.selected_index = 1
            this.filterCondition = 'positive'
          })
          .margin({right:5})

          Button() {
            Text('需要关注')
              .fontSize(18)
              .fontColor(this.selected_index === 2 ? '#ffffff' : '#d28d8d8d')
              .fontWeight(this.selected_index === 2 ? FontWeight.Bold : FontWeight.Normal)
          }
          .type(ButtonType.Capsule)
          .width(96)
          .height(36)
          .backgroundColor(this.selected_index === 2 ? this.negative_stateColor : '#ffffff')
          .onClick(() => {
            this.selected_index = 2
            this.filterCondition = 'negative'
          })

          Text('日期')
            .fontSize(15)
            .margin({left:10})
            .fontColor('#d28d8d8d')

          Image($r(this.rank))
            .height(22)
            .width(22)
            .margin({left:5, right:10})
            .onClick(() => {
              if (this.rank === 'app.media.asc') {
                this.rank = 'app.media.desc'
                this.arr.reverse()
              }
              else {
                this.rank = 'app.media.asc'
                this.arr.reverse()
              }
            })


        }
        .width('100%')
        .height(80)
        .padding({left:10})
        .margin({top:-10})
        .borderRadius({topLeft:10,topRight:10})
        .backgroundColor(Color.White)

        if (this.inputText != '') {
          ForEach(this.ClientList, (client: string) => {
            if (this.inputText === client.slice(0, 4) || this.inputText === client.slice(0, 3) || this.inputText === client.slice(0, 2) || this.inputText === client.slice(0, 1) || this.inputText === client.slice(1, 2) || this.inputText === client.slice(2, 3)  || this.inputText === client.slice(3, 4) || this.inputText === client.slice(1, 3) || this.inputText === client.slice(1, 4)  || this.inputText === client.slice(2, 4)) {
              Row() {
                Image($r('app.media.girl'))
                  .borderRadius(40)
                  .height(60)
                  .width(60)
                  .margin({left:10, right:10})
                Column() {
                  Row() {
                    Text(client)
                      .fontSize(21)
                      .fontWeight(FontWeight.Bold)
                      .textAlign(TextAlign.Start)
                      .layoutWeight(3)
                      .onClick(() => {
                        router.pushUrl({url:'pages/ClientDetail'})
                      })
                    Column() {
                      Text(this.patientStatusList[this.ClientList.indexOf(client)] === 'positive' ? this.positive_stateMeg : this.negative_stateMeg)
                        .fontSize(17)
                        .fontWeight(FontWeight.Bold)
                        .textAlign(TextAlign.Start)
                        .fontColor('#ffffffff')
                        .margin({top:3})
                    }
                    .layoutWeight(2)
                    .backgroundColor(this.patientStatusList[this.ClientList.indexOf(client)] === 'positive' ? this.positive_stateColor : this.negative_stateColor)
                    .borderRadius(20)
                    .height(30)
                    .margin({top:-6,right:10})
                  }
                  .width('100%')
                  .height('50%')

                  Row() {
                    Column() {
                      Text('什么时候换药？')
                        .fontSize(17)
                        .fontColor('#d28d8d8d')
                        .textAlign(TextAlign.Start)
                        .height('100%')
                        .width('100%')
                    }
                    .width('50%')
                    .height('100%')

                    Column() {
                      Text(this.patientDateList[this.ClientList.indexOf(client)])
                        .fontSize(13)
                        .fontColor('#d28d8d8d')
                        .textAlign(TextAlign.End)
                        .height('100%')
                        .width('100%')
                        .margin({right:20})
                    }
                    .width('50%')
                    .height('100%')

                  }
                  .width('100%')
                  .height('50%')

                }
                .height(80)
                .width(275)

              }
              .width('100%')
              .height(80)
              .alignRules({
                center: { anchor: '__container__', align: VerticalAlign.Top },
                middle: { anchor: '__container__', align: HorizontalAlign.Center }
              })
              .margin({bottom:20})
            }
          })
        }


        if (this.inputText === '') {
          ForEach(this.arr, (item: number) => {
            if (this.filterCondition === this.patientStatusList[`${item}`] || this.filterCondition === '') {
              Row() {
                Image($r('app.media.girl'))
                  .borderRadius(40)
                  .height(60)
                  .width(60)
                  .margin({left:10, right:10})
                Column() {
                  Row() {
                    Text(this.ClientList[`${item}`])
                      .fontSize(21)
                      .fontWeight(FontWeight.Bold)
                      .textAlign(TextAlign.Start)
                      .width('60%')
                      .layoutWeight(3)
                      .onClick(() => {
                        // 定义要传递的参数
                        const params: string[] = [this.ClientList[`${item}`], this.patientStatusList[`${item}`], this.patientDateList[`${item}`]]
                        router.pushUrl({
                          url:'pages/ClientDetail',
                          params: params // 传递的参数对象
                        })
                      })
                    Column() {
                      Text(this.patientStatusList[`${item}`] === 'positive' ? this.positive_stateMeg : this.negative_stateMeg)
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .textAlign(TextAlign.Start)
                        .fontColor('#ffffffff')
                        .margin({top:3})
                    }
                    .layoutWeight(2)
                    .backgroundColor(this.patientStatusList[`${item}`] === 'positive' ? this.positive_stateColor : this.negative_stateColor)
                    .borderRadius(20)
                    .height(30)
                    .margin({top:-6,right:7})
                  }
                  .width('100%')
                  .height('50%')

                  Row() {
                    Column() {
                      Text('什么时候换药？')
                        .fontSize(17)
                        .fontColor('#d28d8d8d')
                        .textAlign(TextAlign.Start)
                        .height('100%')
                        .width('100%')
                    }
                    .width('50%')
                    .height('100%')

                    Column() {
                      Text(this.patientDateList[`${item}`])
                        .fontSize(15)
                        .fontColor('#d28d8d8d')
                        .textAlign(TextAlign.End)
                        .height('100%')
                        .width('100%')
                        .margin({right:20})
                    }
                    .width('50%')
                    .height('100%')

                  }
                  .width('100%')
                  .height('50%')

                }
                .height(80)
                .width(275)

              }
              .width('100%')
              .height(80)
              .alignRules({
                center: { anchor: '__container__', align: VerticalAlign.Top },
                middle: { anchor: '__container__', align: HorizontalAlign.Center }
              })
              .margin({bottom:20})
            }

          })
        }
        else if (this.arr.includes(Number(this.inputText))) {
          Row() {
            Image($r('app.media.girl'))
              .borderRadius(40)
              .height(60)
              .width(60)
              .margin({left:10, right:10})
            Column() {
              Row() {
                Text(this.ClientList[Number(this.inputText)])
                  .fontSize(21)
                  .fontWeight(FontWeight.Bold)
                  .textAlign(TextAlign.Start)
                  .width('60%')
                  .onClick(() => {
                    router.pushUrl({url:'pages/ClientDetail'})
                  })
                Column() {
                  Text(this.patientStatusList[Number(this.inputText)] === 'positive' ? this.positive_stateMeg : this.negative_stateMeg)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .textAlign(TextAlign.Start)
                    .fontColor('#ffffffff')
                    .margin({top:3})
                }
                .width('40%')
                .backgroundColor(this.patientStatusList[Number(this.inputText)] === 'positive' ? this.positive_stateColor : this.negative_stateColor)
                .borderRadius(20)
                .height(30)
                .margin({top:-6})
              }
              .width('100%')
              .height('50%')

              Row() {
                Column() {
                  Text('什么时候换药？')
                    .fontSize(17)
                    .fontColor('#d28d8d8d')
                    .textAlign(TextAlign.Start)
                    .height('100%')
                    .width('100%')
                }
                .width('50%')
                .height('100%')

                Column() {
                  Text(this.patientDateList[Number(this.inputText)])
                    .fontSize(15)
                    .fontColor('#d28d8d8d')
                    .textAlign(TextAlign.End)
                    .height('100%')
                    .width('100%')
                    .margin({right:20})
                }
                .width('50%')
                .height('100%')

              }
              .width('100%')
              .height('50%')

            }
            .height(80)
            .width(275)

          }
          .width('100%')
          .height(80)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .margin({bottom:20})
        }

      }
      .width('100%')
      .height('100%')

    }
    // .width('100%')
    .height(100*this.arr.length + 300)

  }
}