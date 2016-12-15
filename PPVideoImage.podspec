Pod::Spec.new do |s|
s.name = 'PPVideoImage'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = '快速设置视频预览图到你的imaegView'
s.homepage = 'https://github.com/JungHsu/PPVideoImage'
s.authors = { 'JungHsu' => '1021057927@qq.com' }
s.source = { :git => "https://github.com/JungHsu/PPVideoImage.git", :tag => "1.0.0"}
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = "PPVideoImage", "*.{h,m}"
end