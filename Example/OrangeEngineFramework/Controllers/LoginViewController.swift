//
//  LoginViewController.swift
//  SGMW
//
//  Created by 王成诚 on 2020/6/19.
//  Copyright © 2020 王成诚. All rights reserved.
//

import UIKit
import OrangeEngineFramework
import Toast_Swift

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let podName = OrangeEngineConstants.ORANGE_ENGINE_FRAMEWORK_NAME
        let bundleName = OrangeEngineConstants.ORANGE_ENGINE_FRAMEWORK_BUNDLE_NAME
        
        
        let bundle = OrangeEnginePathUtil.getBundleNormalOrPod(bundleName: bundleName, podName: podName)
        
        
        let orangeEngineLoginView =  OrangeEngineLoginView.loadFromNib(bundle: bundle, nibname: "/nib/LoginView")
        
        
        orangeEngineLoginView.setLoginFunBlockProperty { (account, password) in
            print("account=",account,"password=",password)
            
            let urlString = NetConstants.NET_TOKEN_AUTH
            
            var params:[String : String] = [:]
            
            //seymon welcome
            params["userName"] = account
            params["password"] = password
            
            OrangeEngineNetManager.shareManager.request(type: RequestType.GET, urlString: urlString, parameters: params as AnyObject, headers: nil, successBlock: { (dataDic) in
                print("dataDic = ",dataDic as Any)
                
                let resultJson = dataDic as NSDictionary? // json对象
                let status = resultJson?["status"] as? NSInteger
                let success = resultJson?["success"] as? NSInteger
                let errorCode = resultJson?["errorCode"] as? NSInteger
                let message = resultJson?["message"] as? NSString
                let entitiesArray = resultJson?["entities"] as? NSArray // json数组
                
                
                print("解析结果: ")
                print("resultJson = ",resultJson as Any)
                print("status = ",status as Any)
                print("success = ",success as Any)
                print("errorCode = ",errorCode as Any)
                print("message = ",message as Any)
                print("entitiesArray = ",entitiesArray as Any)
                
                if(entitiesArray!.count>0){
                     print("entitiesArray[0] = ",entitiesArray![0])
                    let entitiesValueDic = entitiesArray![0] as! NSDictionary
                    let companyName = entitiesValueDic["companyName"]
                    let token = entitiesValueDic["token"]
                    let userName = entitiesValueDic["userName"]
                    print("companyName=",companyName!,"token=",token!,"userName=",userName!)
                }
               
                
                if(success == 1){
                    let sb = UIStoryboard(name: "Home", bundle:nil)
                    let vc = sb.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    
                    self.view.makeToast((message! as String), duration: 3.0, position: .center)
                }
                
            }) { (error) in
                print("请求出错")
                print(error ?? "")
            }
            
            
        }
        
        self.view.addSubview(orangeEngineLoginView)
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
