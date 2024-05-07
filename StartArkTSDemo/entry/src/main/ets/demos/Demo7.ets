
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
      Row(){
        Text('商品列表:')
          .fontSize(30)
          .fontWeight(400)
      }
      .width('100%')
      .margin({bottom: 20})

      List({space: 8}){
        ForEach(
          this.items,
          (item: Item) => {
            ListItem(){
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
                      .fontColor('#F36')
                      .fontSize(18)

                    Text('补贴¥'+ item.discount)
                      .fontColor('#F36')
                      .fontSize(18)
                  }else {
                    Text(item.name)
                      .fontSize(20)
                      .fontWeight(FontWeight.Bold)

                    Text('¥'+ item.price)
                      .fontColor('#F36')
                      .fontSize(18)
                  }
                }

                .alignItems(HorizontalAlign.Start)

              }
              .alignItems(VerticalAlign.Top)
              .width('100%')
              .height(128)
              .borderRadius(20)
              .padding(10)
            }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)

  }
}