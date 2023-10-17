require 'rails_helper'

RSpec.describe(Application_Controller, type: :controller) do
  describe '#skip_authentication?' do
    it 'returns true when in test mode' do
      allow(OmniAuth.config).to(receive(:test_mode).and_return(true))
      expect(controller.is_skipped?).to(be(true))
    end
  end

  describe '#check_role' do
    # You can write more specific tests for the check_role method
    # Depending on your application logic.
    it 'should test the behavior of check_role method'
  end
end
