require 'rails_helper'

RSpec.describe("Events index page", type: :feature) do
  before(:each) do
    visit events_path
  end
    
  context "Paging" do
    # Sunny day
    it "displays 7 events on the screen" do
      expect(page).to(have_selector(".center.text-tile.list-tile.input-label", maximum: 7))
    end
  
    # Rainy day
    it "displays an error message if more than 7 events are present" do
      expect(page).to(have_selector(".center.text-tile.list-tile.input-label", maximum: 7))

      if page.all(".center.text-tile.list-tile.input-label").count > 7
        expect(page).to(have_selector(".error-message"))
      end
    end
  end

  context 'Sorting' do
    it 'Sunny Day - Sort by Created At (ASC)' do
      click_link 'Created At (ASC)'
      expect(page).to(have_current_path(events_path(sort_by: 'created_at_asc')))
    end

    it 'Sunny Day - Sort by Created At (DESC)' do
      click_link 'Created At (DESC)'
      expect(page).to(have_current_path(events_path(sort_by: 'created_at_desc')))
    end

    it 'Sunny Day - Sort by Date (ASC)' do
      click_link 'Date (ASC)'
      expect(page).to(have_current_path(events_path(sort_by: 'date_asc')))
    end

    it 'Sunny Day - Sort by Date (DESC)' do
      click_link 'Date (DESC)'
      expect(page).to(have_current_path(events_path(sort_by: 'date_desc')))
    end

    it 'Sunny Day - Sort by Event Name (ASC)' do
      click_link 'Event Name (ASC)'
      expect(page).to(have_current_path(events_path(sort_by: 'event_name_asc')))
    end

    it 'Sunny Day - Sort by Event Name (DESC)' do
      click_link 'Event Name (DESC)'
      expect(page).to(have_current_path(events_path(sort_by: 'event_name_desc')))
    end
  end
end
