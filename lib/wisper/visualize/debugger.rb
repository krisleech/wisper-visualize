module Wisper
  module Visualize
    class Debugger # TODO: rename to EventRecorder
      include Wisper::Publisher

      def initialize
        @events = []
      end

      def self.start
        new.start
      end

      def start
        Wisper.subscribe(self, broadcaster: DebugBroadcaster.new)
        self
      end

      def events
        @events.dup.freeze
      end

      def event_broadcast(subscriber, publisher, event, args)
        @events.push(Event.new(subscriber, publisher, event, args).freeze)
      end

      # all events
      def respond_to?(*)
        true
      end

      class Event
        attr_reader :subscriber_class

        def initialize(subscriber, publisher, event, args)
          @subscriber_class = class_name(subscriber)
        end

        private

        def class_name(object)
          object.class == Class ? object.name : object.class.name
        end
      end

    end
  end
end
