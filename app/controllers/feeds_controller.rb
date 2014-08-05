class FeedsController < ApplicationController
  def list
  	feed_urls = FeedSource.pluck(:url)
    feed = Feedjira::Feed.fetch_and_parse(feed_urls)
    @entry = feed.entries
  end
end
