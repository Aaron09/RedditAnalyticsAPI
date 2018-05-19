require "rails_helper"
require "json"

RSpec.describe "Subreddit", type: :request do

  it "gets the basic details of a subreddit within a timeframe" do
    subreddit_name = "LifeProTips"
    
    get("/subreddit/activity?name=" + subreddit_name)

    expect(response.header["Content-Type"]).to include "application/json"

    json_body = JSON.parse(response.body)
    expect(json_body["number_of_posts"]).to be >= 0
  end

end
