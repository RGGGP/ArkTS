
import {FruitData} from './Models';
import {TitleComponent} from './TitleComponent';
import {TitleHeaderComponents} from './TitleHeaderComponents';
import { ItemComponent } from './ItemComponent';





@Entry
@Component
struct Index {

  @State dataSource1: Array<FruitData> = [
    new FruitData('1', 'apple', '12344'),
    new FruitData('2', 'banana', '12344'),
    new FruitData('3', 'apple', '12344'),
    new FruitData('4', 'waterMellon', '12344'),
    new FruitData('5', 'pear', '12344'),
    new FruitData('6', 'tomato', '12344'),
    new FruitData('7', 'pep', '12344'),
    new FruitData('8', 'alpha', '12344'),
  ]

  @State dataSource2: Array<FruitData> = [
    new FruitData('1', 'apple2', '12344'),
    new FruitData('2', 'banana2', '12344'),
    new FruitData('3', 'apple2', '12344'),
    new FruitData('4', 'waterMellon2', '12344'),
    new FruitData('5', 'pear2', '12344'),
    new FruitData('6', 'tomato2', '12344'),
    new FruitData('7', 'pep2', '12344'),
    new FruitData('8', 'alpha2', '12344'),
  ]
  @State isSwitchDataSource: boolean = true


  build() {

    Column(){

      //第一部份
      TitleComponent({isFreshData: $isSwitchDataSource, title: '水果排行榜'})

      //第二部分
      TitleHeaderComponents({
        paddingValue: {
          left: 15,
          right: 15
        },
        widthValue: '92%'
      }).margin({top: 20, bottom: 15})

      //第3部分
      this.createArrayItemComponent()

    }.backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')

  }

  @Builder createArrayItemComponent(){

    Column(){

      List(){
        ForEach(this.isSwitchDataSource ? this.dataSource1 : this.dataSource2,
          (item: FruitData, index: number)=>{
            //构建列表子项
            ListItem(){
              ItemComponent({
                index: index + 1,
                name: item.name,
                vote: item.vote
              })
            }
          })
      }.width('100%')
      .height('100%')
      .divider({strokeWidth: 1})

    }.padding({left: 15, right: 15})
    .width('92%')
    .borderRadius(20)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)

  }


}