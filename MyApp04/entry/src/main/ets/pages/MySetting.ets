
import CommonConstants from './CommonConstants'
import ItemData from './ItemData'
import DataModel  from './DataModel'
import router from '@ohos.router';

// @Entry
@Component
export struct MySetting {
  private  account: number



  // 构建设置单元格的函数，接收一个ItemData类型的item作为参数
  @Builder
  settingCell(item: ItemData) {
    Row() { // 创建一个行布局
      Row({ space: CommonConstants.COMMON_SPACE }) { // 创建一个有间隔的内嵌行布局
        Image(item.img) // 显示图像
          .width($r('app.float.setting_size')) // 设置图像的宽度
          .height($r('app.float.setting_size')) // 设置图像的高度
        Text(item.title) // 显示文本
          .fontSize($r('app.float.normal_text_size')) // 设置文本的字号
      }

      // 如果item的others属性为空，则显示一个图像，否则显示一个开关组件
      if (item.others == null) {
        Image($r('app.media.right_grey')) // 显示一个灰色的箭头图像
          .width($r('app.float.setting_jump_width')) // 设置图像宽度
          .height($r('app.float.setting_jump_height')) // 设置图像高度
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false }) // 显示一个开关组件
      }
    }
    .justifyContent(FlexAlign.SpaceBetween) // 设置内容在主轴方向的对齐方式为两端对齐
    .width(CommonConstants.FULL_PARENT) // 设置宽度为父容器的100%
    .padding({ // 设置内边距
      left: $r('app.float.setting_settingCell_left'),
      right: $r('app.float.setting_settingCell_right')
    })
  }

  build() {
    Scroll(){
      Column({space: CommonConstants.COMMON_SPACE}){
        Column(){ // 创建一个内嵌的列布局
          Text($r('app.string.mainPage_tabTitles_mine')) // 显示文本
            .fontWeight(FontWeight.Medium) // 设置字体权重
            .fontSize($r('app.float.page_title_text_size')) // 设置字号
            .margin({ top: $r('app.float.mainPage_tabTitles_margin') }) // 设置外边距
            .padding({ left: $r('app.float.mainPage_tabTitles_padding') }) // 设置内边距
        }
        .width(CommonConstants.FULL_PARENT) // 设置宽度为父容器的100%
        .alignItems(HorizontalAlign.Start) // 设置子项在交叉轴上的对齐方式为开始对齐

        // 接下来是账户信息的布局
        Row() {
          Image($r('app.media.account')) // 显示账户图片
            .width($r('app.float.setting_account_size')) // 设置图片宽度
            .height($r('app.float.setting_account_size')) // 设置图片高度
          Column() {
            Text($r('app.string.setting_account_name')) // 显示账户名称
              .fontSize($r('app.float.setting_account_fontSize')) // 设置字号
            Text(this.account.toString()) // 显示账号
              .fontSize($r('app.float.little_text_size')) // 设置字号
              .margin({ top: $r('app.float.setting_name_margin') }) // 设置外边距
          }
          .alignItems(HorizontalAlign.Start) // 设置子项在交叉轴上的对齐方式为开始对齐
          .margin({ left: $r('app.float.setting_account_margin') }) // 设置外边距
        }
        .margin({ top: $r('app.float.setting_account_margin') }) // 设置外边距
        .alignItems(VerticalAlign.Center) // 设置子项在交叉轴上的对齐方式为居中对齐
        .width(CommonConstants.FULL_PARENT) // 设置宽度为父容器的100%
        .height($r('app.float.setting_account_height')) // 设置高度
        .backgroundColor(Color.White) // 设置背景颜色为白色
        .padding({ left: $r('app.float.setting_account_padding') }) // 设置内边距
        .borderRadius($r('app.float.setting_account_borderRadius')) // 设置边角半径

        //列表布局组件
        List(){
          ForEach(DataModel.getSettingListData(), (item: ItemData)=>{
            ListItem(){
              this.settingCell(item)
            }
            .height($r('app.float.setting_list_height'))
          })
        }.backgroundColor(Color.White) // 设置背景颜色为白色
        .width(CommonConstants.FULL_PARENT) // 设置宽度为父容器的100%
        .height(CommonConstants.SET_LIST_WIDTH) // 设置高度
        .divider({ // 设置列表项之间的分割线
          strokeWidth: $r('app.float.setting_list_strokeWidth'), // 设置分割线的宽度
          color: Color.Grey, // 设置分割线的颜色为灰色
          startMargin: $r('app.float.setting_list_startMargin'), // 设置分割线的起始边距
          endMargin: $r('app.float.setting_list_endMargin') // 设置分割线的结束边距
        })
        .borderRadius($r('app.float.setting_list_borderRadius')) // 设置边角半径
        .padding({ top: $r('app.float.setting_list_padding'), bottom: $r('app.float.setting_list_padding') }) // 设置内边距

        Blank()

        // 退出按钮的布局
        Button($r('app.string.setting_button'), { type: ButtonType.Capsule }) // 创建一个按钮
          .width(CommonConstants.BUTTON_WIDTH) // 设置按钮宽度
          .height($r('app.float.login_button_height')) // 设置按钮高度
          .fontSize($r('app.float.normal_text_size')) // 设置字号
          .fontColor($r('app.color.setting_button_fontColor')) // 设置字体颜色
          .fontWeight(FontWeight.Medium) // 设置字体权重
          .backgroundColor($r('app.color.setting_button_backgroundColor')) // 设置背景颜色
          .margin({ bottom: $r('app.float.setting_button_bottom')}) // 设置外边距

        
      }.height(CommonConstants.FULL_PARENT)
    }

  }
}