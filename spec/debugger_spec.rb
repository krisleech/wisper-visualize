module Wisper::Visualize
  describe Debugger do

    subject(:debugger) { Debugger.new }

    let(:subscriber) { Object.new }
    let(:publisher)  { Object.new }
    let(:event)      { 'foobar' }
    let(:args)       { [1,2,3] }

    it '.on_event_broadcast records the given event' do
      debugger.event_broadcast(subscriber, publisher, event, args)
      expect(debugger.events.size).to eq 1
    end

    describe '.start' do
      it 'self subscribes globally' do
        debugger.start
        expect(Wisper::GlobalListeners.listeners).to include debugger
      end
    end
  end
end
