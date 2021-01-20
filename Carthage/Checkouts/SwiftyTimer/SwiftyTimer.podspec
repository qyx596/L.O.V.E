Pod::Spec.new do |s|
  s.name = 'SwiftyTimer'
  s.version = '2.1.0'
  s.license = 'MIT'
  s.summary = 'Swifty API for NSTimer'
  s.homepage = 'https://github.com/radex/SwiftyTimer'
  s.authors = { 'Radek Pietruszewski' => 'this.is@radex.io' }
  s.source = { git: 'https://github.com/radex/SwiftyTimer.git', tag: s.version }
  s.swift_version = '4.2'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Sources/*.swift'
end
