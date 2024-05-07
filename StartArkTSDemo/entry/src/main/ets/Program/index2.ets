import router from '@ohos.router'

@Entry
@Component
struct Index {

  //小鱼坐标
  @State fishX: number = 200
  @State fishY: number = 180
  @State angle: number =  0
  @State src: Resource = $r('app.media.layered_image')


  //  是否开始游戏
  @State isBegin: boolean = false

  build() {
    Row(){
      Stack(){
        Button('返回')
          .position({x: 0, y: 0})
          .backgroundColor('#20101010')
          .onClick((event: ClickEvent) => {
            router.back()
          })

        if (!this.isBegin){
          //开始按钮
          Button('开始游戏')
            .onClick(()=>{
              animateTo(
                {duration: 500},
                ()=>{
                  this.isBegin = true
                }
              )

            })
        } else {
          Image(this.src)
            .backgroundColor(Color.Green)
            .position({x: this.fishX - 20, y: this.fishY - 20})
            .rotate({angle: this.angle, centerX: '50%', centerY: '50%'})
            .width(40)
            .height(40)
            .transition({//组件转场动画 要与animationto组合使用
              type: TransitionType.Insert,
              opacity: 0,
              translate: {x: -250}
            })
          // .animation({duration: 500})//属性动画
          //显式动画 animationto 更灵活
          Row(){
            Button('1').backgroundColor('#20101010')
              .onClick(()=>{
                animateTo(
                  {duration: 500},
                  ()=>{
                    this.fishX -= 20
                  }
                )

              })
            Column({space: 40}){
              Button('2').backgroundColor('#20101010')
                .onClick(()=>{
                  this.fishY -= 20
                })
              Button('3').backgroundColor('#20101010')
                .onClick(()=>{
                  this.fishY += 20
                })
            }
            Button('4').backgroundColor('#20101010')
              .onClick(()=>{
                animateTo(
                  {duration: 500},
                  ()=>{
                    this.fishX += 20
                  }
                )
              })
          }
          .height(240)
          .width(240)

        }

      }
    }
    .justifyContent(FlexAlign.Center)
  }
}