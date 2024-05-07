import image from '@ohos.multimedia.image'
@Component
export default struct ItemComponent {
  private taskContent: string = '' //代办任务的内容
  @State isComplete: boolean = false//是否完成任务
  @Builder
  CreateIcon(icon: Resource){
    Image(icon)
      .width(28)
      .height(28)
      .objectFit(ImageFit.Contain)
      .margin(20)
  }

  build() {//构建任务的Ui界面
    Row(){
      //图标
      if (this.isComplete){
        this.CreateIcon($r('app.media.ic_ok'))
      }else {
        this.CreateIcon($r('app.media.ic_default'))
      }

      //文本
      Text(this.taskContent)
        .fontSize(20)
        .fontWeight(500)
        .decoration({type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None})
        .opacity(this.isComplete ? 0.5 : 1)//根据任务是否完成设置透明度
    }
    .borderRadius(24)
    .backgroundColor(Color.White)
    .width('93%')
    .height(48)
    .onClick(()=>{
      this.isComplete = !this.isComplete
    })
  }
}