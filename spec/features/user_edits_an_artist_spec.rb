require 'rails_helper'

RSpec.feature "user edits an artist" do
  scenario "user edits artist information" do
    artist_name = "Rob Marley"
    artist_image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name, image_path: artist_image)

    visit artists_path

    click_on artist_name
    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image}\"]")

    click_on "Edit Artist"

    fill_in "artist_name", with: "Bob Marley"

    click_on "Update Artist"

    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"#{artist_image}\"]")
  end
end
