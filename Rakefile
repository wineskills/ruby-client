# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

namespace :protos do
  desc "Build GRPC ruby libraries from protos"
  task :build do
    puts "Generating gRPC Ruby files..."

    proto_dir = "protos"
    ruby_out_dir = "lib"

    Dir
      .glob("#{proto_dir}/*.proto")
      .each do |file|
        puts "Generating Ruby files for #{file}..."

        system(
          "grpc_tools_ruby_protoc --ruby_out=#{ruby_out_dir} --grpc_out=#{ruby_out_dir} #{file}",
        )
      end
  end
end

task default: %i[test rubocop]
