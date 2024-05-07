import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export struct ItemCard {

  @Prop amount: number

  build() {
    Column({space: CommonConstants.SPACE_8}){
      Image($r('app.media.toast')).width(150)
      Row(){
        Text('全麦吐司')
          .fontWeight(CommonConstants.FONT_WEIGHT_700)
      }
      .backgroundColor($r('app.color.lightest_primary_color'))
      .padding({top: 5, bottom: 5, left: 12, right: 12})

      this.CreatDivider()

      Row({space: CommonConstants.SPACE_8}){
        this.NutrientInfo('热量（千卡）', 91.8)

        this.NutrientInfo('碳水（克）', 15.8)

        this.NutrientInfo('蛋白质（克）', 4.4)

        this.NutrientInfo('脂肪（克）', 1.3)
      }

      this.CreatDivider()

      Row(){
        Column({space: CommonConstants.SPACE_4}){
          Text(this.amount.toFixed(1)).fontSize(50)
            .fontColor($r('app.color.primary_color'))

          Divider().color($r('app.color.primary_color'))
        }
        .width(150)

        Text('片')
          .fontColor($r('app.color.light_gray'))
          .fontWeight(CommonConstants.FONT_WEIGHT_600)
      }

    }

  }



  @Builder NutrientInfo(label: string, value: number) {
    Column({space: CommonConstants.SPACE_8}){
      Text(label).fontSize(14).fontColor($r('app.color.light_gray'))

      Text((value * this.amount).toFixed(1)).fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_700)
    }
  }

  @Builder CreatDivider() {
    Divider().width(CommonConstants.THOUSANDTH_940).opacity(0.6)
  }


}