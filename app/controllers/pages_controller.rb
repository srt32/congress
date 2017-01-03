class PagesController < ApplicationController
  def main
    @recent_bills = get_recent_bills

    @recent_bills.each do |recent_bill|
      Rails.cache.fetch("recent_articles-#{recent_bill.bill_id}", expires_in: 15.minutes) do
        recent_bill.articles = GoogleNews.new.recent_articles(
          recent_bill.short_title || recent_bill.title
        ).first(5)
      end
    end
  end

  def about
  end

  private

  def get_recent_bills
    Rails.cache.fetch("recent_bills", expires_in: 30.minutes) do
      Rails.logger.info("fetching recent bills")
      client = Sunlight.new
      client.recent_bills
    end
  end
end
