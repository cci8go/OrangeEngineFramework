//
//  ViewController.swift
//  OrangeEngineFramework
//
//  Created by 153190953@qq.com on 06/23/2020.
//  Copyright (c) 2020 153190953@qq.com. All rights reserved.
//

import UIKit

import OrangeEngineFramework



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://58.246.9.10:19225/rest/sgmw/advertisement"
        
        // Do any additional setup after loading the view, typically from a nib.

//        OrangeEngineNetManager.shareManager.request(type: .Get, urlString: <#T##String#>, parameters: <#T##AnyObject?#>, successBlock: <#T##([String : Any]?) -> ()#>, failureBlock: <#T##(Error?) -> ()#>)(requestType: .GET, urlString: "http://58.246.9.10:19225/rest/sgmw/advertisement", parameters: ["userName": "zhangsan" as AnyObject]) { (json) in
//            print(json as Any)
//        }
        
        
        let params:[String : String] = [:]
        let headers:[String:String] = [:]
        OrangeEngineNetManager.shareManager.request(type: .GET, urlString: urlString, parameters: params as AnyObject,headers:headers ,successBlock: { (dataDic) in
                       
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
            
            
        }) { (error) in
            print(error ?? "")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

