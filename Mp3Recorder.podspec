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
s.subspec 'MXMp3Recorder' do |mx|
    mx.source_files = 'MXMp3Recorder/*.{h,m}'
    mx.vendored_frameworks = 'MXMp3Recorder/lame.framework'
end
s.subspec 'BBVoiceRecord' do |bb|
	bb.source_files = 'BBVoiceRecord/*.{h,m}'
end
s.resource_bundles = {
	'Mp3Recorder' => ['BBVoiceRecord/resources/*.png']
}
s.requires_arc = true
s.dependency 'Masonry'
end
