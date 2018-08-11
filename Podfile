source 'https://github.com/CocoaPods/Specs.git'

workspace 'Currency.xcworkspace'
platform :ios, '9.0'
use_frameworks!

def shared_pods
	pod 'pop', '~> 1.0'
	pod 'XCGLogger', '~> 4.0.0'
	pod 'MBProgressHUD', '~> 0.9.2'
end

project 'Currency.xcodeproj'

target "Currency" do 
	project 'Currency'
	shared_pods
end