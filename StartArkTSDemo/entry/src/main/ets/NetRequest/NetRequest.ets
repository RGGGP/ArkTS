import {InfoModel} from './Info/infoModel'
import NetModel  from './Model/NetModel'

import preferencesUtil from '../common/PreferrncesUtil';

@Entry
@Component
struct NetRequest {

  @State getData: string = ''
  @State fontSize: number = 16

  async  aboutToAppear() {
    this.fontSize = await preferencesUtil.getPreferenceValue('MyPreferences', 'IndexFontSize', 16) as number
  }

  build() {
    Column({space: 30}){

      Text(`数据${this.getData}`)
        .fontColor(Color.Green)
        .fontSize(this.fontSize)

      Button('changesize+：'+ this.fontSize)
        .type(ButtonType.Capsule)
        .backgroundColor(Color.Blue)
        .onClick((event: ClickEvent) => {
          //写入
          this.fontSize = this.fontSize > 32 ? 16 : this.fontSize + 4
          preferencesUtil.putPreferenceValue('MyPreferences', 'IndexFontSize', this.fontSize)
      })
      Button('changesize-：'+ this.fontSize)
        .type(ButtonType.Capsule)
        .backgroundColor(Color.Blue)
        .onClick((event: ClickEvent) => {
          //写入
          this.fontSize = this.fontSize < 16 ? 16 : this.fontSize - 4
          preferencesUtil.putPreferenceValue('MyPreferences', 'IndexFontSize', this.fontSize)
        })

      Button('search1')
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