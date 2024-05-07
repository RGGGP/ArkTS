import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export struct SearchHeader {
  build() {
    Row({space: CommonConstants.SPACE_6}){
      Search({
        placeholder: '搜索饮食信息'
      })
        .layoutWeight(1)
        .textFont({size: 18})

      Badge({count: 1, position: BadgePosition.RightTop, style: {fontSize: 12}}){
        Image($r('app.media.ic_public_email'))
          .width(26)
      }


    }
    .width('90%')
  }
}