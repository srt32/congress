class HelloWorldController < ApplicationController
  def index
    bills = get_recent_bills
    @hello_world_props = { bills: bills, name: "Stranger" }
  end

  private

  # TODO(srt32): dedup me
  def get_recent_bills
    Rails.cache.fetch("recent_bills", expires_in: 30.minutes) do
      Rails.logger.info("fetching recent bills")

      client = Sunlight.new
      client.recent_bills
    end
  end
end
