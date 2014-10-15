module Wisper
  describe Visualize do
    it '.report return Report class' do
      expect(Visualize.report).to be_an_instance_of(Visualize::Report)
    end
  end
end
