# frozen_string_literal: true

require_relative "lib/wineskills/version"

Gem::Specification.new do |spec|
  spec.name = "wineskills"
  spec.version = Wineskills::VERSION
  spec.authors = ["Pierre FILSTROFF"]
  spec.email = ["pierre.filstroff@gmail.com"]

  spec.summary = "Wineskills: all the best wines"
  spec.description = "Wineskills: all the best wines"
  spec.homepage = "https://wineskills.fiwares.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wineskills/ruby-client"
  spec.metadata["changelog_uri"] = "https://github.com/wineskills/ruby-client/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "gruf", "~> 2.20"
  spec.add_dependency "thor"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
