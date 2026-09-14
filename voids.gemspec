# frozen_string_literal: true

require_relative 'lib/voids/version'

Gem::Specification.new do |spec|
  spec.name = 'voids'
  spec.version = Voids::VERSION
  spec.authors = ['Josh Brody', 'Michael J. Giarlo']
  spec.email = ['gems@josh.mn', 'mjgiarlo@stanford.edu']

  spec.summary = 'Ruby form objects that make sense'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/sul-dlss/voids'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.4.0', '< 5'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == File.basename(__FILE__)) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .github/])
    end
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'activemodel', '>= 6.0'
  spec.add_dependency 'activesupport', '>= 6.0'
  spec.add_dependency 'zeitwerk'
end
