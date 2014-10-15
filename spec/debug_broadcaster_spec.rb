module Wisper::Visualize
  describe DebugBroadcaster do

    subject(:broadcaster) { DebugBroadcaster.new }

    let(:publisher) { Object.new }
    let(:event)     { 'foobar' }
    let(:args)      { [1,2,3] }

    it 'proxies raw event on to given subscriber' do
      subscriber = double('subscriber')

      expect(subscriber).to receive(:event_broadcast).with(subscriber, publisher, event, args)

      broadcaster.broadcast(subscriber, publisher, event, args)
    end
  end
end
