import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export  struct ItemPanelHeader {
  build() {
    Row(){
      Text('2024-01-25 早餐')
        .fontSize(18)
        .fontWeight(CommonConstants.FONT_WEIGHT_600)

      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor(Color.Black)

    }
    .justifyContent(FlexAlign.Center)
    .width('90%')
  }
}