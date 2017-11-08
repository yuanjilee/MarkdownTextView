Pod::Spec.new do |s|
  s.name             = "MarkdownTextView"
  s.version          = "3.0.0"
  s.summary          = "Rich Markdown editing control for iOS"
  s.homepage         = "https://github.com/oakstudios/MarkdownTextView"
  s.screenshots      = "https://github.com/oakstudios/MarkdownTextView/blob/master/screenshot.png"
  s.license          = 'MIT'
  s.author           = { "indragiek" => "i@indragie.com", "Alex Givens" => "mail@alexgivens.com"}
  s.source           = { :git => "https://github.com/oakstudios/MarkdownTextView.git", :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.requires_arc     = true
  s.source_files     = 'MarkdownTextView/**/*'
end
