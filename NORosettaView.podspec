Pod::Spec.new do |spec|
  spec.name         = "NORosettaView"
  spec.version      = "0.1.0"
  spec.summary      = "Circle arc based control with selected number of leafs (pizza style)."
  spec.homepage     = "https://github.com/natalia-osa/"
  spec.license      = 'Apache 2.0'
  spec.author       = { "natalia.osiecka" => "osiecka.n@gmail.com" }
  spec.source       = { :git => 'https://github.com/natalia-osa/NORosettaView.git', :tag => '0.1.0'}

  spec.requires_arc = true
  spec.ios.deployment_target = '6.0'
  spec.source_files = 'NORosettaView/RosettaView/*.{h,m}'

  spec.frameworks   = ['Foundation', 'UIKit', 'CoreGraphics', 'QuartzCore']
end
