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
        
        
        let param:[String : String] = [:]
        OrangeEngineNetManager.shareManager.request(type: .Get, urlString: urlString, parameters: param as AnyObject, successBlock: { (dataDic) in
//            print(dataDic ?? Dictionary())
            
//            print(dataDic!["entities"] as Any)
                        
            
            if let listArray = dataDic?["entities"] as? NSArray {
                for value in listArray {
                    print(value)
                }
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

