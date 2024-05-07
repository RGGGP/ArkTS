
import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export struct UserPrivacyDialog {
  controller: CustomDialogController

  confirm = ()=>{}
  cancel = ()=>{}


  build() {
    Column({space: CommonConstants.SPACE_10}){
      //标题
      Text($r('app.string.user_privacy_title'))
      //内容
      Text($r('app.string.user_privacy_content'))
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      //按钮
      Button($r('app.string.agree_label'))
        .width(150)
        .backgroundColor($r('app.color.primary_color'))
        .onClick(()=>{
          this.confirm()
          this.controller.close()
        })

      Button($r('app.string.refuse_label'))
        .width(150)
        .backgroundColor($r('app.color.lightest_primary_color'))
        .fontColor($r('app.color.light_gray'))
        .onClick(()=>{
          this.cancel()
          this.controller.close()
        })
    }.width('100%')
    .padding(10)
  }
}