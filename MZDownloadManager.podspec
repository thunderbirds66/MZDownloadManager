
Pod::Spec.new do |s|
  s.name             = "MZDownloadManager"
  s.version          = "3.4.1"
  s.summary          = "NSURLSession based download manager."

  s.description      = <<-DESC
                        Download large files even in background, download multiple files, resume interrupted downloads.
                       DESC

  s.homepage         = "https://github.com/thunderbirds66/MZDownloadManager"
  s.license          = 'BSD'
  s.source           = { :git => "https://github.com/thunderbirds66/MZDownloadManager.git", :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'MZDownloadManager/Classes/**/*'

  s.frameworks = 'UIKit', 'Foundation'
  s.swift_version = '4.0'

end
