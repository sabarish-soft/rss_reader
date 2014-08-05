class FeedsController < ApplicationController
  def list
  	feed_urls = FeedSource.pluck(:url)
    feeds = Feedjira::Feed.fetch_and_parse(feed_urls)
    #Fetch all feed and sort in reverse chronological order
    @entry = feeds.entries.flat_map(&:last).flat_map(&:entries).sort{|p,n| n.published <=> p.published}
  end
end
