
import { CommonConstants } from '../common/constants/CommonConstants';
import router from '@ohos.router';
import { ItemList } from '../view/Item/ItemList';
import { ItemPanelHeader } from '../view/Item/ItemPanelHeader';
import { ItemCard } from '../view/Item/ItemCard';
import { NumberKeyBoard } from '../view/Item/NumberKeyboard';


@Entry
@Component
struct ItemIndex {
  @State amount: number = 1;
  @State value: string = ''
  @State showPanel: boolean = false
  onPanelShow() {
    this.showPanel = true
    this.value = ''
    this.amount = 1
  }



  build() {
    Column({space: 12}) {
      //头部导航
      this.Header()
      //列表
      ItemList({showPanel: this.onPanelShow.bind(this)})
        .layoutWeight(1)

      Panel(this.showPanel){
        // Button('关闭').onClick((event: ClickEvent) => {
        //   this.showPanel = false
        // })

        //顶部日期
        ItemPanelHeader()
        //记录卡片
        ItemCard({amount: this.amount})
        //数字键盘
        NumberKeyBoard({amount : $amount, value: $value})

        //按钮
        Row({space: 6}){
          Button('取消')
            .width(120)
            .backgroundColor($r('app.color.light_gray'))
            .type(ButtonType.Normal)
            .borderRadius(6)
            .onClick(()=>{
              this.showPanel = false
            })


          Button('提交')
            .width(120)
            .backgroundColor($r('app.color.primary_color'))
            .type(ButtonType.Normal)
            .borderRadius(6)
            .onClick(()=>{
              this.showPanel = false
            })

        }
        .margin({top: 10})
      }
      .mode(PanelMode.Full)
      .dragBar(false)
      .backgroundMask($r('app.color.light_gray'))
      .backgroundColor(Color.White)
    }
    .height('100%')
    .width('100%')
  }

  @Builder Header() {
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(()=>{
          router.back()
        })
      Blank()
      Text('早餐').fontSize(18).fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width('90%')
    .height(32)
  }
}