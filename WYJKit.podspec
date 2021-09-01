
Pod::Spec.new do |s|
  s.name             = 'WYJKit'
  s.version          = '1.5.3'
  s.summary          = 'WYJKit'
  s.description      = <<-DESC
                            add nav
                       DESC

  s.homepage         = 'https://github.com/MemoryKing/WYJKit.git'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.license          = 'MIT'
  s.author           = { '╰莪呮想好好宠Nǐつ ' => '1091676312@qq.com' }
  s.source           = { :git => 'https://github.com/MemoryKing/WYJKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.frameworks = 'UIKit','Foundation'

s.public_header_files   = 'WYJKit/Header/**/*.{h}'
s.source_files = 'WYJKit/Header/**/*.{h,m}'

s.dependency 'Masonry'
s.dependency 'IQKeyboardManager'

s.subspec 'WYJCategory' do |c|
c.public_header_files   = 'WYJKit/WYJCategory/**/**/*.{h}'
c.source_files   = 'WYJKit/WYJCategory/**/**/*.{h,m}'
end

s.subspec 'WBaseEmpty' do |e|
e.public_header_files   = 'WYJKit/WBaseEmpty/**/**/*.{h}'
e.source_files          = 'WYJKit/WBaseEmpty/**/**/*.{h,m}'

e.dependency 'DZNEmptyDataSet'
e.dependency 'MJRefresh'
end

s.subspec 'Utility' do |u|
u.public_header_files   = 'WYJKit/Utility/**/**/*.{h}'
u.source_files          = 'WYJKit/Utility/**/**/*.{h,m}'
end

s.requires_arc = true
end

