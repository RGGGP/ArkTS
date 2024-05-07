
import preferences from '@ohos.data.preferences';

class PreferencesUtil {

  prefMap: Map<string, preferences.Preferences> = new Map()

  async  loadPreference(context: Context, name: string) {


     // preferences.getPreferences(context, name)
     //   .then(
     //     pref=>{
     //       this.prefMap.set(name, pref)
     //       console.log('加载成功',`${name}成功`,JSON.stringify(pref))
     //     }
     //   )
     //   .catch((reason: string)=>{
     //     console.log('加载失败',`${name}失败`,JSON.stringify(reason))
     //   })

    try {
      //加载preference（同步写法）
      let pref = await preferences.getPreferences(context, name)
      this.prefMap.set(name,pref)
      console.log('加载成功',`${name}成功`,JSON.stringify(pref))
    } catch (e) {
      console.log('加载失败',`${name}失败`,JSON.stringify(e))
    }
  }

//写
  async putPreferenceValue(name: string, key: string, value: preferences.ValueType) {
    if (!this.prefMap.has(name)) {
      console.log('加载preferenceName失败:尚未初始化',`${name}失败`)
      return
    }
    try {
      let pref = this.prefMap.get(name)
      //写入数据
      await pref?.put(key, value)
      //刷盘
      await pref?.flush()
      console.log('保存成功',`${name}成功`,JSON.stringify(pref))
    } catch (e) {
      console.log('保存失败',`${name}失败`,JSON.stringify(e))
    }
  }


  async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType) {
    if (!this.prefMap.has(name)) {
      console.log('加载preferenceName失败:尚未初始化',`${name}失败`)
      return
    }
    try {
      let pref = this.prefMap.get(name)
      //读取数据
      let value = await pref?.get(key, defaultValue)

      console.log('读取成功',`${name}成功`,JSON.stringify(pref))
      return value
    } catch (e) {
      console.log('读取失败',`${name}失败`,JSON.stringify(e))
      return
    }
  }


}

const preferencesUtil = new PreferencesUtil()

export default preferencesUtil as PreferencesUtil