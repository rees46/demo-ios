platform :ios, '12.0'

target 'demo-store-ios' do
  use_frameworks!

  pod 'REES46', :git => 'https://github.com/rees46/ios-sdk.git', :branch => 'master', :tag => '3.6.19'
#  pod 'Swinject', '~> 2.8'

  target 'demo-store-iosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'demo-store-iosUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
