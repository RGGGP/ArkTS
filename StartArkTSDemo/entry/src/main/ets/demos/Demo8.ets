import {Header} from '../components/CommonComponents'
class Item {
  name: string
  image: ResourceStr
  price: number

  discount: number
  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

//全局自定义构建函数
// @Builder function ItemCard(item: Item) {
//   Row({space: 10}){
//     Image(item.image)
//       .width(100)
//
//     Column({space: 4}){
//       if (item.discount) {
//         Text(item.name)
//           .fontSize(20)
//           .fontWeight(FontWeight.Bold)
//
//         Text('原价¥'+ item.price)
//           .fontColor('#CCC')
//           .fontSize(14)
//           .decoration({type: TextDecorationType.LineThrough})
//
//         Text('折扣价¥'+ (item.price - item.discount))
//           .fontColor('#F36')
//           .fontSize(18)
//
//         Text('补贴¥'+ item.discount)
//           .fontColor('#F36')
//           .fontSize(18)
//       }else {
//         Text(item.name)
//           .fontSize(20)
//           .fontWeight(FontWeight.Bold)
//
//         Text('¥'+ item.price)
//           .fontColor('#F36')
//           .fontSize(18)
//       }
//     }
//
//     .alignItems(HorizontalAlign.Start)
//
//   }
//   .alignItems(VerticalAlign.Top)
//   .width('100%')
//   .height(128)
//   .borderRadius(20)
//   .padding(10)
// }

// //全局公共样式(只能对所有组件的公共样式进行封装)
// @Styles function fillScreen(){
//   .width('100%')
//   .height('100%')
//   .backgroundColor('#EFEFEF')
//   .padding(20)
// }

//样式是特殊的控件的时候要用 extend 只能写在全局位置
@Extend(Text) function priceText(size: number){
  .fontColor('#F36')
  .fontSize(size)
}


@Entry
@Component
struct Demo6 {
  private items: Array<Item> = [
    new Item('111', $r('app.media.startIcon'), 6661, 400),
    new Item('222', $r('app.media.startIcon'), 6662),
    new Item('333', $r('app.media.startIcon'), 6663),
    new Item('444', $r('app.media.startIcon'), 6664),
    new Item('555', $r('app.media.startIcon'), 6665),
    new Item('666', $r('app.media.startIcon'), 6666),
    new Item('333', $r('app.media.startIcon'), 6663),
    new Item('444', $r('app.media.startIcon'), 6664),
    new Item('555', $r('app.media.startIcon'), 6665),
    new Item('666', $r('app.media.startIcon'), 6666),
    new Item('333', $r('app.media.startIcon'), 6663),
    new Item('444', $r('app.media.startIcon'), 6664),
    new Item('555', $r('app.media.startIcon'), 6665),
    new Item('666', $r('app.media.startIcon'), 6666)
  ]

  build() {
    Column({space: 10}){

      Header({headerTitle: '商品列表'})
        .margin({bottom: 20})

      List({space: 8}){
        ForEach(
          this.items,
          (item: Item) => {
            ListItem(){
              this.ItemCard(item)
            }
          }
        )
      }
      .scrollBar(BarState.Off)
      .width('100%')
      .layoutWeight(1)

    }
    .fillScreen()
  }

  //局部自定义构建函数
  @Builder ItemCard(item: Item) {
    Row({space: 10}){
      Image(item.image)
        .width(100)

      Column({space: 4}){
        if (item.discount) {
          Text(item.name)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

          Text('原价¥'+ item.price)
            .fontColor('#CCC')
            .fontSize(14)
            .decoration({type: TextDecorationType.LineThrough})

          Text('折扣价¥'+ (item.price - item.discount))
            .priceText(18)

          Text('补贴¥'+ item.discount)
            .priceText(18)

        }else {
          Text(item.name)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

          Text('¥'+ item.price)
            .priceText(18)
        }
      }

      .alignItems(HorizontalAlign.Start)

    }
    .alignItems(VerticalAlign.Top)
    .backgroundColor(Color.White)
    .width('100%')
    .height(128)
    .borderRadius(20)
    .padding(10)
  }

  //全局公共样式
  @Styles fillScreen(){
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)
  }
}
