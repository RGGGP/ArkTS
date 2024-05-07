import { CommonConstants } from '../../common/constants/CommonConstants'
import DateUtil from '../../common/utils/DateUtil'
import { CalorieStars } from './ColorieStars'
import { DatePickDialog } from './DatePickerDialog'
import { NutrientStats } from './NutrientStats'

@Component
export  struct StatesCard {

  @StorageProp('selectedDate') selectedDate: number = DateUtil.beginTimeOfDay(new Date())


  controller: CustomDialogController = new CustomDialogController({
    builder: DatePickDialog({selectedDate: new Date(this.selectedDate)})
  })


  build() {
    Column(){
      Row(){
        //DateUtil.formatDate(this.selectedDate)
        Text(DateUtil.formatDate(this.selectedDate))
          .fontColor($r('app.color.secondary_color'))

        Image($r('app.media.ic_public_spinner'))
          .width(20)
          .fillColor($r('app.color.secondary_color'))
      }
      .padding(12).onClick(()=>{
        this.controller.open()
      })

      Swiper(){

        CalorieStars()

        NutrientStats()
        // Text('text2')
        //   .width('90%')
        //   .height(126)
        //   .backgroundColor(0xFEEEEE)
        //   .textAlign(TextAlign.Center).fontSize(32)

      }
      .loop(true)
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(CommonConstants.DEFAULT_18)
      .indicator(// 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(6)
          .itemHeight(6)
          .selectedItemWidth(6)
          .selectedItemHeight(6)
          .color(Color.Gray)
          .selectedColor(Color.Blue))

    }
    .width('90%')
    .backgroundColor($r('app.color.stats_title_bgc'))
    .borderRadius(CommonConstants.DEFAULT_18)

  }
}