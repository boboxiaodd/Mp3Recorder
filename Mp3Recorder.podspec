Pod::Spec.new do |s|

s.name         = "Mp3Recorder"
s.version      = "0.0.1"
s.summary      = "BBVoiceRecord + MXMp3Recorder for ios."
s.description  = <<-DESC
        			BBVoiceRecord + MXMp3Recorder
                DESC
s.homepage     = "https://github.com/boboxiaodd/Mp3Recorder"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author       = { "linhaibo" => "iam386@gmail.com" }
s.platform     = :ios, "11.0"
s.source       = { :git => "https://github.com/boboxiaodd/Mp3Recorder.git", :tag => s.version }
s.source_files = 'MXMp3Recorder/*.{h,m}','BBVoiceRecord/*.{h,m}'
s.vendored_frameworks = 'MXMp3Recorder/lame.framework'
s.requires_arc = true
s.dependency 'Masonry'
end
