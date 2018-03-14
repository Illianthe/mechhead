require 'httparty'
require 'htmlentities'
require 'open-uri'

namespace :reddit do
  desc 'Quick and dirty script to fetch top images from the MechanicalKeyboards subreddit and save them'
  task fetch_images: :environment do
    url = 'https://www.reddit.com/r/MechanicalKeyboards/top.json?limit=50'
    options = { headers: { 'User-Agent': 'MechHead' } }
    response = HTTParty.get(url, options)

    if response.code === 200
      parsed_response = JSON.parse(response.body)
      coder = HTMLEntities.new
      submissions = (parsed_response.dig('data', 'children') || []).map do |s|
        {
          id: s.dig('data', 'id'),
          image_url: coder.decode(s.dig('data', 'preview', 'images', 0, 'source', 'url'))
        }
      end
      submissions.select! { |s| s[:image_url].present? }

      submissions.each do |s|
        photo = Photo.find_by(reddit_id: s[:id])
        if photo.nil?
          photo = Photo.create!(reddit_id: s[:id])
          photo.image.attach(io: open(s[:image_url]), filename: s[:id])
          pp "Added Photo with ID #{s[:id]}"
        else
          pp "Photo with ID #{s[:id]} already exists"
        end
      end
    end
  end
end
