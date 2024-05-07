
import notify from '@ohos.notificationManager'



@Entry
@Component
struct NotiPage {
  // 全局任务id
  private  idx: number = 100


  build() {
    Column({space: 20}){
      Button('推送1：文本')
        .normalType()
        .onClick(()=>{
          this.publishNormalTextNotification()

        })

      Button('推送1：长文本')
        .normalType()
        .onClick(()=>{
          console.log('11111')
          this.publishLongTextNotification()
        })

      Button('推送1：多行文本')
        .normalType()
        .onClick(()=>{
          this.publishMultiLineNotification()

        })

      Button('推送1：文本带图片')
        .normalType()
        .onClick(()=>{


        })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .normalView()
  }


  publishNormalTextNotification() {
    // let request: notify.NotificationRequest = {
    //   id: this.idx++,
    //   content: {
    //     notificationContentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    //     normal: {
    //       title: '通知标题' + this.idx,
    //       text: '通知内容详情',
    //       additionalText: '通知附加内容'
    //     }
    //   },
    //   showDeliveryTime: true,
    //   deliveryTime: new Date().getTime(),
    //   groupName: 'wechat',
    //   notificationSlotType: notify.SlotType.SOCIAL_COMMUNICATION
    // }
    // this.publish(request)

    let notificationRequest: notify.NotificationRequest = {
      id: 1,
      content: {
        notificationContentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT, // 普通文本类型通知
        normal: {
          title: 'test_title',
          text: 'test_text',
          additionalText: 'test_additionalText',
        }
      }
    }

    notify.publish(notificationRequest, (err) => {
      if (err) {
        console.error(`[ANS] failed to publish, error[${err}]`);
        return;
      }
      console.info(`[ANS] publish success`);
    });

  }

  publishLongTextNotification() {
    let request: notify.NotificationRequest = {
      id: this.idx++,
      content: {
        notificationContentType: notify.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
        longText: {
          title: '通知标题' + this.idx,
          text: '通知内容详情',
          additionalText: '通知附加内容',
          longText: '通知中的长文本，我很长，我很长，我很长，我很长，我很长，我很长，我很长',
          briefText: '通知概要和总结',
          expandedTitle: '通知展开时的标题' + this.idx
        }
      }
    }
    this.publish(request)
  }

  publishMultiLineNotification() {
    let request: notify.NotificationRequest = {
      id: this.idx++,
      content: {

        notificationContentType: notify.ContentType.NOTIFICATION_CONTENT_MULTILINE,
        multiLine: {
          title: '通知标题' + this.idx,
          text: '通知内容详情',
          additionalText: '通知附加内容',
          briefText: '通知概要和总结',
          longTitle: '展开时的标题，我很宽，我很宽，我很宽',
          lines: [
            '第一行',
            '第二行',
            '第三行',
            '第四行',
          ]
        }
      }
    }
    this.publish(request)
  }

  private publish(request: notify.NotificationRequest) {
    notify.publish(request)
      .then(() => console.log('notify test', '发送通知成功'))
      .then(reason => console.log('notify test', '发送通知失败', JSON.stringify(reason)))
  }

 @Styles normalView() {
   .width('100%').height('100%')

 }

}

@Extend(Button) function normalType() {
  .fontSize(26)
  .type(ButtonType.Capsule)
  .backgroundColor(Color.Blue)
}