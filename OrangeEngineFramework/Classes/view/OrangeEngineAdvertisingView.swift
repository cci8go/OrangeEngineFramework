//
//  OrangeEngineAdvertisingView.swift
//  OrangeEngineFramework
//
//  Created by 王成诚 on 2020/6/28.
//  广告轮播界面

import Foundation
import SDCycleScrollView


public class OrangeEngineAdvertsingView:UIView, SDCycleScrollViewDelegate{
    
    
    private var m_SDCycleScrollView:SDCycleScrollView!
    private var m_imageURLStringsGroup:[Any]!
    
    
    //不带标题
    public func initWith(frame:CGRect,imageURLStringsGroup: [Any]!,shouldInfiniteLoop:Bool,autoScrollTimeInterval:CGFloat) {
        
        m_SDCycleScrollView =  SDCycleScrollView(frame: frame, shouldInfiniteLoop: shouldInfiniteLoop, imageNamesGroup: imageURLStringsGroup)
        
        m_SDCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        
        m_SDCycleScrollView.currentPageDotColor = UIColor.green; // 自定义分页控件小圆标颜色
        m_SDCycleScrollView.autoScrollTimeInterval = autoScrollTimeInterval
        m_SDCycleScrollView.imageURLStringsGroup = imageURLStringsGroup
        m_SDCycleScrollView.delegate = self
        
        self.m_imageURLStringsGroup = imageURLStringsGroup
        self.addSubview(m_SDCycleScrollView)
    }
    
    
    //带标题
    public func initWithTitle(frame:CGRect,imageURLStringsGroup: [Any]!,titlesGroup:[Any]!,placeholderImage:UIImage,autoScrollTimeInterval:CGFloat) {
        
        m_SDCycleScrollView = SDCycleScrollView(frame: frame, delegate: self, placeholderImage: placeholderImage)
        m_SDCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        m_SDCycleScrollView.currentPageDotColor = UIColor.green; // 自定义分页控件小圆标颜色
        m_SDCycleScrollView.autoScrollTimeInterval = 2.0
        m_SDCycleScrollView.imageURLStringsGroup = imageURLStringsGroup
        m_SDCycleScrollView.titlesGroup = titlesGroup
        
        self.m_imageURLStringsGroup = imageURLStringsGroup
        self.addSubview(m_SDCycleScrollView)
    }
    
    
    public func setSDCycleScrollViewPageDotImage(named:String){
        self.m_SDCycleScrollView.pageDotImage = UIImage.init(named: named)
    }
    
    public func setSDCycleScrollViewCurrentPageDotImage(named:String){
        self.m_SDCycleScrollView.currentPageDotImage = UIImage.init(named: named)
    }
    
    
    
    
    //     public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
    //
    //        print(index)
    //    }
    
    
    public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击")
    }
    
    public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
        if(index + 1 ==  self.m_imageURLStringsGroup.count){
            print("最后一张了")
        }
    }
    
}
