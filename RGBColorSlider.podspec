#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "RGBColorSlider"
  s.version          = "0.1.0"
  s.summary          = "A simple way to add dynamic, RGB color sliders to an iOS application."
  s.description      = <<-DESC
                       An optional longer description of RGBColorSlider

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/eappel/RGBColorSlider"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Eric Appel" => "ema77@cornell.edu" }
  s.source           = { 
    :git => "https://github.com/eappel/RGBColorSlider.git", 
    :tag => s.version.to_s 
  }
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  # s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
