require 'rails_helper'

RSpec.feature "user submits a new artist" do
  scenario " they see the page for the individual artist" do

    artist_name  = "Cult of Luna"
    artist_image_path = "http://totallystockholm.se/wp-content/uploads/2014/04/cult-of-luna.jpg"

    visit artists_path
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

  context "the submitted data is invalid" do
    scenario "they see an error message" do
      artist_image_path = "http://totallystockholm.se/wp-content/uploads/2014/04/cult-of-luna.jpg"

      visit artists_path
      click_on "New Artist"
      fill_in "artist_image_path", with: artist_image_path
      click_on "Create Artist"

    end
  end
end
