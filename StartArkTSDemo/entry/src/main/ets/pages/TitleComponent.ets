
import AppContext from '@ohos.app.ability.common';

@Component
export struct  TitleComponent{

  @State title: string = ''
  @Link isFreshData: boolean //定义是否刷新数据

  build() {
    Row({space: 8}){
      Row(){
        //第一部份 返回图标
        Image($r('app.media.back'))
          .width(21)
          .height(21)
          .margin({right: 18})
          .onClick(()=>{
            //返回按钮 退出整个app
            let context = getContext(this) as AppContext.UIAbilityContext//获得上下文对象
            context.terminateSelf()//关闭当前组件

          })
        Text(this.title)
          .fontSize(26)
          .fontColor(Color.Black)
          .onClick(()=>{
            this.isFreshData = !this.isFreshData
          })
      }.width('50%')
      .height('100%')
      .justifyContent(FlexAlign.Start)

      //第二部分
      Row(){
        Image($r('app.media.fresh'))
          .width(21)
          .height(21)
          .onClick(()=>{
            this.isFreshData = !this.isFreshData
          })
      }.width('50%')
      .height('100%')
      .justifyContent(FlexAlign.End)

    }.width('100%')
    .height(47)
    .padding({left: 26, right: 26})
    .margin({top: 10})
    .justifyContent(FlexAlign.Start)

  }
}