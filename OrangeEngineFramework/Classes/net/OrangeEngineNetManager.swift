//
//  OrangeEngineTest.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/23.
//

import Foundation
import AFNetworking


// 添加两种类型 POST，GET
public enum RequestType {
    case POST
    case GET
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
    public func request(type: RequestType, urlString: String, parameters: AnyObject?,headers: [String:String]?,successBlock: @escaping([String : Any]?) -> (), failureBlock: @escaping (Error?)->()) -> Void {
        
        // 成功的闭包
        let successBlock = { (task: URLSessionDataTask, responseObj: Any?) in
            successBlock(responseObj as? [String : Any])
        }
        
        // 失败的闭包
        let failureBlock = { (task: URLSessionDataTask?, error: Error) in
            failureBlock(error)
        }
        
        // 进行请求
        if type==RequestType.GET {
            // GET 担心包含中文处理一下
            _ = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            get(urlString, parameters: parameters, headers: nil, progress: nil, success: successBlock, failure: failureBlock)
            
            
        } else {
            post(urlString, parameters: parameters, headers: headers, progress: nil, success: successBlock, failure: failureBlock)
        }
    }
    
}
