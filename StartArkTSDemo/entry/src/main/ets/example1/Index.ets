
import {TaskDataModel} from './Modules'
import ItemComponent from './ItemComponent'

@Entry
@Component
struct TaskListIndex {

  private  totalData: Array<string> = []//代办列表中所有数据

  aboutToAppear(){
    this.totalData = new TaskDataModel().getData()
  }

  build() {//构建入口的Ui界面
    Column({space: 6}){

      Text('代办')
        .fontSize(25)
        .lineHeight(33)
        .width('80%')
        .fontWeight(FontWeight.Bold)
        .margin({
          top:24,
          bottom: 12
        })
        .textAlign(TextAlign.Start)

      ForEach(this.totalData, (item: string, index?: number)=>{
        ItemComponent({taskContent: item})
      })
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')

  }
}