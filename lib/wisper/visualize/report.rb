module Wisper
  module Visualize
    class Report

      def initialize
        @debugger = Debugger.new
        @debugger.start
      end

      def events
        @debugger.events
      end

      def to_pdf(path)

      end
    end
  end
end
