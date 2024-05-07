

@Observed
export class Task {
  //静态变量 是所有变量共享的id  每一个初始化的id都会共享
  static id: number = 1

  name: string = `任务${Task.id++}`

  finished: boolean = false

}