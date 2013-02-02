require File.expand_path('../lib/omniauth-cx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Schuyler Ullman"]
  gem.email         = ["schuyler.ullman@gmail.com"]
  gem.description   = %q{Unofficial OmniAuth strategy for CX.}
  gem.summary       = %q{Unofficial OmniAuth strategy for CX.}
  gem.homepage      = "https://github.com/sullman/omniauth-cx"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-cx"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::CX::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end