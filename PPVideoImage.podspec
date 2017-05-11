#
#  Be sure to run `pod spec lint PPVideoImage.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "PPVideoImage"
  s.version      = "0.1.0"
  s.summary      = "this is PPVideoImage"

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
 
  s.description  = "PPVideoImage 快速设置视频的预览图"

  s.homepage     = "https://github.com/JungHsu/PPVideoImage"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }



  s.author  = { "JungHsu" => "1021057927@qq.com" }
  


  s.source       = { :git => "https://github.com/JungHsu/PPVideoImage.git", :tag => "#{s.version}" }



  s.source_files  = "PPVideoImage/**/*.{h,m}"
  

  # s.public_header_files = "Classes/**/*.h"



  # s.frameworks = "UIKit","CommonCrypto", "AVFoundation"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"



  s.requires_arc = true



end
