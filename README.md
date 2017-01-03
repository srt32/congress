# README

# sunglight API for bills

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
