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
        // Do any additional setup after loading the view, typically from a nib.
        
        print(OrangeEngineNetManager.ORANGE_SDK_VERSION)
        
        
//        OrangeEngineNetManager.shared.request(requestType: .GET, urlString: "http://58.246.9.10:19225/rest/sgmw/advertisement", parameters: ["userName": "zhangsan" as AnyObject]) { (json) in
//            print(json as Any)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

