import Want from '@ohos.app.ability.Want'
import { common } from '@kit.AbilityKit'

class Person{
  name: string
  age: number
  gf: Person
  constructor(name: string, age: number, gf?:Person) {
    this.name = name
    this.age = age
    this.gf = gf as Person
  }
}


@Entry
@Component
struct StatePage {
  @State p:Person = new Person('jj', 18, new Person('mm', 18))
  @State gfs: Array<Person> = [
    new Person('men', 18),
    new Person('han', 18),
  ]

  idx: number = 1
  private context = getContext(this) as common.UIAbilityContext


  build() {
    Column({space: 8}){
      Text(`${this.p.name} : ${this.p.age}`)
        .onClick(()=>{
          this.p.age += 1
        })

      Button('back')
        .backgroundColor(Color.Blue)
        .onClick((event: ClickEvent) => {
          let  want: Want = {
            deviceId: '',
            bundleName: 'com.example.startarktsdemo',
            moduleName: 'entry',
            abilityName: 'EntryAbility',

          }
          //跳转
          this.context.startAbility(want)
      })
      Button('add gf')
        .onClick(()=>{
          this.gfs.push(new Person('gf'+this.idx++, 18))
        })
      Text('女友列表')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      ForEach(
        this.gfs,
        (item: Person, index: number) => {
          Row(){
            Text(`${item.name} : ${item.age}`)
              .fontSize(32)
              .onClick(()=>{
                item.age ++
              })
            Button('delete')
              .onClick(()=>{
                this.gfs.splice(index, 1)
              })
          }
          .justifyContent(FlexAlign.SpaceAround)

        }
      )

    }
    .padding({top: 20})
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}