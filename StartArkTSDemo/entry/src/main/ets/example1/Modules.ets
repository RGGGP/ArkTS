//定义app中需要的模型数据
export class TaskDataModel {
  private tasks: Array<string> = [
    '早起',
    '早餐',
    '读书',
    '学习',
    '游戏',

  ]

  getData(): Array<string> {
    return this.tasks
  }
}

// new TaskDataModel()