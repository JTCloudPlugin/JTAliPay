#
#  Be sure to run `pod spec lint JTWeexTest.podspec' to ensure this is a
# 
# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "JTAliPay"
  s.version      = "1.0.1"
  s.summary      = "JTAliPay Source ."
  s.homepage     = 'https://github.com/JTCloudPlugin/JTAliPay'
  s.license      = "MIT"
  s.authors      = { "kk" => "jtcloud@163.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source = { :git => 'https://github.com/JTCloudPlugin/JTAliPay.git', :tag => s.version.to_s }
  s.source_files = 'Source/*.{h,m}'
  #s.public_header_files = 
  s.requires_arc = true
  s.frameworks = 'SystemConfiguration','CoreTelephony','QuartzCore','CoreText','CoreGraphics','UIKit','Foundation','CFNetwork','CoreMotion'
  s.libraries = 'c++','z'
  s.vendored_frameworks = "Source/SDK/AlipaySDK.framework"
  s.resources = "Source/SDK/AlipaySDK.bundle"
end


