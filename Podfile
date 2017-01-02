source 'https://github.com/CocoaPods/Specs'

platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

abstract_target 'GitRepos2Common' do  

  pod 'Swinject', '~> 1.1'
    
  pod 'Alamofire',                    '~> 3.3'
  pod 'ObjectMapper',                 '~> 1.3'
  pod 'AlamofireObjectMapper',        '~> 3.0'
  pod 'Moya/RxSwift',                 '~> 6.5'
  pod 'Moya-ObjectMapper/RxSwift',    '~> 1.2'
  pod 'RxSwift',                      '~> 2.4'
  pod 'RxCocoa',                      '~> 2.4'
  pod 'RxAlamofire',                  '~> 2.2'
  pod 'RxDataSources',                '~> 0.8'
  pod 'NSObject+Rx',                  '~> 1.2'
  pod 'AsyncSwift',                   '~> 1.7'
  pod 'Reusable',                     '~> 2.3'
  pod 'R.swift',                      '~> 2.3'
  
  pod 'Nuke', '~> 3.1'
  
  pod 'SwiftDate', '~> 3.0'
  pod 'SwiftyColor', '~> 0.1'
  pod 'SpringIndicator', '~> 1.2'
  pod 'SnapKit', '~> 0.20'
  pod 'AsyncSwift', '~> 1.7'

  pod 'StatefulViewController', '~> 1.0'

  target 'GitRepos2' do  end

  target 'GitRepos2Tests' do	    
    pod 'Dobby',    '~> 0.5'
    pod 'Quick',    '~> 0.9'
    pod 'Nimble',   '~> 4.0'	  
  end
end



# Copy acknowledgements to the Settings.bundle

post_install do | installer |
  require 'fileutils'

  pods_acknowledgements_path = 'Pods/Target Support Files/Pods/Pods-Acknowledgements.plist'
  settings_bundle_path = Dir.glob("**/*Settings.bundle*").first

  if File.file?(pods_acknowledgements_path)
    puts 'Copying acknowledgements to Settings.bundle'
    FileUtils.cp_r(pods_acknowledgements_path, "#{settings_bundle_path}/Acknowledgements.plist", :remove_destination => true)
  end
end

