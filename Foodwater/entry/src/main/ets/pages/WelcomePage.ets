import { UserPrivacyDialog } from '../view/welcome/UserPrivacyDialog';
import common from '@ohos.app.ability.common';
import { preferences } from '@kit.ArkData';
import preferenceUtil from '../common/utils/PreferenceUtil';
import router from '@ohos.router';


@Extend(Text)
function opacityWhiteText(opacity: number, fontSize: number) {
  .fontSize(fontSize).opacity(opacity).fontColor(Color.White)

}

const PREF_KEY = 'userPrivacyKey'

@Entry
@Component
struct WelcomePage {

  context = getContext(this) as common.UIAbilityContext

  @State message: string = 'Hello World';
  controller: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog({
      confirm: (): void => this.onConfirm(),
      cancel:(): void => this.exitApp()
    })

  })

  onConfirm() {
    //保存首选项
    preferenceUtil.putPreferenceValue(PREF_KEY, true)
    //跳转首页
    this.jumpToIndex()

  }

  exitApp() {
    //退出app
    this.context.terminateSelf()
  }


  async  aboutToAppear() {
    //加载首选项
    let isAgree = await preferenceUtil.getPreferenceValue(PREF_KEY, false)
    if (isAgree) {
      //同意 跳转首页
      this.jumpToIndex()
    }else {
      //不同意
      this.controller.open()
    }

  }

  jumpToIndex(){
    setTimeout(()=>{
      router.replaceUrl({
        url: 'pages/Index',
      })
    }, 1000)


  }

  build() {
    Column({ space: 10 }) {
      Row() {
        Image($r('app.media.home_slogan'))
          .width(260)
      }
      .layoutWeight(1)

      Image($r('app.media.home_logo'))
        .width(150)

      Row() {
        Text('哈哈健康').opacityWhiteText(0.8, 12)
        Text('IPv6').opacityWhiteText(0.8, 12)
          .border({ style: BorderStyle.Solid, width: 1, color: Color.White, radius: 15 })
          .padding({ left: 5, right: 5 })
          .margin({ left: 2, right: 2 })
        Text('网络').opacityWhiteText(0.8, 12)
      }

      Text('通过健康帮助用户实现身材管理')
        .opacityWhiteText(0.6, 10)
      Text('1234567890ICP')
        .opacityWhiteText(0.3, 10)
        .margin({ bottom: 36 })

    }
    .width('100%').height('100%')
    .backgroundColor($r('app.color.welcome_page_background'))
  }
}