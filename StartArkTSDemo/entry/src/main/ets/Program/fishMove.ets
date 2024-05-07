import router from '@ohos.router'
import curves from '@ohos.curves'

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

  //摇杆中心区域坐标
  private centerX: number = 120
  private centerY: number = 120

  //大小圆半径
  private maxRadius: number = 100
  private radius: number = 20

  //摇杆小圆球初始位置
  @State positionX: number = this.centerX
  @State positionY: number = this.centerY

  //角度正弦 余弦
  sin: number = 0
  cos: number = 0
  speed: number = 10

  taskId: number = -1

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
          //显式动画 animationTo 更灵活
          Row(){
            Circle({width: this.maxRadius * 2, height: this.maxRadius * 2})
              .fill('#20101010')
              .position({x:this.centerX-this.maxRadius, y: this.centerY - this.maxRadius})

            Circle({width: this.radius * 2, height: this.radius * 2})
              .fill('#403A3A3A')
              .position({x:this.positionX-this.radius, y: this.positionY - this.radius})

          }
          .height(240)
          .width(240)
          .justifyContent(FlexAlign.Center)
          .position({x: 0, y: 120})
          .onTouch(this.handleTouchEvent.bind(this))

        }

      }
      .height('100%').width('100%')
    }
    .justifyContent(FlexAlign.Center).height('100%').width('100%')
  }

  //处理手指的移动事件
  handleTouchEvent(event: TouchEvent) {

    switch (event.type) {
      case TouchType.Up:{

        //清除定时任务
        clearInterval(this.taskId)
        this.speed = 0
        animateTo(
          {curve: curves.springMotion()},
          ()=>{
            //5 还原摇杆小球的 坐标
            this.positionX = this.centerX
            this.positionY = this.centerY
          }
        )
      }

        break;
      case TouchType.Down:
        //开始一个定时任务
        this.taskId = setInterval(()=>{
          this.fishX += this.speed * this.cos
          this.fishY += this.speed * this.sin
        }, 40)

        break;
      case TouchType.Move:{
        //1 获取手指位置坐标
        let  x = event.touches[0].x
        let  y = event.touches[0].y

        //2 计算手指与中心的坐标差值
        let  vx = x - this.centerX
        let  vy = y - this.centerY

        //3 计算手指与中心点连线和x轴正半轴的夹脚 单位是弧度
        let angel = Math.atan2(vy, vx)
        //4 计算手指与中心点的距离
        let distance = this.getDistance(vx, vy)

        this.sin = Math.sin(angel)
        this.cos = Math.cos(angel)


        animateTo(
          {curve: curves.responsiveSpringMotion()},
          ()=>{
            //5 计算摇杆小球的 坐标
            this.positionX = this.centerX + distance * this.cos
            this.positionY = this.centerY + distance * this.sin

            //6 修改小鱼的角度
            this.angle = angel * 180 / Math.PI
            this.speed = 10

          }
        )
      }
        break;

      default:
        break;
    }


  }

  getDistance(x: number, y: number) {
    let  d = Math.sqrt(x* x + y * y)

    return Math.min(d, this.maxRadius)
  }

}