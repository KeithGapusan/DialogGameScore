#
#  Be sure to run `pod spec lint DialogGameScore.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


    s.name         = "DialogGameScore"
    s.version      = "0.0.2"

    s.summary      = "A reusable popup dialog for two player games."
    s.description  = "A reusable popup dialog for two player games. This framework mainly used for my internal projects."
    s.homepage     = "https://github.com/KeithGapusan/DialogGameScore"
    s.license      = "MIT"
    s.author             = { "Keith Randell Gapusan" => "krsgapusan@gmail.com" }
    s.social_media_url   = "https://www.instagram.com/keithgapusan/"


    s.platform     = :ios, "9.0"
    s.source       = { :git => "https://github.com/KeithGapusan/DialogGameScore.git", :tag => "#{s.version}" }
    s.source_files  = "DialogGameScore/**/*.{h,m,swift,storyboard,xib.json}"
    s.resource_bundles = {
        'DialogGameScore' => ['DialogGameScore/**/*.{storyboard,xib,xcassets,json,imageset,png,swift}']
    }
    s.pod_target_xcconfig = { "SWIFT_VERSION" => "3.2" }

#s.source_files  = "iOSCommonUI/**/*.{h,m}"

end
