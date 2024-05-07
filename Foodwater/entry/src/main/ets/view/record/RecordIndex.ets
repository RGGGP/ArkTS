import { RecordList } from './RecordList'
import { SearchHeader } from './SearchHeader'
import { StatesCard } from './StatwsCard'


@Component
export struct RecordIndex {
  build() {
    Column(){
      //头部搜索蓝
      SearchHeader()

      //统计卡片
      StatesCard()

      //记录列表
      RecordList()

    }
    .justifyContent(FlexAlign.Start)
    .width('100%').height('100%')
    .backgroundColor($r('app.color.index_page_background'))
  }
}