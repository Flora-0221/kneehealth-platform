
import { McLineChart, Options } from '@mcui/mccharts'

@Entry
@Component
@Preview
export default struct lineChart {
  // 初始化数据
  @State seriesOption: Options = new Options({
    xAxis:{
      data:['00:00','04:00','08:00','12:00','16:00','20:00']
    },
    yAxis:{
      name:'心率范围'
    },

    series:[

      {
        name:'心率范围',
        color:'#ff9d1a1a',
        lineStyle: { // 折线样式配置
          width: 2,
          type: 'solid',
          color:'#ff9d1a1a'
        },
        data:[90, 88, 78, 73, 66, 100, 99],
        // 区域颜色，线性渐变
        areaStyle: {
          color: {
            direction: [0, 1, 0, 0], // 渲染角度
            colors: [ // 颜色的分布
              {
                offset: 0,
                color: '#94f52626'
              },
              {
                offset: 0.5,
                color: '#66f5262d'
              },
              {
                offset: 1,
                color: '#00fa9898'
              }
            ]
          }
        },
      }
      // ,{
      //   name:'最低气温',
      //   data:[1, -20, 2, 5, 3, 2, 0]
      // }

    ]
  })
  // 动态修改数据
  aboutToAppear() {
    setTimeout(() => {
      // 传递需要修改的属性与数值，不需要全部传
      this.seriesOption.setVal({
        series:[
          {
            name:'心率范围',
            data:[90, 88, 78, 73, 66, 100, 99]
          }
        ]
      })
    }, 2000)
  }
  build() {

    Column() {

      McLineChart({
        options: this.seriesOption
      })
    }
    .height('100%')
    // .backgroundColor(Color.Gray)
  }
}