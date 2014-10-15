module Wisper
  module Visualize
    class DebugBroadcaster
      def broadcast(subscriber, publisher, event, *args)
        subscriber.public_send(:event_broadcast, subscriber, publisher, event, *args)
      end
    end
  end
end
