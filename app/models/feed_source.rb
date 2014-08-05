class FeedSource < ActiveRecord::Base
  before_save :validate_and_update_source

  def validate_and_update_source
    begin
    feed = Feedjira::Feed.fetch_and_parse(url)
    raise 'URL not valid' unless feed.respond_to?(:title)
    self.name = feed.title
    rescue => e
      self.errors.add(:base, "Invalid Feed - #{e.to_s}")
      return false
    end
  end
end
