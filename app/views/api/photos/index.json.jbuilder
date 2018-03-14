json.photos @photos do |photo|
  json.reddit_id photo.reddit_id
  json.image_url polymorphic_url(photo.image.variant(resize: '500x500>'))
end
