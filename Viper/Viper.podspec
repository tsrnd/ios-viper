Pod::Spec.new do |spec|
    spec.name         = 'Viper'
    spec.version      = '1.0.0'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/tsrnd/ios-viper'
    spec.authors      = { 'Dao Nguyen' => 'zendobk@gmail.com' }
    spec.summary      = 'Viper framework for iOS app.'
    spec.source       = { :git => 'https://github.com/tsrnd/ios-viper.git', :tag => spec.version }
    spec.source_files = 'Sources/**/*.swift'
    spec.swift_versions = ['5.0']
    spec.ios.deployment_target = '13.0'
    spec.dependency 'RxSwift', '~> 5.0.0'
end
