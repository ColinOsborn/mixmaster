require 'rails_helper'

RSpec.feature "user views all artists spec" do
  scenario "viewing a link to individual artists page" do
    artist_name = "Cult of Luna"
    artist_image = "http://totallystockholm.se/wp-content/uploads/2014/04/cult-of-luna.jpg"

    Artist.create(name: artist_name, image_path: artist_image)

    visit artists_path
    expect(page).to have_content artist_name
    click_on artist_name
    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image}\"]")
  end
end
