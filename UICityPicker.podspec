Pod::Spec.new do |s|

  s.name         = "UICityPicker"
  s.version      = "1.0.0"
  s.summary      = "UIPicker for city"

  s.description  = "A simple city selector 一个简单的城市选择器"

  s.homepage     = "https://github.com/Dcell/UICityPicker.git"

  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             =  "dingqili"

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/Dcell/UICityPicker.git", :tag => "#{s.version}" }


  s.source_files  = "Classes", "UICityPicker/**/*.{h,m,swift}"

  s.resources = "UICityPicker/**/*.{plist}"


end
