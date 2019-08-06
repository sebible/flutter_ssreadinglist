#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_ssreadinglist'
  s.version          = '0.0.1'
  s.summary          = 'IOS SSReadingList API for flutter'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://www.github.com/sebible/flutter_ssreadinglist'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'yufeiwu' => 'yufeiwu@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end

