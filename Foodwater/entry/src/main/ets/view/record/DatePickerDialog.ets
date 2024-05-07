import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export struct DatePickDialog{
  controller: CustomDialogController

  selectedDate: Date = new Date()

  build() {
    Column({space: CommonConstants.SPACE_12}){

      //日期选择
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date(),
        selected: this.selectedDate
      })

        .onDateChange((value: Date) => {
          this.selectedDate = value
          // this.selectedDate.setFullYear(value.getFullYear(), value.getMonth(), value.getDay())
          console.info('select current date is: ' + value.toString())
        })
      //按钮
      Row({space: CommonConstants.SPACE_8}){
        Button('cancel')
          .width(120)
          .backgroundColor($r('app.color.light_gray'))
          .onClick((event: ClickEvent) => {
            this.controller.close()
        })

        Button('confirm')
          .width(120)
          .backgroundColor($r('app.color.primary_color'))
          .onClick((event: ClickEvent) => {
            //保存数据到全局
            AppStorage.setOrCreate('selectedDate', this.selectedDate.getTime())
            //关闭窗口
            this.controller.close()
          })
      }

    }
    .padding(CommonConstants.SPACE_12)

  }
}

