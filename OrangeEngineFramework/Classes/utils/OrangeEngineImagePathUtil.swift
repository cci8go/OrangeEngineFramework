//
//  OrangeEngineImagePathUtil.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/29.
//

import Foundation


public class OrangeImagePathUtil {
    
    
    //从bundlew文件中获取图片
    public static func getImageByBundlePath(filename: String?,bundleName:String?) -> String? {
        
    
        var bundlePath = Bundle.main.path(forResource:bundleName, ofType:"bundle")
        if(bundlePath == nil){
            print("print bundle ",bundleName as Any," not exit")
            return nil
        }
        let libBundle = Bundle.init(path: bundlePath!)
        
        if libBundle != nil && filename != nil {
            let path1 = libBundle?.path(forResource: filename, ofType: ".png")
            return path1
        } else {
            print("print path1 is null")
        }
        return nil
    
    }
    
    //从本地路径获取
    public static func getImagePath(forResource name: String?) ->String?{
        let imagePath:String = Bundle.main.path(forResource: name, ofType: "png")!
        return imagePath
    }
    
}
