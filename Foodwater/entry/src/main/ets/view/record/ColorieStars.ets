import { CommonConstants } from '../../common/constants/CommonConstants'


@Component
export  struct CalorieStars {

  intake: number = 12
  expand: number = 120
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  remainCalorie(){
    return this.recommend - this.intake  + this.expand
  }

  build() {
    Row({space: CommonConstants.SPACE_6}){

      //1饮食摄入
      this.StatsBuilder('饮食摄入', this.intake)

      //2还可以吃
      Stack(){
        //2.1进度条
        Progress({
          value: this.intake,
          total: this.recommend,
          type: ProgressType.Ring
        })
          .width(120)
          .style({strokeWidth: CommonConstants.DEFAULT_10})
          .color($r('app.color.primary_color'))
        this.StatsBuilder('还可以吃', this.remainCalorie(), `推荐${this.recommend}`)

      }


      //3运动消耗
      this.StatsBuilder('饮食摄入', this.expand)


    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({ top: 30, bottom: 35} )
  }



  @Builder StatsBuilder(label: string, value: number, tips?: string) {
    Column(){
      Text(label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)

      Text(value.toString())
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)

      if (tips) {
        Text(tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }

    }
  }
}