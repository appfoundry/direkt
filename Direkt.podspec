Pod::Spec.new do |s|
  s.name             = "Direkt"
  s.version          = "1.1.0"
  s.summary          = "Navigation manager to separate navigation logic from your core app code, when not using Storyboard segues."
  s.description      = <<-DESC
This is a Swift port of [DRYNavigationManager](https://github.com/appfoundry/DRYNavigationManager)

Like the original, it is meant for projects which do not rely on Storyboard segues, providing separation of navigation and view controller logic code.

It follows same architectural concept, but leverages Swift programming techniques to provide more type safety and native API feel.
                       DESC
  s.homepage         = "https://github.com/appfoundry/direkt"
  s.license          = 'MIT'
  s.author           = { "Joris Dubois" => "joris.dubois@appfoundry.be", "Jonathan Esposito" => "jonathan.esposito@appfoundry.be", "Jens Goeman" => "jens.goeman@appfoundry.be", "Damian Malarczyk" => "damian.malarczyk@appfoundry.be" }
  s.source           = { :git => "https://github.com/appfoundry/direkt.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/appfoundrybe'

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'Direkt/**/*.swift'
  s.swift_version = '4.1'
end
