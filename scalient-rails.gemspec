# frozen_string_literal: true
#
# Copyright 2013-2015 Scalient LLC
# All rights reserved.

require "pathname"

$LOAD_PATH.push(Pathname.new("../lib").expand_path(__FILE__).to_s)

require "scalient/rails/version"

Gem::Specification.new do |s|
  s.name = "scalient-rails"
  s.version = Scalient::Rails::Version.to_s
  s.platform = Gem::Platform::RUBY
  s.authors = ["Roy Liu"]
  s.email = ["roy@scalient.net"]
  s.homepage = "https://github.com/scalient/scalient-rails"
  s.summary = "scalient-rails is a collection Ruby on Rails constructs specifically targeted for Scalient apps"
  s.description = "scalient-rails is a collection Ruby on Rails constructs specifically targeted for Scalient apps." \
    " With it, our aim is to deduplicate code and encourage use of a core set of tools."
  s.add_runtime_dependency "bootstrap-sass", [">= 3.3.5"]
  s.add_runtime_dependency "devise", [">= 3.4.1"]
  s.add_runtime_dependency "rails", [">= 4.2.0"]
  s.files = (Pathname.glob("{app,config,lib,vendor}/**/*.rb") \
    + Pathname.glob("lib/tasks/**/*.rake") \
    + Pathname.glob("bin/*") \
  ).map { |f| f.to_s }
  s.test_files = Pathname.glob("{features,spec}/*").map { |f| f.to_s }
  s.executables = Pathname.glob("bin/*").map { |f| f.basename.to_s }
  s.require_paths = ["lib"]
end
