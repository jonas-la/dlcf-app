require 'rails_helper'

RSpec.describe "Events index page", type: :feature do
    before do
      visit events_path
    end
    
    context "Paging" do
        # Sunny day
        it "displays 7 events on the screen" do
          expect(page).to have_selector(".center.text-tile.list-tile.input-label", maximum: 7)
        end
    
        # Rainy day
        it "displays an error message if more than 7 events are present" do
          expect(page).to have_selector(".center.text-tile.list-tile.input-label", maximum: 7)

          if page.all(".center.text-tile.list-tile.input-label").count > 7
            expect(page).to have_selector(".error-message")
          end
        end
    end

    # context "Sorting" do
    #     it "sorts events by ascending name" do
    #       # Click the "Sort by ascending name" button.
    #       click_link 'Event Name (ASC)'
    
    #       # Assuming each event is represented by a specific HTML element with a name.
    #       event_names = page.all(".center.text-tile.list-tile.input-label.event-name").map(&:text)
    
    #       # Check that the first event's name is alphabetically "lower" than the second event's name.
    #       expect(event_names[0]).to be < event_names[1]
    #     end
    # end
end