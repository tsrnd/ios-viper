platform :ios, '13.0'

workspace 'Viper'

target 'Viper' do
  project 'Viper/Viper.xcodeproj'
end

target 'ViperApp' do
  project 'ViperApp/ViperApp.xcodeproj'
  pod 'Viper', :path => './Viper/Viper.podspec'
  pod 'RxSwift', '~> 5.0.0'
  pod 'Alamofire', '~> 5.0.0-rc.2'
end
