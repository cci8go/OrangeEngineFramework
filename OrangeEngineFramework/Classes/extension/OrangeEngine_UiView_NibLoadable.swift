//
//  UiView_Extension.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/7/1.
//



// MARK: - How to initialise a UIView Class with a xib file in Swift
public protocol OrangeEngineUiViewNibLoadable {
    
}

extension OrangeEngineUiViewNibLoadable where Self : UIView {
    
    //在协议里面不允许定义class 只能定义static
    
    /**
        - parameter nibname: 参数  为空寻找同类名nib文件
        - returns: 
     */
    public static func loadFromNib(_ nibname: String? = nil) -> Self {//Self (大写) 当前类对象
        //self(小写) 当前对象
        let loadName = nibname == nil ? "\(self)" : nibname!
                
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
    
    
    public static func loadFromNib(bundle :Bundle!, nibname: String? = nil) -> Self {//Self (大写) 当前类对象
           //self(小写) 当前对象
           let loadName = nibname == nil ? "\(self)" : nibname!
           return bundle.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
       }
}
