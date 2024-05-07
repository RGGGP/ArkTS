@Component
export struct TitleHeaderComponents{
  widthValue: Length = 0
  paddingValue: Padding | Length = 0

  build() {
    Row({space: 8}){

      Text('排名')
        .fontSize(16)
        .width('20%')
        .height('100%')
        .fontWeight(400)
        .fontColor('#989A9C')

      Text('种类')
        .fontSize(16)
        .width('50%')
        .height('100%')
        .fontWeight(400)
        .fontColor('#989A9C')

      Text('得票数')
        .fontSize(16)
        .width('30%')
        .height('100%')
        .fontWeight(400)
        .fontColor('#989A9C')



    }.width(this.widthValue)
    .height(42)
    .padding(this.paddingValue)
  }


}

