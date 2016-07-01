require 'rails_helper'


RSpec.feature "user creates a playlist" do
  scenario "they see the page for the individual playlist" do
    song_one, song_two, song_three = create_list(:song, 3)

    playlist_name = "Mix List"

    visit playlists_path
    click_on "New Playlist"
    fill_in "playlist_name", with: playlist_name
    check("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Create Playlist"

    expect(page).to have_content playlist_name

    within("li:first") do
      expect(page).to have_link song_one.title, href: song_path(song_one)
    end

    within("li:last") do
      expect(page).to have_link song_three.title, href: song_path(song_three)
    end
  end
end
# as a user
# given that songs and artists exist in the Database
# when I visit the playlists path
# and I click "New Playlist"
# and I fill in a name
# and I select the songs for the playlist
# and I click "Create Playlist"
# Then I see the playlist title
# And I see titles of all songs in that playlist
# And the titles should link to the individual song pages
