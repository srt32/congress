# Congress Today

This app runs on Rails and uses the Sunlight Foundation API and the Google News RSS Feed.

To boot the server: `rails s`

To run the specs: `rspec`

Contributions welcome!

# Related notes:

## nytimes api:

http://developer.nytimes.com/article_search_v2.json#/Console/GET/articlesearch.json

sample query for article search:

```
uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
uri.query = URI.encode_www_form({
  "api-key" => XXX_API_KEY,
  "q" => "congress bill 957",
  "begin_date" => "20161201"
})
request = Net::HTTP::Get.new(uri.request_uri)
@result = JSON.parse(http.request(request).body)
puts @result.inspect
```

## some other ideas for new api's
* https://webhose.io/archive#
* http://eventregistry.org/searchEvents
* http://developer.nytimes.com/times_tags_v3.json#/Console/GET/timestags.json

## sunglight API for bills

docs: https://sunlightlabs.github.io/congress/bills.html

apis: https://congress.api.sunlightfoundation.com/bills?order=introduced_on

returns

```
{
  "results": [
    {
      "bill_id": "hr6536-114",
      "bill_type": "hr",
      "chamber": "house",
      "committee_ids": [
        "HSED"
      ],
      "congress": 114,
      "cosponsors_count": 0,
      "enacted_as": null,
      "history": {
        "active": false,
        "awaiting_signature": false,
        "enacted": false,
        "vetoed": false
      },
      "introduced_on": "2016-12-30",
      "last_action_at": "2016-12-30",
      "last_vote_at": null,
      "number": 6536,
      "official_title": "To prohibit the employment of school bus drivers with serious moving violations.",
      "popular_title": null,
      "related_bill_ids": [],
      "short_title": null,
      "sponsor": {
        "first_name": "Grace",
        "last_name": "Meng",
        "middle_name": null,
        "name_suffix": null,
        "nickname": null,
        "title": "Rep"
      },
      "sponsor_id": "M001188",
      "urls": {
        "congress": "https://www.congress.gov/bill/114th/house-bill/6536",
        "govtrack": "https://www.govtrack.us/congress/bills/114/hr6536"
      },
      "withdrawn_cosponsors_count": 0
    }
  ...
```
