class SubredditController < ApplicationController

  def activity
    subreddit_name = params[:name]
    subreddit_url = "https://www.reddit.com/r/" + subreddit_name + ".json"
    response = RestClient.get(subreddit_url, headers={})
    page_json = JSON.parse(response.body)

    parent_data = page_json["data"]["children"]
    current_time = Time.now.to_i
    time_threshold = current_time - 3600

    subreddit_details = { number_of_posts: 0, post_details: [] }

    parent_data.each do |post|
      post = post["data"]
      if post["created_utc"] > time_threshold
        subreddit_details[:number_of_posts] += 1

        post_information = {
          title: post["title"],
          author: post["author"],
          upvotes: post["ups"]
        }

        subreddit_details[:post_details].push(post_information)
      end
    end

    render status: :ok, json: subreddit_details.to_json
  end

end
