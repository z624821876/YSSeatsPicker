
Pod::Spec.new do |s|
  s.name             = 'YSSeatsPicker'
  s.version          = '1.0.2'
  s.summary          = '仿猫眼电影选座 实现基础选座功能、情侣座、落单判断等功能'

  s.homepage         = 'https://github.com/z624821876/YSSeatsPicker.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yu' => 'yu624821876@163.com' }
  s.source           = { :git => 'https://github.com/z624821876/YSSeatsPicker.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'YSSeatsPicker/Classes/**/*.{h,m}'
  s.resource = 'YSSeatsPicker/Assets/*.bundle'

  # s.resource_bundles = {
  #   'YSSeatsPicker' => ['YSSeatsPicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
