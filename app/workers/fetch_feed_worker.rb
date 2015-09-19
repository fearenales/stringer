require 'sidekiq/worker'
require_relative "../repositories/feed_repository"
require_relative "../tasks/fetch_feed"

class FetchFeedWorker
  include Sidekiq::Worker

  def perform(feed_id)
    feed = FeedRepository.fetch(feed_id)
    FetchFeed.new(feed).fetch
  end
end
