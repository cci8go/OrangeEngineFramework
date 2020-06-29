//
//  OrangeEngineImagePathUtil.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/29.
//

import Foundation


public class OrangeImagePathUtil {
    
    
    
    public static func getBundleNormalOrPod(bundleName:String?,podName:String?)->Bundle{
        
        var bundleName = bundleName
        var podName = podName
        if bundleName == nil && podName == nil {
            print("bundleName和podName不能同时为空")
        } else if bundleName == nil {
            bundleName = podName
        } else if podName == nil {
            podName = bundleName
        }
        
        if bundleName?.contains(".bundle") ?? false {
            bundleName = bundleName?.components(separatedBy: ".bundle").first
        }
        
        //没使用framwork的情况下
        var associateBundleURL = Bundle.main.url(forResource: bundleName, withExtension: "bundle")
        //使用framework形式
        if associateBundleURL == nil {
            associateBundleURL = Bundle.main.url(forResource: "Frameworks", withExtension: nil)
            associateBundleURL = associateBundleURL?.appendingPathComponent(podName ?? "")
            associateBundleURL = associateBundleURL?.appendingPathExtension("framework")
            var associateBunle: Bundle? = nil
            if let associateBundleURL = associateBundleURL {
                associateBunle = Bundle(url: associateBundleURL)
            }
            associateBundleURL = associateBunle?.url(forResource: bundleName, withExtension: "bundle")
        }
        
        assert(associateBundleURL != nil, "取不到关联bundle")
        //生产环境直接返回空
        if let associateBundleURL = associateBundleURL {
            associateBundleURL != nil ? Bundle(url: associateBundleURL) : nil
        }
        
        return ((associateBundleURL != nil) ? Bundle(url: associateBundleURL!) : nil)!
    }
    
    
    
    //从bundlew文件中获取图片
    public static func getImageByBundlePath(filename: String?,bundleName:String?,podName:String?) -> String? {
        
    
        let libBundle = getBundleNormalOrPod(bundleName: bundleName, podName: podName)

        if libBundle != nil && filename != nil {
            let path1 = libBundle.path(forResource: filename, ofType: ".png")
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
