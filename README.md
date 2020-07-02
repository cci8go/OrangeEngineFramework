# OrangeEngineFramework

[![CI Status](https://img.shields.io/travis/153190953@qq.com/OrangeEngineFramework.svg?style=flat)](https://travis-ci.org/153190953@qq.com/OrangeEngineFramework)
[![Version](https://img.shields.io/cocoapods/v/OrangeEngineFramework.svg?style=flat)](https://cocoapods.org/pods/OrangeEngineFramework)
[![License](https://img.shields.io/cocoapods/l/OrangeEngineFramework.svg?style=flat)](https://cocoapods.org/pods/OrangeEngineFramework)
[![Platform](https://img.shields.io/cocoapods/p/OrangeEngineFramework.svg?style=flat)](https://cocoapods.org/pods/OrangeEngineFramework)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

OrangeEngineFramework is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'OrangeEngineFramework'
```

## Author

Chance, 153190953@qq.com

## License

OrangeEngineFramework is available under the MIT license. See the LICENSE file for more info.




### gem sources -l #(查看当前ruby的源)


### https://cocoapods.org/

### 创建cocoapods trunk账户

    * pod trunk register 153190953@qq.com '一个橙子' --description='描述内容' （邮箱参数是必须的，用户名和--description参数可省略） 
    * 查看你的注册信息（必须在确认cocoapods会话后，才执行）
    * pod trunk me 查看注册信息


### 创建.podspec文件

    .podspec文件的作用是为了让CocoaPods搜索引擎知道该代码的作者、版本号、概要、描述、源代码地址、部署版本、依赖的框架等描述信息。

    创建.podspec文件
    pod spec create OrangeEngineFramework


###  添加git tag

    git add --all
    git commit -m'update framework'
    git push
    git tag 1.0.0
    git push origin --tags

    查看tag
    git tag
    删除tag
    git tag -d “1.0.0”
    删除远程tag
    git push origin :refs/tags/"1.0.0"

### 打包上传CocoaPods

    *  验证类库是否符合 pod 的要求
       pod spec lint OrangeEngineFramework.podspec --allow-warnings
    *  安装 打包插件 
        sudo gem install cocoapods-packager 安装CocoaPods 
       
       *  打包 
        pod package OrangeEngineFramework.podspec --force --dynamic --no-mangle --spec-sources=https://github.com/CocoaPods/Specs.git
        
        
        pod package OrangeEngineFramework.podspec --force --dynamic --no-mangle --spec-sources=https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git

       如果命令后面加条尾巴 --library 则表示打包成 .a 文件，如果不带，则会打包成 .framework 文件。 --force会覆盖之前已存在的文件。完成了就可以在目录下看到***-0.0.1，里面就是你想要的Framework了。
    * 上传到cocoapods
      pod trunk push OrangeEngineFramework.podspec --allow-warnings 


      https://cocoapods.org/pods/OrangeEngineFramework

### 查看某个库信息

	pod trunk info OrangeEngineFramework

### 删除某个库的某个版本，该行为不可回退。

	pod trunk delete OrangeEngineFramework 1.0.0
    官方文档也明确表示 不赞成 使用该命令，建议使用 pod trunk deprecate 代替


### 上传问题

        * 'UIKit/UIKit .h' file not found
        解决方式
        s.platform = :ios
        s.framework = "UIKit"

        * pod trunk push OrangeEngineFramework.podspec  --verbose
  			CDN: trunk Relative path: CocoaPods-version.yml exists! Returning local because checking is only perfomed in repo update
  			删除本地文件 .cocoapods/repos/trunk


### 使用模版创建
    
     pod lib create OrangeEngineFramework




### 参考

       * 打包上传 https://www.jianshu.com/p/20c0b213023c
       
       
    
### Cocopods 国内镜像--让Pod 健步如飞

        cd ~/.cocoapods/repos 
        pod repo remove master
        git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git  master
        pod setup // 不要忘记这一步，这一步是把master 装配上

        pod search '' // 这里随便search 一个库，让cocopods 建立索引

        等待clone 完成，使用的时候在PodFile 中加入
        source  'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
        rm ~/Library/Caches/CocoaPods/search_index.json
        
        pod install --verbose --no-repo-update



### Requirements

    * Xcode Xcode 11+ is required.
    * iOS 9+

### 其它工程使用
  
     * pod search OrangeEngineFramewok
     * pod repo update
     * pod install



### xib 编译成nib


   *  cd /Users/wangchengcheng/Documents/SelfZone/iOS/OrangeEngineFramework/OrangeEngineFramework/Assets/OrangeEngineFrameworkbundle.bundle/xib
   *  ibtool --errors --warnings --output-format human-readable-text --compile /Users/wangchengcheng/Documents/SelfZone/iOS/OrangeEngineFramework/OrangeEngineFramework/Assets/OrangeEngineFrameworkbundle.bundle/nib/LoginView.nib /Users/wangchengcheng/Documents/SelfZone/iOS/OrangeEngineFramework/OrangeEngineFramework/Assets/OrangeEngineFrameworkbundle.bundle/xib/LoginView.xib

