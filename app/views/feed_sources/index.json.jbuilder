json.array!(@feed_sources) do |feed_source|
  json.extract! feed_source, :id, :name, :url
  json.url feed_source_url(feed_source, format: :json)
end
