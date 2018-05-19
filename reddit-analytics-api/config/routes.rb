Rails.application.routes.draw do
  
  get "post/details", to: "post#details"
  get "subreddit/activity", to: "subreddit#activity"

end
