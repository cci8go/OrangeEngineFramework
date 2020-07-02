//
//  AdvertisingViewController.swift
//  SGMW
//
//  Created by 王成诚 on 2020/6/19.
//  Copyright © 2020 王成诚. All rights reserved.
//  广告轮播页面

import UIKit
import OrangeEngineFramework

class AdvertingViewController: UIViewController {
    
    
    private var mUrlArray :[Any]?
    private var mAdvView:OrangeEngineAdvertsingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let podName = "OrangeEngineFramework"
        let bundleName = "OrangeEngineFrameworkbundle"
        
        let pageControlDot =  OrangeEnginePathUtil.getImageByBundlePath(filename: "pageControlDot@3x", bundleName: bundleName, podName: podName)
        let pageControlCurrentDot =  OrangeEnginePathUtil.getImageByBundlePath(filename: "pageControlCurrentDot@3x", bundleName: bundleName, podName: podName)
        
        let customerPath = OrangeEnginePathUtil.getImageByBundlePath(filename: "LoginRegister/customer@2x", bundleName: bundleName, podName: podName)
               
    
        mAdvView = OrangeEngineAdvertsingView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        
        mAdvView.initWith(shouldInfiniteLoop: true,autoScrollTimeInterval:2.0,placeholderImage: nil)
        mAdvView.setSDCycleScrollViewPageDotImage(named: pageControlDot!)
        mAdvView.setSDCycleScrollViewCurrentPageDotImage(named: pageControlCurrentDot!)
        mAdvView.setJumpTotalSec(totalSecond: 3)
        
        let jumpBtn = mAdvView.getJumpBtn()
        jumpBtn.setTitle("跳过", for: UIControl.State.normal)
        self.view.addSubview(mAdvView)
        
        
        mAdvView.setJumpBlockProperty { (str) in
            print("跳过界面",str)
            
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc , animated: true)
            
            
            
            
        }

    
    
        mUrlArray = Array.init()
        self.mUrlArray?.append("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3055080296,174797887&fm=26&gp=0.jpg")
        
        self.mUrlArray?.append("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593352466681&di=502b5270c35ea4e673d321beb1215441&imgtype=0&src=http%3A%2F%2Fpic.rmb.bdstatic.com%2F0bdf589b75ec5ec0d7ada8bc30641e8d.jpeg%40wm_2%2Ct_55m%2B5a625Y%2B3L%2BS4ieS4quiIquiIquiIqg%3D%3D%2Cfc_ffffff%2Cff_U2ltSGVp%2Csz_48%2Cx_30%2Cy_30")
        self.mUrlArray?.append("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593352466676&di=7b5ca089dab8d1c9f40c2914fa31139e&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F4269f9210ba0906a94be8184bca11beecb1b19c53f6e0-bFSuXR_fw658")
        
        
        
        advertsingProgress()
    }
    
    
    
    // MARK:  广告图
    func advertsingProgress() {
        
        
        let urlString = "http://58.246.9.10:19225/rest/sgmw/advertisement"
        
        
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
                let url = valueDictionary["url"]
                let seq = valueDictionary["seq"] as? NSInteger
                print("url = ",url as Any,"seq = ",seq as Any )
                self.mUrlArray?.append(url as Any)
            }
            
            
            self.mAdvView.setImageGroups(imageURLStringsGroup: self.mUrlArray)
            
        }) { (error) in
            
            print("请求出错")
            print(error ?? "")
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillDisappear(animated)
    }
}
