#
# Be sure to run `pod lib lint OrangeEngineFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OrangeEngineFramework'
  s.version          = '1.0.4'
  s.summary          = 'A short description of OrangeEngineFramework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/cci8go/OrangeEngineFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '一个橙子' => '153190953@qq.com' }
  s.platform         = :ios
  s.source           = { :git => 'https://github.com/cci8go/OrangeEngineFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

#  s.source_files = 'OrangeEngineFramework/Classes/**/*'
  

  
#  s.public_header_files = 'OrangeEngineFramework/Classes/**/*'
  s.frameworks = 'UIKit'
  
  #s.static_framework = true
  
  
s.subspec "common" do |ss|
   ss.source_files  = "OrangeEngineFramework/Classes/common/*.swift"
  #ss.framework  = "Foundation"
end
  
s.subspec "net" do |ss|
   ss.source_files  = "OrangeEngineFramework/Classes/net/*.swift"
   #ss.framework  = "Foundation"
end
  
# 依赖的三方库
s.dependency 'AFNetworking', '~>4.0.1'
s.dependency 'SDCycleScrollView','~>1.80'

end
