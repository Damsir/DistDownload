
Pod::Spec.new do |s|

  s.name         = "DistDownload"
  s.version      = "1.0.0"
  s.summary      = "文件下载：断点下载，支持后台下载，再次打开程序、异常退出记录下载进度"
  s.author       = { "Damrin" => "75081647@qq.com" }
  s.homepage    = 'https://github.com/Damsir/DistDownload'
  s.source      = { :git => 'https://github.com/Damsir/DistDownload.git', :tag => s.version }
  s.license = "MIT"
  s.platform = :ios, "8.0"
  s.requires_arc = true
  s.source_files = "DistDownload", "DistDownload/**/*.{h,m}"
  # s.public_header_files = "DistPopView/*.h"
  s.resources = 'DistDownload/Resource/*.{bundle}'
  s.framework = 'UIKit'
  s.ios.deployment_target = "8.0"
  s.dependency "ASIHTTPRequest" , '~> 1.8.2'

end