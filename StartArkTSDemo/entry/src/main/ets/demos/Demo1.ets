



@Component
struct  CityList {
  build(){
    List({space: 10}){
      ListItem(){
        Text('beijing')
          .fontSize(24)
      }.backgroundColor(Color.Red)
      .width('90%')
      .height(48)
      .margin({top: 20})
      .borderRadius(16)

      ListItem(){
        Text('shanghai')
          .fontSize(24)
      }.backgroundColor(Color.Red)
      .width('90%')
      .height('20%')
      .margin({top: 20})

      ListItem(){
        Text('shenzhen')
          .fontSize(24)
      }
    }.alignListItem(ListItemAlign.Center)
  }

}


@Entry
@Component
struct Demo1 {

  build() {
    Column(){
      CityList()
    }.height('100%')
    .width('100%')
  }


}


