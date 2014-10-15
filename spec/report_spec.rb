require 'pry'
module Wisper
  module Visualize

    describe Report do
      let(:path) { '/tmp/visualization.pdf' }

      let(:publisher) { Class.new { include Wisper::Publisher; public :broadcast }.new }

      after { File.delete(path) if File.exists?(path) }
      after { Wisper::GlobalListeners.clear }

      subject!(:report) { Report.new }

      it '.to_pdf creates a file' do

        publisher.broadcast(:foobar)

        report.to_pdf(path)

        expect(File.exists?(path)).to be_true
      end

      it '.events returns all events' do
        expect do
          10.times { publisher.broadcast(:foobar) }
        end.to change { report.events.size }.from(0).to(10)
      end
    end
  end
end
