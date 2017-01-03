# TODO(srt32): add test coverage

class Sunlight
  def initialize(api_key=nil)
  end

  def recent_bills
    url = "https://congress.api.sunlightfoundation.com/bills?order=introduced_on"
    uri = URI(url)

    # TODO(srt32): handle errors
    response = Net::HTTP.get(uri) 
    parsed_response = JSON.parse(response)

    results = parsed_response["results"]
    results.map { |result| Bill.new(result) }
  end
end

class Bill
  attr_writer :articles

  def initialize(raw_bill)
    @raw_bill = raw_bill
  end

  def articles
    @articles || []
  end

  def bill_id
    @raw_bill["bill_id"]
  end

  def chamber
    @raw_bill["chamber"]
  end

  def introduced_on
    @raw_bill["introduced_on"]
  end

  def short_title
    @raw_bill["short_title"]
  end

  def title
    @raw_bill["official_title"]
  end

  def sponsor_last_name
    @raw_bill["sponsor"]["last_name"]
  end

  def urls_congress
    @raw_bill["urls"]["congress"]
  end
end
