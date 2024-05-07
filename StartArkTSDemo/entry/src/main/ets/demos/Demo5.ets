
import { common, Want } from '@kit.AbilityKit'

@Entry
@Component
struct Demo5 {

  @State imageWidth: number = 150

  //uiability的生命周期
  /*
   * create windowstagecreate foreground background windowstagedestroy destroy
   * */
  //组件及页面的生命周期
  //  组件实例创建
  //
  //  执行 build函数
  //
  //
  //  *//

  private context = getContext(this) as common.UIAbilityContext

    build() {
      Column() {

        Row(){
          Image($r('app.media.startIcon')).width(this.imageWidth).margin({ top: 20 })
        }
        .width('100%')
        .height(400)
        .justifyContent(FlexAlign.Center)

        // Image($r('app.media.startIcon')).width(250)

        Row(){
          Text($r('app.string.Width_label'))
            .fontSize(20)
            .fontWeight(400)

          TextInput({placeholder: '请输入图片宽度', text: this.imageWidth.toFixed(0)})
            .width(250)
            .type(InputType.Number)
            .backgroundColor('#36D')
            .onChange((value: string)=>{
              this.imageWidth = parseInt(value)
            })
        }.justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .margin({top: 30})//外边距
        .padding({top: 20, left: 20, right: 20, bottom: 9})//内边距

        Divider()
          .width('91%')

        Row(){
          Button('缩小')
            .fontSize(36)
            .width(180)
            .type(ButtonType.Capsule)
            .onClick(()=>{
              if (this.imageWidth >= 10) {
                this.imageWidth -= 10
              }
            })

          Button('放大')
            .fontColor(Color.White)
            .fontSize(36)
            .width(180)
            .onClick(()=>{
              if (this.imageWidth <= 250) {
                this.imageWidth += 10
              }
            })
        }.width('90%')
        .margin({top: 30})
        .justifyContent(FlexAlign.SpaceEvenly)




        Slider({
          min: 100,
          max: 300,
          value: this.imageWidth,
          step: 10
        })
          .showTips(true)
          .trackThickness(9)
          .width('90%')
          .blockColor('#36D')
          .height(36)
          .margin({top: 30})
          .onChange((value: number)=>{
            this.imageWidth = value
          })

        Button('jumpAbility')
          .type(ButtonType.Circle)
          .fontColor(Color.White)
          .backgroundColor(Color.Blue)
          .onClick((event: ClickEvent) => {

            let  want: Want = {
              deviceId: '',
              bundleName: 'com.example.startarktsdemo',
              moduleName: 'entry',
              abilityName: 'TestAbility',
              parameters: {
                instanceof : 'idx_'
              }
            }
            //跳转
            this.context.startAbility(want)
        })

      }.width('100%')
      .height('100%')
  }
}