import {InfoModel} from './Info/infoModel'
import NetModel  from './Model/NetModel'

@Entry
@Component
struct NetRequest {

  @State getData: string = ''

  build() {
    Column({space: 30}){

      Text(`数据${this.getData}`)
        .fontColor(Color.Green)
        .fontSize(25)


      Button('search')
        .type(ButtonType.Capsule)
        .backgroundColor(Color.Blue)
        .onClick(()=>{
          console.log('点击了')
          NetModel.getShopList()
            .then(data=>{
              this.getData = data.toString()
              console.log('查到了')
              console.log(data.toString())
            })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .alignItems(HorizontalAlign.Center)
  }
}