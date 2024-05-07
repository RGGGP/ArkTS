import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export struct ItemList {

  showPanel:() =>void = () => {

  }

  build() {
    Tabs(){
      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('全部')

      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('全部')

      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('主食')

      TabContent(){
        this.TabContentBuilder()
      }
      .tabBar('肉蛋奶')

    }
    .width('94%')
    .height('100%')
  }

  @Builder TabContentBuilder() {
    List({space: CommonConstants.SPACE_10}){
      ForEach(
        [1, 2, 3, 4, 5, 6],
        (item: number)=>{
          ListItem(){
            Row({space: CommonConstants.SPACE_6}){
              Image($r('app.media.toast'))
                .width(50)
              Column(){
                Text('全麦吐司')
                  .fontWeight(CommonConstants.FONT_WEIGHT_500)
                Text('91卡/片').fontSize(14).fontColor($r('app.color.light_gray'))
              }

              Blank()
              Image($r('app.media.ic_public_add_norm_filled'))
                .width(18)
                .fillColor($r('app.color.primary_color'))
                .onClick(()=>{
                  this.showPanel()
                })

            }
            .width('100%')
            .padding(CommonConstants.SPACE_6)
          }

        })
    }
    .width('90%')
    .height('100%')
  }

}