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
    private var m_Timer:Timer!
    private var m_Second:Int!
    
    
    override  public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //不带标题
    public func initWith(imageURLStringsGroup: [Any]!,shouldInfiniteLoop:Bool,autoScrollTimeInterval:CGFloat){
    
        

        
        m_SDCycleScrollView =  SDCycleScrollView(frame: self.frame, shouldInfiniteLoop: shouldInfiniteLoop, imageNamesGroup: imageURLStringsGroup)
        
        m_SDCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        
        m_SDCycleScrollView.currentPageDotColor = UIColor.green; // 自定义分页控件小圆标颜色
        m_SDCycleScrollView.autoScrollTimeInterval = autoScrollTimeInterval
        m_SDCycleScrollView.imageURLStringsGroup = imageURLStringsGroup
        m_SDCycleScrollView.delegate = self
        m_SDCycleScrollView.backgroundColor = UIColor.white
//        m_SDCycleScrollView.pageDotImage = UIImage.init(named: "OrangeEngineFrameworkbundle.bundle/pageControlDot@2x.png")
//        m_SDCycleScrollView.currentPageDotImage = UIImage.init(named: "OrangeEngineFrameworkbundle.bundle/pageControlCurrentDot@2x.png")
//
    
//
//        let pageControlDotImage:String? = OrangeEngineImagePathUtil.getImageByBundlePath(filename: "pageControlDot@3x", bundleName: "OrangeEngineFrameworkbundle",podName: "OrangeEngineFramework")
//
//        let currentPageDotImage:String? = OrangeEngineImagePathUtil.getImageByBundlePath(filename: "pageControlCurrentDot@3x", bundleName: "OrangeEngineFrameworkbundle",podName: "OrangeEngineFramework")

//
        m_SDCycleScrollView.pageDotImage = UIImage.init(named: pageControlDotImage!)
        m_SDCycleScrollView.currentPageDotImage = UIImage.init(named: currentPageDotImage!)
//
        self.m_imageURLStringsGroup = imageURLStringsGroup
        self.addSubview(m_SDCycleScrollView)
        
        createJumpBtn()
        
    }
    
    
    //带标题
    public func initWithTitle(imageURLStringsGroup: [Any]!,titlesGroup:[Any]!,placeholderImage:UIImage,autoScrollTimeInterval:CGFloat) {
        
        m_SDCycleScrollView = SDCycleScrollView(frame: self.frame, delegate: self, placeholderImage: placeholderImage)
        m_SDCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        m_SDCycleScrollView.currentPageDotColor = UIColor.green; // 自定义分页控件小圆标颜色
        m_SDCycleScrollView.autoScrollTimeInterval = autoScrollTimeInterval
        m_SDCycleScrollView.imageURLStringsGroup = imageURLStringsGroup
        m_SDCycleScrollView.titlesGroup = titlesGroup
        m_SDCycleScrollView.infiniteLoop = false

        self.m_imageURLStringsGroup = imageURLStringsGroup
        self.addSubview(m_SDCycleScrollView)
        
        createJumpBtn()
    }
    
    
    
    
    
    
    public func setSDCycleScrollViewPageDotImage(named:String){
        self.m_SDCycleScrollView.pageDotImage = UIImage.init(named: named)
    }
    
    public func setSDCycleScrollViewCurrentPageDotImage(named:String){
        self.m_SDCycleScrollView.currentPageDotImage = UIImage.init(named: named)
    }
    
    
    func createJumpBtn() {
        // 创建一个常规的button
        print(self.bounds.width,self.bounds.height)
        let button = UIButton(type:.custom)
        button.frame = CGRect(x:self.bounds.width-80, y:self.bounds.height-80, width:80, height:30)
        button.setTitle("跳过", for: .normal)
        button.setImage(UIImage(named:"pageControlDot.png"), for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        //无参数点击事件
        //button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        //带button参数传递
        button.addTarget(self, action: #selector(buttonJumpClick(button:)), for: .touchUpInside)
       
        self.addSubview(button)
    }
    
    //无参数点击事件
    @objc func buttonJumpClick(button:UIButton){
          print("buttonJumpClick")
    }
    
    
    public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        print("点击:",index)
    }
    
    public func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
        if(index + 1 ==  self.m_imageURLStringsGroup.count){
            print("最后一张了")
            
            startTimer()
        }
    }
    
    // 2.开始计时
    func startTimer() {

        stopTimer()
        m_Second = 2
        m_Timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updataSecond), userInfo: nil, repeats: true)
        //调用fire()会立即启动计时器
//        m_Timer!.fire()
     }
    
    // 3.定时操作
    @objc func updataSecond() {
        if m_Second>1 {
           //.........
           m_Second -= 1
            print("m_Second=",m_Second)
        }else {
           stopTimer()
           print("跳转界面")
        }
    }
    

    // 4.停止计时
    func stopTimer() {
        if m_Timer != nil {
             m_Timer!.invalidate() //销毁timer
             m_Timer = nil
         }
     }
}
