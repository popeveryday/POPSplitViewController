Pod::Spec.new do |s|
s.name             = "POPSplitViewController"
s.version          = "0.1.1"
s.summary          = "POPSplitViewController is cutom view controller support real split display for Object-c project."
s.homepage         = "https://github.com/popeveryday/POPSplitViewController"
s.license          = 'MIT'
s.author           = { "popeveryday" => "popeveryday@gmail.com" }
s.source           = { :git => "https://github.com/popeveryday/POPSplitViewController.git", :tag => s.version.to_s }
s.platform     = :ios, '7.1'
s.requires_arc = true
s.source_files = 'Pod/Classes/**/*.{h,m,c}'
s.dependency 'POPLib', '~> 0.1'
end
