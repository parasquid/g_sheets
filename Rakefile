require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Open a pry session preloaded with this library"
task :console do
  system "pry --gem"
end