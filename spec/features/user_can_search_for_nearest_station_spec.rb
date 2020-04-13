require 'rails_helper'

RSpec.describe "Fuel Station Search" do
  it 'can display nearest station with directions' do
    visit '/'

    select 'Turing'

    click_on "Find Nearest Station"

    expect(current_path).to eq('/search')

    within '#station' do
      expect(first('#name').text).to_not be_empty
      expect(first('#address').text).to_not be_empty
      expect(first('#type').text).to_not be_empty
      expect(first('#access-times').text).to_not be_empty

      expect(first('#distance').text).to_not be_empty
      expect(first('#travel-time').text).to_not be_empty
      expect(first('#directions').text).to_not be_empty
    end
  end
end
