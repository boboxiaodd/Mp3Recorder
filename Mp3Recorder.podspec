Pod::Spec.new do |s|

s.name         = "Mp3Recorder"
s.version      = "0.0.2"
s.summary      = "BBVoiceRecord + MXMp3Recorder for ios."
s.description  = <<-DESC
        			BBVoiceRecord + MXMp3Recorder
                DESC
s.homepage     = "https://github.com/boboxiaodd/Mp3Recorder"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "linhaibo" => "iam386@gmail.com" }
s.platform     = :ios, "11.0"
s.source       = { :git => "https://github.com/boboxiaodd/Mp3Recorder.git", :tag => s.version }
s.source_files = "FaceUnity/*.{h,m,mm}"
s.subspec 'FUAPIDemoBar' do |bar|
    bar.source_files = 'FaceUnity/FUAPIDemoBar/*.{h,m,mm}','FaceUnity/FUAPIDemoBar/modle/*.{h,m,mm}'
end
s.resources = 'FaceUnity/FUAPIDemoBar/*.{lproj,xcassets}'
s.framework = 'VideoToolbox'
s.dependency 'Masonry'
s.dependency 'Nama-lite'
s.dependency 'ZegoExpressEngine/Video'
s.requires_arc = true
# s.xcconfig = {
#    'ENABLE_BITCODE' => 'NO'
# }

end
