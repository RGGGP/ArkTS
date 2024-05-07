import { CommonConstants } from '../../common/constants/CommonConstants'


@Component
export  struct NutrientStats {
  intake: number = 192
  expand: number = 120
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  carbon: number = 129
  protein: number = 32
  fat: number = 34

  recommendCarbon: number = CommonConstants.RECOMMEND_CARBON
  recommendProtein: number = CommonConstants.RECOMMEND_PROTEIN
  recommendFat: number = CommonConstants.RECOMMEND_FAT

  remainCalorie(){
    return this.recommend - this.intake  + this.expand
  }

  build() {
    Row({space: CommonConstants.SPACE_6}){

      //1碳水
      this.StatsBuilder('碳水化合物', this.carbon, this.recommendCarbon, $r('app.color.carbon_color'))

      //2还可以吃
      this.StatsBuilder('蛋白质', this.protein, this.recommendProtein, $r('app.color.protein_color'))

      //3运动消耗
      this.StatsBuilder('脂肪', this.fat, this.recommendFat, $r('app.color.fat_color'))



    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({ top: 30, bottom: 35} )
  }



  @Builder StatsBuilder(label: string, value: number, recommend: number, color: ResourceStr) {
    Column(){

      Stack(){
        //2.1进度条
        Progress({
          value: value,
          total: recommend,
          type: ProgressType.Ring
        })
          .width(95)
          .style({strokeWidth: CommonConstants.DEFAULT_10})
          .color(color)
        Column({space: CommonConstants.SPACE_6}){
          Text('摄入推荐')
            .fontSize(12)
            .fontColor($r('app.color.light_gray'))

          Text(`${value.toFixed(0)}/${recommend.toFixed(0)}`)
            .fontSize(20)
            .fontWeight(CommonConstants.FONT_WEIGHT_700)
        }

      }

      Text(`${label}(克)`)
        .fontSize(12)
        .fontColor($r('app.color.light_gray'))


    }
  }
}