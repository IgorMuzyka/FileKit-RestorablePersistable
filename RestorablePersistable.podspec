
Pod::Spec.new do |s|

  s.name = 'FileKit-RestorablePersistable'
  s.version = '1.0.0'
  s.swift_version = '4.2'
  s.summary = 'Missing extra conveniences of FileKit'
  s.homepage = 'https://github.com/igormuzyka/FileKit-RestorablePersistable'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'igormuzyka' => 'igormuzyka42@gmail.com' }
  s.source = { :git => 'https://github.com/igormuzyka/FileKit-RestorablePersistable.git', :tag => s.version.to_s }
  s.source_files = 'Sources/*'

  s.osx.deployment_target = "10.11"
  s.ios.deployment_target  = "9.0"
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'

  s.dependency 'FileKit'

end
