require "rubygems"
require "bundler"

Bundler.require

require_relative "./config/sidekiq"

require 'sidekiq/web'
map "/sidekiq" do
  run Sidekiq::Web
end

require "./fever_api"
map "/fever" do
  run FeverAPI::Endpoint
end

require "./app"
run Stringer
