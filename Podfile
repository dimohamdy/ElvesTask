# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rxswift_pods
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
end



target 'ElvesTask' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ElvesTask

  pod 'ALCameraViewController'
  rxswift_pods
  pod 'NVActivityIndicatorView'
  pod 'AlamofireImage'
  pod 'SimpleImageViewer', '~> 1.1.1'
  pod 'SwiftMessages'
  pod 'AlamofireNetworkActivityIndicator'
  pod 'FBSDKLoginKit', '4.35'

  target 'ElvesTaskTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ElvesTaskUITests' do
    inherit! :search_paths
    # Pods for testing
  pod 'Quick'
  pod 'Nimble'
  end

end
