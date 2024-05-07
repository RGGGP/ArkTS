import {Task} from './Task'

//统一的卡片样式
@Styles function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius: 6, color:'#1F000000', offsetX:2, offsetY:4})
}

//任务完成样式
@Extend(Text)
function finishedTask() {
  .decoration({type: TextDecorationType.LineThrough})
  .fontColor('#B1B2B1')
}

class TaskInfo {
  totalTask: number = 0
  finishTask: number = 0
}


@Entry
@Component
struct Index {

  @State info: TaskInfo = new TaskInfo()
  // //总任务数
  // @State totalTask: number = 0
  // //完成任务数
  // @State finishTask: number = 0

  build() {
    Column({space: 10}){

      //第一部份 任务进度卡片
      // TaskProperty({finishTask: this.info.finishTask, totalTask: this.info.totalTask, info: this.info})
      TaskProperty({info: this.info})


      //第二部分 新增任务按钮
      // TaskList({finishTask: this.finishTask, totalTask: this.totalTask})
      TaskList({info: this.info})


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }




}


@Component
struct TaskProperty {
  //prop 单项渲染的时候选用，不需要回传
  @Prop info: TaskInfo
  //状态变量
  // @Prop totalTask: number
  // //完成任务数
  // @Prop finishTask: number

  build() {
    Row(){
      Text('任务进度:')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Stack(){
        Progress({
          value: this.info.finishTask,
          total: this.info.totalTask,
          type: ProgressType.Ring
        })
        // .width('100%')
        Row(){
          Text(this.info.finishTask.toString())
            .fontSize(24)
            .fontColor('#36D')

          Text(' / ' + this.info.totalTask.toString())
            .fontSize(24)
        }
      }


    }
    .card()
    .margin({top: 20, bottom: 10})
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

@Component
struct TaskList {
  //link 双向传值，子组件会修改数据并且需要传输到父组件
  @Link info: TaskInfo
  //总任务数
  // @Link totalTask: number
  // //完成任务数
  // @Link finishTask: number

  @State tasks: Task[] =[]

  handleTaskChange(){
    this.info.totalTask = this.tasks.length
    this.info.finishTask = this.tasks.filter(item => item.finished).length
  }

  @Builder DeleteButton(index: number) {
    Button(){
      Image($r('app.media.back'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .backgroundColor(Color.Red)
    .type(ButtonType.Circle)
    .margin({left: 8})
    .onClick((event: ClickEvent) => {
      this.tasks.splice(index, 1)
      this.handleTaskChange()
    })
  }

  build() {
    Column(){
      Button('新增任务')
        .width(200)
        .onClick(()=>{
          //新增任务数据
          this.tasks.push(new Task())

          this.handleTaskChange()

        })


      //第三步分 任务列表
      List({space: 10}){
        ForEach(
          this.tasks,
          (item: Task, index: number)=>{
            ListItem(){
              Row(){
                Text(item.name)
                  .fontSize(20)

                Checkbox()
                  .select(item.finished)
                  .onChange((val)=>{
                    //更新当前任务状态
                    item.finished = val
                    //更新当前已完成任务数量
                    this.handleTaskChange()
                  })
              }
              .justifyContent(FlexAlign.SpaceBetween)
              .card()
            }
            .swipeAction({end: this.DeleteButton(index)})

          }
        )
      }
      .margin({top: 20})
      .width('100%')
      .alignListItem(ListItemAlign.Center)
      .layoutWeight(1)
    }
    }

}