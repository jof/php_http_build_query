# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name = "php_http_build_query"
  gem.version = 0.1
  gem.summary = "A Ruby implementation of PHP's http_build_query()"
  gem.description = "The PHP language has a built-in http_build_query() function that creates a URL-encoded string that is a representation of multi-dimensional datatypes. This gem provides a mostly-congruent method in Ruby for dealing with PHP-based HTTP applications that expect parameters in this format."
  gem.license = "BSD 3-clause"
  gem.authors = ["Jonathan Lassoff <jof@thejof.com>"]
  gem.email = "jof@thejof.com"
  gem.homepage = "http://github.com/jof/php_http_build_query"
  
  gem.files = ['lib/php_http_build_query.rb']
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec'
end
