module Wisper
  module Visualize
    describe Report do
      let(:path) { '/tmp/visualization.pdf' }

      let(:publisher_class) { Class.new { include Wisper::Publisher; public :broadcast } }

      before do
        File.delete(path) if File.exist?(path)
        allow(publisher_class).to receive(:name).and_return('MyPublisher')
      end

      subject!(:report) { Report.new }

      it '.to_pdf creates a file' do
        publishers = 20.times.map { publisher_class.new }
        subscribers = 20.times.map { double.as_null_object }
        events = %w(user_created order_canceled order_created login_failed)

        40.times do
          p = publishers.sample
          s = subscribers.sample
          p.subscribe(s)
          p.broadcast(events.sample)
        end

        report.to_pdf(path)

        expect(File.exist?(path)).to be_truthy
      end

      it '.events returns de-duplicated events' do
        publisher = publisher_class.new
        listener  = double

        allow(listener).to receive(:foobar)
        publisher.subscribe(listener)

        expect { 10.times { publisher.broadcast(:foobar) } }.to change { report.events.size }.from(0).to(1)
      end
    end
  end
end
