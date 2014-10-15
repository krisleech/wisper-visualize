require 'wisper'
require 'graphviz'

require 'wisper/visualize/recording_broadcaster'
require 'wisper/visualize/report'
require 'wisper/visualize/version'

module Wisper
  module Visualize
    def self.report
      Report.new
    end
  end
end
