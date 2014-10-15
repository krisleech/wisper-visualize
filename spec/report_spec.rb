module Wisper
  module Visualize
    describe Report do
      let(:path) { '/tmp/visualization.pdf' }

      let(:publisher_class) { Class.new { include Wisper::Publisher; public :broadcast } }

      let(:publisher_1)     { publisher_class.new }
      let(:publisher_2)     { publisher_class.new }
      let(:publisher_3)     { publisher_class.new }

      let(:listener_1)      { double('Listener') }
      let(:listener_2)      { double('Listener') }
      let(:listener_3)      { double('Listener') }

      before do
        File.delete(path) if File.exist?(path)
        allow(publisher_class).to receive(:name).and_return('MyPublisher')
        allow(listener_1).to receive(:foobar)
        allow(listener_2).to receive(:bazbar).with(anything)
        allow(listener_3).to receive(:daxbar).with(anything, anything)
      end

      subject!(:report) { Report.new }

      it '.to_pdf creates a file' do
        publisher_1.subscribe(listener_1)
        publisher_1.subscribe(listener_2)

        publisher_1.broadcast(:foobar)

        10.times { publisher_1.broadcast(:bazbar, 'foo') }

        publisher_2.subscribe(listener_2)
        publisher_2.broadcast(:bazbar, 'bar')

        publisher_3.subscribe(listener_3)
        publisher_3.broadcast(:daxbar, 1, 2)

        report.to_pdf(path)

        expect(File.exist?(path)).to be_truthy
      end

      it '.events returns de-duplicated events' do
        publisher_1.subscribe(listener_1)

        expect do
          10.times { publisher_1.broadcast(:foobar) }
        end.to change { report.events.size }.from(0).to(1)
      end
    end
  end
end
