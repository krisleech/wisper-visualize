module Wisper
  module Visualize
    class Report

      def initialize
        Wisper.configure do |config|
          config.broadcaster :default, RecordingBroadcaster.new(config.broadcasters[:default])
        end
      end

      def events
        Wisper.configuration.broadcasters[:default].flattened_events
      end

      def to_pdf(path)
        graph.output(pdf: path)
      end

      def to_png(path)
        graph.output(png: path)
      end

      private

      def graph
        GraphViz.new(:G, type: :digraph).tap do |g|
          events.each do |event|
            sub_node = g.add_nodes(event.subscriber_name)
            pub_node = g.add_nodes(event.publisher_name)

            sub_node.shape = 'rect'
            sub_node.color = 'steelblue'

            pub_node.shape = 'rect'
            pub_node.color = 'royalblue'

            edge = g.add_edges(pub_node, sub_node, color: 'red')
            edge[:label] = "#{event.frequency_label}#{event.name}"
            # edge[:label] = "#{event.frequency_label}#{event.name}(#{event.arg_names})"
          end
        end
      end
    end
  end
end
