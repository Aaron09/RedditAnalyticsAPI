require "rails_helper"
require "json"

RSpec.describe Post, type: :request do

  it "gets the basic details of a Reddit post as json" do

    reddit_post_url = "https://www.reddit.com/r/LifeProTips/comments/8kc3bc/lpt_save_your_powerpoint_presentations_with_a_pps/"
    expected_title = "LPT: Save your PowerPoint presentations with a .pps extension instead of .ppt. They'll open directly in presentation mode and PowerPoint will close when the slideshow is over."

    headers = { "CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json" }
    post "/post/details", params: { post_url: reddit_post_url }.to_json, headers: headers

    expect(response.header["Content-Type"]).to include "application/json"
    
    json_body = JSON.parse(response.body)
    expect(json_body["author"].to eq("ZockMedic"))
    expect(json_body["content"].to eq(""))
    expect(json_body["title"].to eq(expected_title))
  end

end
