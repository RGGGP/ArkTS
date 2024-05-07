@Component
export struct  ItemComponent{

  private index: number = 0
  private name: string = ''
  private vote: string = ''

  @State isChoose: boolean = false

  build() {
    Row(){
      //共3部分

      //第一部分
      Column(){

        if (this.isCircleText()){
          this.createCircleText(this.index)
        }else {
          Text(this.index.toString())
            .lineHeight(24)
            .textAlign(TextAlign.Center)
            .fontSize(16)
            .fontWeight(400)
            .width(24)
        }

      }.width('20%')
      .alignItems(HorizontalAlign.Start)

      //第二部分
      Text(this.name)
        .width('50%')
        .fontSize(18)
        .fontWeight(500)
        .fontColor(this.isChoose ? Color.Blue : '#182431')

      //第三部分
      Text(this.vote)
        .width('30%')
        .fontSize(18)
        .fontWeight(500)
        .fontColor(this.isChoose ? Color.Blue : '#182431')

    }.width('100%')
    .height('48')
    .onClick(()=>{
      //选中状态变量修改
      this.isChoose = !this.isChoose
    })

  }


  @Builder createCircleText(index: number) {
    Row(){
      Text(this.index.toString())
        .fontWeight(400)
        .fontSize(16)
        .fontColor(Color.White)
    }.justifyContent(FlexAlign.Center)
    .borderRadius(24)
    .size({width: 24, height: 24})
    .backgroundColor(Color.Blue)
  }


  isCircleText(): boolean {
    return this.index === 1 || this.index === 2 || this.index === 3
  }

}