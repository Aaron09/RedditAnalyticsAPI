class PostController < ApplicationController

  def details

    json_url = params[:post_url] + ".json"
    page_json = JSON.parse(get(json_url))

    metadata = page_json[0]["data"]["children"][0]["data"]

    response = { title: metadata["title"], author: metadata["author"], content: metadata["selftext"] }
    render status: :ok, json: response.to_json
  end

end
