//
//  ViewController.swift
//  OrangeEngineFramework
//
//  Created by 153190953@qq.com on 06/23/2020.
//  Copyright (c) 2020 153190953@qq.com. All rights reserved.
//

import UIKit

import OrangeEngineFramework
import SDCycleScrollView


class ViewController: UIViewController {
    
    
    private var mUrlArray :[Any]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mUrlArray = Array.init()
        
        self.mUrlArray?.append("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3055080296,174797887&fm=26&gp=0.jpg")
        
        self.mUrlArray?.append("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593352466681&di=502b5270c35ea4e673d321beb1215441&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F0bdf589b75ec5ec0d7ada8bc30641e8d.jpeg%40wm_2%2Ct_55m%2B5a625Y%2B3L%2BS4ieS4quiIquiIquiIqg%3D%3D%2Cfc_ffffff%2Cff_U2ltSGVp%2Csz_48%2Cx_30%2Cy_30")
        
        self.mUrlArray?.append("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593352466676&di=7b5ca089dab8d1c9f40c2914fa31139e&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F4269f9210ba0906a94be8184bca11beecb1b19c53f6e0-bFSuXR_fw658")
        
        let _:[String] = ["test","tet12","te"]
        
        
        
        let viewAdvertisingView = OrangeEngineAdvertsingView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))

//        viewAdvertisingView.initWithTitle(imageURLStringsGroup: self.mUrlArray, titlesGroup:titleGroup,placeholderImage: UIImage.init(named: "placeholder")!,autoScrollTimeInterval:2.0)
//        viewAdvertisingView.setSDCycleScrollViewCurrentPageDotImage(named: "pageControlCurrentDot")
//        viewAdvertisingView.setSDCycleScrollViewPageDotImage(named: "pageControlDot")
//
        
        viewAdvertisingView.initWith(imageURLStringsGroup: self.mUrlArray, shouldInfiniteLoop: true,autoScrollTimeInterval:2.0)
//        viewAdvertisingView.setSDCycleScrollViewCurrentPageDotImage(named: "OrangeEngineFrameworkbundle.bundle/pageControlCurrentDot@2x.png")
//               viewAdvertisingView.setSDCycleScrollViewPageDotImage(named: "OrangeEngineFrameworkbundle.bundle/pageControlDot@2x.png")
//
        viewAdvertisingView.setJumpBlockProperty { (str) in
            print("跳过界面",str)
        }
        
        let jumpBtn = viewAdvertisingView.getJumpBtn()
//        jumpBtn.backgroundColor=UIColor.gray
        
        jumpBtn.setTitle("测试", for: UIControl.State.normal)
//        jumpBtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.addSubview(viewAdvertisingView)
        
        
        
        
        
        
        
        
//        let viewTest = SDCycleScrollView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), delegate: self, placeholderImage: UIImage.init(named: "placeholder"))
//        viewTest?.imageURLStringsGroup = self.mUrlArray
        
//        self.view.addSubview(viewTest!)
        
//        HttpTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func HttpTest() {
        let urlString = "http://58.246.9.10:19225/rest/sgmw/advertisement"
        
        // Do any additional setup after loading the view, typically from a nib.
        
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
            
            print("请求出错")
            print(error ?? "")
        
        }
    }
    
    
//    public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
//          print("点击")
//      }
//
//      public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
//
//        print(index)
//        if(index + 1 ==  self.mUrlArray!.count){
//              print("最后一张了")
//          }
//      }
    

}

