require "thread/pool"

require_relative "fetch_feed"

class FetchFeeds
  def initialize(feeds, pool = nil)
    @pool  = pool
    @feeds = feeds
    @feeds_ids = []
  end

  def fetch_all
    @pool ||= Thread.pool(10)

    if @feeds.blank? and !@feeds_ids.blank?
      @feeds = FeedRepository.fetch_by_ids(@feeds_ids)
    end

    @feeds.each do |feed|
      @pool.process do
        FetchFeed.new(feed).fetch

        ActiveRecord::Base.connection.close
      end
    end

    @pool.shutdown
  end

  def prepare_to_delay
    @feeds_ids = @feeds.map { |feed| feed.id }
    @feeds = []
    return self
  end

  def self.enqueue(feeds)
    new(feeds).prepare_to_delay.delay.fetch_all
  end
end
