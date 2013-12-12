# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crc32_cracker/version'

Gem::Specification.new do |spec|
  spec.name          = "crc32_cracker"
  spec.version       = Crc32Cracker::VERSION
  spec.authors       = ["Ben Greenberg"]
  spec.email         = ["bsgreenb@gmail.com"]
  spec.description   = %q{Cracker for CRC32 proof of work checks}
  spec.summary       = %q{Cracker for CRC32 proof of work checks. This cracks the CRC32 javascript proof of work used to prevent scraping described here: http://jamespicuk.wordpress.com/2013/03/01/you-wouldnt-make-your-website-slower-on-purpose-would-you/}
  spec.homepage      = "https://github.com/bsgreenb/crc32_cracker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
