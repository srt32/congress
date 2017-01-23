class PagesController < ApplicationController
  def main
    @recent_bills = get_recent_bills

    @recent_bills.each do |recent_bill|
      articles = Rails.cache.fetch("recent_articles-#{recent_bill.bill_id}", expires_in: 60.minutes) do
        Rails.logger.info("fetching recent articles for #{recent_bill.bill_id}")

        GoogleNews.new.recent_articles(
          recent_bill.short_title || recent_bill.title
        ).first(Rails.env.production? ? 5 : 1)
      end

      recent_bill.articles = articles
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
