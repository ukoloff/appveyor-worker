require 'yaml'
require_relative '../appveyor/worker'

module Minitest
  def self.plugin_appveyor_init options
    ::AppVeyor::Worker.message "#{name} seed: #{options[:seed]}"
    self.reporter << AppVeyor.new unless ::AppVeyor::Worker.skip?
  end

  class AppVeyor < AbstractReporter

    def record result
      ::AppVeyor::Worker.test testFramework: 'Minitest',
        testName: result.name,
        fileName: result.class.name,
        outcome: result.skipped? ? 'Ignored' : result.passed? ? 'Passed' : 'Failed',
        durationMilliseconds: result.time*1000,
        StdOut: YAML.dump('assertions'=>result.assertions),
        ErrorMessage: (result.failure.message rescue nil),
        ErrorStackTrace: (result.failure.backtrace * "\n" rescue nil)
    end

  end
end
