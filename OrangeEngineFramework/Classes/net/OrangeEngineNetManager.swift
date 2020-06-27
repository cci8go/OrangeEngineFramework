//
//  OrangeEngineTest.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/23.
//

import Foundation
import AFNetworking


// 添加两种类型 Post，Get
public enum requestType {
    case Post
    case Get
}


public class OrangeEngineNetManager:AFHTTPSessionManager {
    
    
    //单例
    public static let shareManager : OrangeEngineNetManager = {
        let manager  = OrangeEngineNetManager()
        manager.responseSerializer.acceptableContentTypes?.insert("text/html")
        manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return manager
    }()
    
    
    
    // GET/POST
    public func request(type: requestType, urlString: String, parameters: AnyObject?,successBlock: @escaping([String : Any]?) -> (), failureBlock: @escaping (Error?)->()) -> Void {
        
        
        // 成功的闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            successBlock(responseObj as? [String : Any])
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            failureBlock(error)
        }
        
        // 进行请求
        if type==requestType.Get {
            // GET 担心包含中文处理一下
            _ = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            get(urlString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        } else {
            post(urlString, parameters: parameters, progress: nil, success: successBlock, failure: failureBlock)
        }
    }
    
}
