# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
inhibit_all_warnings!

def rxswift_pods
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
end



target 'ElvesTask' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ElvesTask

  rxswift_pods
  pod 'SwiftMessages','6.0.1'
  pod 'Alamofire','4.7.3'
  pod 'AlamofireNetworkActivityIndicator'
  pod 'AlamofireImage','3.4.1'
  pod 'NVActivityIndicatorView'
  pod 'FacebookCore','0.5.0'
  pod 'FacebookLogin','0.5.0'
  pod 'KeychainSwift','13.0.0'
  pod 'PKHUD', '~> 5.0'

  target 'ElvesTaskTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick','1.3.2'
    pod 'Nimble','7.3.1'
  end

  target 'ElvesTaskUITests' do
    inherit! :search_paths
    # Pods for testing

  end

end
