
import { McPieChart, Options } from '@mcui/mccharts'

@Preview
@Component

export default struct piChart {
  @State defOption: Options = new Options({

    legend: {
      show: false
    },

    series:[
      {
        labelLine:{
          show: false
        },
        label:{
          show: false
        },
        data:[
          {value:30, name:'股四头肌'},
          {value:25, name:'腘绳肌'},
          {value:20, name:'臀大肌'},
          {value:15, name:'小腿三头肌'},
          {value:10, name:'其他小肌群（如胫骨前肌等）'}
        ]
      }
    ]
  })
  build() {
    Row() {
      McPieChart({
        options: this.defOption
      })
    }
    .height('100%')
  }
}