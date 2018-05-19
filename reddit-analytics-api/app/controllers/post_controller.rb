require "rest-client"

class PostController < ApplicationController

  def details

    json_url = params[:url] + ".json"
    response = RestClient.get(json_url, headers={})
    page_json = JSON.parse(response.body)

    metadata = page_json[0]["data"]["children"][0]["data"]

    response = { title: metadata["title"], author: metadata["author"], content: metadata["selftext"] }
    render status: :ok, json: response.to_json
  end

end
