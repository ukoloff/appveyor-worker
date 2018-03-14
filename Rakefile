require "bundler/gem_tasks"

desc 'Run tests'
task test: %i(minitest rspec) do
end

desc "Run Minitest"
task :minitest do
  require "minitest/autorun"

  Dir.glob('./test/*.rb'){|f| require f}
end

desc "Run RSpec"
task :rspec do
  system "rspec"
end

task default: :test
