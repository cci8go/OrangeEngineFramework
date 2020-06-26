//
//  OrangeEngineTest.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/23.
//

import Foundation
import AFNetworking


//枚举定义请求方式
public enum HTTPRequestType {
    case GET
    case POST
}

public class OrangeEngineNetManager:AFHTTPSessionManager {
    
    public static let ORANGE_SDK_VERSION = "1.0.0"

    
    //单例
    public static let shared = OrangeEngineNetManager()
    
    /// 封装GET和POST 请求
    ///
    /// - Parameters:
    ///   - requestType: 请求方式
    ///   - urlString: urlString
    ///   - parameters: 字典参数
    ///   - completion: 回调
    ///调用的地方NetworkManager.shared.request(requestType: .GET, urlString: "https:www.baidu.com", parameters: ["userName": "zhangsan" as AnyObject]) { (json) in
    /// print(json)}

    
    
    public func request(requestType: HTTPRequestType, urlString: String, parameters: [String: AnyObject]?, completion: @escaping (AnyObject?) -> ()) {

        //成功回调
        let success = { (task: URLSessionDataTask, json: Any)->() in
            completion(json as AnyObject?)
        }

        //失败回调
        let failure = { (task: URLSessionDataTask?, error: Error) -> () in
            print("网络请求错误 \(error)")
            completion(nil)
        }

        _ = ["test":"test"]

        if requestType == .GET {
            get(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        } else {
            post(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
    
}
