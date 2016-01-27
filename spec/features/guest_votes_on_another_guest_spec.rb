# require "rails_helper"
#
# feature "voting" do
#   scenario "guest votes on another guest", focus: true do
#     event = FactoryGirl.create(:event)
#
#     visit event_path(event)
#     select "Snap", from: "Event type"
#     fill_in "Comment", with: "Excellent Guest"
#     click_button "Submit"
#
#     expect(page).to have_content "Snap performed!"
#   end
# end
