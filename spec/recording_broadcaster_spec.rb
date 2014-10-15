module Wisper::Visualize
  describe RecordingBroadcaster do

    subject(:broadcaster) { RecordingBroadcaster.new(another_broadcaster) }

    let(:another_broadcaster) { double.as_null_object }

    let(:publisher)  { double }
    let(:subscriber) { double }
    let(:event)      { 'foobar' }
    let(:args)       { [1,2,3] }

    before { allow(subscriber).to receive(:foobar) }

    it 'delegates broadcasting on to given broadcaster' do
      expect(another_broadcaster).to receive(:broadcast).with(subscriber, publisher, event, args)
      broadcaster.broadcast(subscriber, publisher, event, args)
    end

    it 'stores all events' do
      expect { broadcaster.broadcast(subscriber, publisher, event, args) }.to change { broadcaster.events.size }.from(0).to(1)
    end
  end
end
