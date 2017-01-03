require 'rss'

class GoogleNews
  def initialize(api_key=nil)
  end

  def recent_articles(query)
    open(full_url(query)) do |rss|
      feed = RSS::Parser.parse(rss)

      feed.items.map { |item| Article.new(item) }
    end
  end

  private

  def full_url(query)
    "https://news.google.com/news?q=#{query}&output=rss"
  end
end

class Article
  def initialize(raw_article)
    @raw_article = raw_article
  end

  def title
    @raw_article.title
  end

  def link
    @raw_article.link
  end

  def publish_date
    @raw_article.pubDate
  end
end
