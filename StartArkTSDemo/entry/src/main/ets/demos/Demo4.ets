@Entry
@Component
struct Demo4 {



  build() {
    Row(){
      Column(){

        // Image($r('app.media.startIcon')).width(250)
        Text('Hello')
          .fontSize(47)
          .fontWeight(500)
          .backgroundColor(Color.Yellow)

        Image('https://i2.hdslb.com/bfs/face/743cde636e96d79bd33d386d10fe4aea4dc68e1b.jpg').width(250)
          .height(250)
          .backgroundColor(Color.Blue)
          .margin({top: 20})

        Image($r('app.media.startIcon')).width(250).margin({top: 20})

      }.width('100%')
      .backgroundColor(Color.Red)
    }.height('100%')
  }

}