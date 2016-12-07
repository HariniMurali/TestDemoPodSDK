#
# Be sure to run `pod lib lint TestDemoPodSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TestDemoPodSDK'
  s.version          = '0.1.0'
  s.summary          = 'A test cocoa named TestDemoPodSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a demo for testing purpose.
                       DESC

  s.homepage         = 'https://github.com/HariniMurali/TestDemoPodSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Carey Sam' => 'jcareysam@gmail.com' }
  s.source           = { :git => 'https://github.com/HariniMurali/TestDemoPodSDK.git', :commit => '0b09ab5bb93c5905858d0958299737dc048eb099', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TestDemoPodSDK/Classes/**/*'
	
   s.resource_bundles = {
     'TestDemoPodSDK' => ['TestDemoPodSDK/Assets/*.{xib,storyboard}']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'FMDB'
end
