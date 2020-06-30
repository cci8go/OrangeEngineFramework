//
//  LoginViewController.swift
//  SGMW
//
//  Created by 王成诚 on 2020/6/19.
//  Copyright © 2020 王成诚. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btnLoginClick(_ sender: Any) {
        print("btnLoginClick")
        
//        let sb = UIStoryboard(name: "Main", bundle:nil)
//
//        let vc = sb.instantiateViewController(withIdentifier: "VC") as! ViewController
//
//        //VC为该界面storyboardID，Main.storyboard中选中该界面View，Identifier inspector中修改
//
//        self.present(vc, animated: true, completion: nil)
        

        let sb = UIStoryboard(name: "Home", bundle:nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "HomeView") as! HomeViewController
        
        //HomeView为该界面storyboardID，Main.storyboard中选中该界面View，Identifier inspector中修改
//        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//        self.present(vc, animated: true, completion: nil)
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    
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
