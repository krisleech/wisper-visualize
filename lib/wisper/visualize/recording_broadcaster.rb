module Wisper
  module Visualize
    class RecordingBroadcaster
      def initialize(broadcaster)
        @events      = []
        @broadcaster = broadcaster
      end

      def broadcast(subscriber, publisher, event, args)
        @broadcaster.broadcast(subscriber, publisher, event, args)
        @events.push(Event.new(subscriber, publisher, event, args))
      end

      def events
        @events.dup
      end

      # de-duplicates events and increments frequency for each duplicate
      # FIXME: ugly...
      def flattened_events
        _result = []
        _events = events

        while event = _events.pop do
          match = _events.find { |e| e == event }
          if match.nil?
            _result << event
          else
            match.increment_frequency
          end
        end

        _result
      end

      class Event
        attr_reader :subscriber_name, :publisher_name, :name, :arg_names,
                    :frequency, :created_at

        def initialize(subscriber, publisher, name, args)
          @subscriber_name = label(subscriber)
          @publisher_name  = label(publisher)
          @name            = name
          @arg_names       = arg_labels(args)
          @frequency       = 1
          @created_at      = Time.now
        end

        def frequency_label
          frequency == 1 ? '' : "#{frequency}x "
        end

        def increment_frequency
          @frequency += 1
        end

        def ==(other)
          name == other.name &&
          # arg_names == other.arg_names &&
          subscriber_name == other.subscriber_name &&
          publisher_name == other.publisher_name
        end

        private

        def label(object)
          id_method  = %w(id uuid key object_id).find { |id_method| object.respond_to?(id_method) }
          id         = object.send(id_method)
          class_name = object.class == Class ? object.name : object.class.name
          "#{class_name}##{id}"
        end

        def arg_labels(args)
          return 'no arguments' if args.empty?
          args.map { |arg| label(arg) }.join(', ')
        end
      end
    end
  end
end
