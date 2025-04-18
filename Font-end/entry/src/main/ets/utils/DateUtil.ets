class DateUtil{
  formatDate(num: number){
    let date = new Date(num)
    let year = date.getFullYear()
    let month = date.getMonth() + 1
    let day = date.getDate()
    let m = month<10? '0' + month:month
    let d = day < 10 ? '0'+day:day
    return `${year}年${m}月${d}日`
  }

  beginTimeOfDay(date: Date){
    let d = new Date(date.getFullYear(), date.getMonth(),date.getDate())
    return d.getTime()
  }
}

let dateUtil = new DateUtil()

export default dateUtil as DateUtil