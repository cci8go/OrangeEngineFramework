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
    /** 结果解析
     print("dataDic = ",dataDic as Any)
     
     let resultJson = dataDic as NSDictionary? // json对象
     let status = resultJson?["status"] as? NSInteger
     let success = resultJson?["success"] as? NSInteger
     let errorCode = resultJson?["errorCode"] as? NSInteger
     let message = resultJson?["message"] as? NSString
     let entitiesArr = resultJson?["entities"] as? NSArray // json数组
     
     
     print("解析结果: ")
     print("resultJson = ",resultJson as Any)
     print("status = ",status as Any)
     print("success = ",success as Any)
     print("errorCode = ",errorCode as Any)
     print("message = ",message as Any)
     print("entitiesArr = ",entitiesArr as Any)
     
     for value in entitiesArr! as NSArray{
        let valueDictionary = value as! NSDictionary
        let url = valueDictionary["url"] as? NSString
        let seq = valueDictionary["seq"] as? NSInteger
        print("url = ",url as Any,"seq = ",seq as Any )
     }
     */
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
