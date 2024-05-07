import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export  struct NumberKeyBoard {

  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']

  @Link amount: number
  @Link value: string

  build() {
    Grid(){
      ForEach(
        this.numbers
        , (str: string)=>{
        GridItem(){
          Text(str).fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_900)
        }
        .KeyBoardStyle()
        .onClick(()=>{this.clickNumber(str)})
      })

      GridItem(){
        Text('删除').fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_900)
      }
      .KeyBoardStyle()
      .onClick(()=>{this.clickDelete()})

    }
    .backgroundColor($r('app.color.index_page_background'))
    .columnsTemplate('1fr 1fr 1fr')
    .columnsGap(8)
    .rowsGap(8)
    .padding(8)
    .margin({top: 10})
    .width('100%')
    .height(280)

  }

  clickNumber(value: string) {
    //拼接用户输入的内容
    let  val = this.value + value
    //校验输入格式
    let firstIndex = val.indexOf('.')
    let lastIndex = val.lastIndexOf('.')
    if (firstIndex !== lastIndex || (lastIndex != -1 && lastIndex < val.length - 2)) {
      return
    }

    //将字符串转为数值
    let amount = this.parseFloat(val)

    //保存

    if (amount > 999.9) {
      this.amount = 999.0
      this.value = '999'
    }else {
      this.amount = amount
      this.value = val
    }
  }

  clickDelete() {
    if (this.value.length < 1) {
      this.amount = 0
      this.value = ''
      return
    }

    this.value = this.value.substring(0, this.value.length - 1)
    this.amount = this.parseFloat(this.value)
  }
  parseFloat(str: string) {
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1)
    }
    return parseFloat(str)

  }

  @Styles KeyBoardStyle() {
    .backgroundColor(Color.White)
    .height(60)
    .borderRadius(8)
  }
}