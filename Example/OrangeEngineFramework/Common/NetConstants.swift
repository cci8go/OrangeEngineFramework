//
//  NetConstants.swift
//  OrangeEngineFramework_Example
//
//  Created by 王成诚 on 2020/7/3.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

class NetConstants {
    public static let NET_BASE_URL = "http://58.246.9.10:19225/rest/sgmw/"
    public static let NET_ADVERTISING = NetConstants.NET_BASE_URL + "advertisement"
    public static let NET_TOKEN_AUTH =  NetConstants.NET_BASE_URL +  "token/auth"  //用户获取token
}
