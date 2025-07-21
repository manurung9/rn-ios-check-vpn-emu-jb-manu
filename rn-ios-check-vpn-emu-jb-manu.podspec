require "json"
package = JSON.parse(File.read(File.join(__dir__, "..", "package.json")))

Pod::Spec.new do |s|
  s.name         = "rn-ios-check-vpn-emu-jb-manu"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["repository"]["url"]
  s.license      = package["license"]
  s.author       = { "Irwansyah Putra Manurung" => "manurung@pnmdigi.co.id" }
  s.source       = { :git => package["repository"]["url"], :tag => s.version.to_s }
  s.platform     = :ios, "12.0"
  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true
end
