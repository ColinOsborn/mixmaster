FactoryGirl.define do
  factory :artist do
    name
    image_path "http://bravewords.com/medias-static/images/news/2016/56AFA0D3-cult-of-luna-to-release-mariner-album-in-april-teaser-video-streaming-image.jpg"
  end

  sequence :name do |n|
      "#{n} Artist"
    end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end
end
