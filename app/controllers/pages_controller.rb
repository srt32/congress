class PagesController < ApplicationController
  def main
    @recent_bills = get_recent_bills
  end

  def about
  end

  private

  def get_recent_bills
    # TODO(srt32): discern better cache expiration time
    Rails.cache.fetch("recent_bills", expires_in: 10.minutes) do
      Rails.logger.info("fetching recent bills")
      client = Sunlight.new
      client.recent_bills
    end
  end
end
