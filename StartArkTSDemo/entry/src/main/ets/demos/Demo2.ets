@Entry
@Component
struct demo2Test {
  build() {
    Column(){

      // Stack(){
      //
      //   Column(){
      //
      //   }.width('90%')
      //   .height('100%')
      //   .backgroundColor(Color.Red)
      //
      //
      //   Text('text'){
      //
      //   }.width('60%')
      //   .height('60%')
      //   .backgroundColor(Color.Green)
      //
      //   Button('button')
      //     .width('30%')
      //     .height('30%')
      //     .backgroundColor(Color.Yellow)
      //     .fontColor(Color.Black)
      //
      // }.width('100%')
      // .height(150)
      // .margin({top: 50})
      // .backgroundColor(Color.Orange)

      Stack({ alignContent: Alignment.BottomStart }) {
        Column() {
          Text('Stack子元素1').textAlign(TextAlign.End).fontSize(20)
        }.width(100).height(100).backgroundColor(0xffd306).zIndex(2)

        Column() {
          Text('Stack子元素2').fontSize(20)
        }.width(150).height(150).backgroundColor(Color.Pink).zIndex(1)

        Column() {
          Text('Stack子元素3').fontSize(20)
        }.width(200).height(200).backgroundColor(Color.Grey)
      }.margin({ top: 100 }).width(350).height(350).backgroundColor(0xe0e0e0)

    }.width('90%')
    .height('90%')
    .backgroundColor(Color.Gray)
    .margin({left: '5%', top: '5%'})
  }
}