@Component
export  struct Header {

  private headerTitle: ResourceStr = ''

  build() {
    Row(){
      Image($r('app.media.back'))
        .width(30)

      Text(this.headerTitle)
        .fontSize(30)
        .fontWeight(400)

      Blank()

      Image($r('app.media.fresh'))
        .width(30)
    }
    .width('100%')
  }
}