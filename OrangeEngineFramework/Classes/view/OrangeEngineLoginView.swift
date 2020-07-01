//
//  OrangeEngineLoginView.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/7/1.
//

import UIKit

public class OrangeEngineLoginView: UIView,OrangeEngineUiViewNibLoadable {
    
    @IBOutlet var accountTextField: [UITextField]!
    
    @IBOutlet var passwrodTextField: [UITextField]!
    
     override  public init(frame: CGRect) {
          super.init(frame: frame)
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
           
    }
}
