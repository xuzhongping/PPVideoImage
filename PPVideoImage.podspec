
Pod::Spec.new do |s|

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
  s.requires_arc = true

end
