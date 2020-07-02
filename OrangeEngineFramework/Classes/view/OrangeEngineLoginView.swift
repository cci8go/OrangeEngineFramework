//
//  OrangeEngineLoginView.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/7/1.
//

import Foundation
import UIKit


public typealias loginFucBlock = (_ account:String,_ password:String) ->()

public class OrangeEngineLoginView: UIView,OrangeEngineUiViewNibLoadable {
    
    
    private var m_LoginBlock:loginFucBlock!
    
    @IBOutlet var m_AccountTextField: UITextField!
    
    @IBOutlet var m_PasswrodTextField: UITextField!
    
    
    //设置回调事件
    public func setLoginFunBlockProperty(block: @escaping loginFucBlock){
        m_LoginBlock = block
    }
    
    override  public init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        print("btnLogin")
        
        let account:String = m_AccountTextField.text!
        let password:String = m_PasswrodTextField.text!
        
        if m_LoginBlock != nil {
            m_LoginBlock(account,password)
        }
    }
    
    
    
    
}
