require 'wisper'
require 'wisper/visualize/version'
require 'wisper/visualize/debug_broadcaster'

require 'wisper/visualize/debugger'
require 'wisper/visualize/report'

module Wisper
  module Visualize
    def self.report
      Report.new
    end
  end
end
