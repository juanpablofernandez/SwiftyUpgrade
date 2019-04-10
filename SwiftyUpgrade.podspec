Pod::Spec.new do |s|

  s.name                  = "SwiftyUpgrade"
  s.version               = "1.0.2"
  s.summary               = "iOS framework that allows devs to quickly display an upgrade/IAP screen"
  s.description           = <<-DESC
SwiftyUpgrade displays a pre-made highly editable ViewController from which the user is able to upgrade to PRO.
                            DESC
  s.homepage              = "https://github.com/juanpablofernandez/SwiftyUpgrade"
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = "Juan Pablo Fernandez"
  s.social_media_url      = "https://github.com/juanpablofernandez"
  s.swift_version         = "5.0" 
  s.ios.deployment_target = '11.2'
  s.source                = { :git => "https://github.com/juanpablofernandez/SwiftyUpgrade.git", :tag => "#{s.version}" }
  s.source_files          = "SwiftyUpgrade", "SwiftyUpgrade/**/*.{swift}"

end