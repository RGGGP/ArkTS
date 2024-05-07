

import { InfoModel } from '../Info/infoModel';
import http from '@ohos.net.http';
import { hilog } from '@kit.PerformanceAnalysisKit';
import axios, { AxiosResponse } from '@ohos/axios'
class NetModel {
  /*
   * https://comment.api.163.com/api/v1/products/a2869674571f77b5a0867c3d71db5856/threads
   * /J0UUO3LB0514R9P4/comments
   * /hotList?offset=0&limit=10&headLimit=1&tailLimit=1&ibc=newswap*/
  baseUrl: string = 'http://localhost:3000'
  getShopList(): Promise<Record<string,string>> {

    return new Promise((resolve, reject)=>{
      //1 创建http的请求对象
      let  httpRequest = http.createHttp()

      //2 发送请求
      //httpRequest.request(
      //       //   `${this.baseUrl}/hotList?offset=0&limit=10&headLimit=1&tailLimit=1&ibc=newswap`,
      //       //   {
      //       //     method: http.RequestMethod.GET
      //       //   }
      //       // )

      //axios 的方式
      axios.get(
      `${this.baseUrl}/shop?pageNo=1&pageSize=3`,
        {

        }
      )
        .then((value: AxiosResponse<string>) => {
          // if (value.responseCode === 200) {
          //   //查询成功
          //   let dic: Record<string, string> = value.result as Record<string, string>
          //   console.log('查询成功:',value.result.toString())
          //   console.log('解析成功:',dic)
          //   resolve(JSON.parse(dic.toString()))
          // }else {
          //   console.log('失败1')
          //   reject('查询失败')
          // }
          //查询成功
          console.log('查询成功:',JSON.stringify(value))
          resolve(JSON.parse(value.toString()))

        })
        .catch((err: string) =>{
          reject(('查询失败' + err))
        })

    })



  }

}

const requestModel = new NetModel()

export  default requestModel as NetModel