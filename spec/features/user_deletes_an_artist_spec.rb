require 'rails_helper'

RSpec.feature "user deletes an artist" do
  scenario "user decides to delete specific artist" do
    delete_artist = "Neurosis"
    delete_artist_image = "http://www.metal-archives.com/images/6/0/60_photo.jpg?0101"
    Artist.create(name: "Isis", image_path: "http://www.clashmusic.com/sites/default/files/styles/article_feature/public/field/image/panopticon.jpg?itok=vtUeKITm")
    Artist.create(name: delete_artist, image_path: delete_artist_image)

    visit artists_path

    click_on delete_artist
    expect(page).to have_content("Neurosis")
    expect(page).to have_css("img[src=\"#{delete_artist_image}\"]")
    expect(page).to have_content("All Artists")

    click_on "Delete Artist"
    expect(current_path).to eq("/artists")
    expect(page).to have_no_content(delete_artist)
  end
end
