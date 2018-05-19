import requests

api_url = "http://localhost:3000/"
subreddit_details_ext = "subreddit/activity?name="
subreddit_name = "LifeProTips"

full_path = api_url + subreddit_details_ext + subreddit_name
resp = requests.get(full_path)

print(resp.json())
