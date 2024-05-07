import router from '@ohos.router';
import CommonConstants from './CommonConstants'
import {Home} from './Home'
import {MySetting} from './MySetting'

@Entry
@Component
struct Index {

  private tabsController: TabsController = new TabsController()
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX

  @State account: number = 111
  onPageShow(){//接受路由参数
    let acc = router.getParams() as Record<string, number>
    if (acc) {
      this.account = acc['sendMessage']
    }
  }

  @Builder
  TabBuild(title: string, index: number, selectImage: Resource, normalImage: Resource){
    Column(){
      Image(this.currentIndex == index ? selectImage : normalImage)
        .width($r('app.float.mainPage_baseTab_size'))
        .height($r('app.float.mainPage_baseTab_size'))
      Text(title)
        .margin({ top: $r('app.float.mainPage_baseTab_top') })
        .fontSize($r('app.float.main_tab_fontSize'))
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }.justifyContent(FlexAlign.Center)
    .height($r('app.float.mainPage_barHeight'))
    .width(CommonConstants.FULL_PARENT)
    .onClick(()=>{
      //点击事件
      this.currentIndex = index
      this.tabsController.changeIndex(this.currentIndex)//修改怒页签的索引 从而造成页面切换
    })


  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }){
      //第一个页签 首页
      TabContent(){
        Home()
      }.padding({
        left: $r('app.float.mainPage_padding'),
        right: $r('app.float.mainPage_padding')
      })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuild(CommonConstants.HOME_TITLE, CommonConstants.HOME_TAB_INDEX, $r('app.media.home_selected'), $r('app.media.home_normal')))
      //第二个页签 我的
      TabContent(){
        MySetting({account: this.account})
      }.padding({
        left: $r('app.float.mainPage_padding'),
        right: $r('app.float.mainPage_padding')
      })
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.TabBuild(CommonConstants.MINE_TITLE, CommonConstants.MINE_TAB_INDEX, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }.width(CommonConstants.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight($r('app.float.mainPage_barHeight'))
    .barMode(BarMode.Fixed)
  }
}