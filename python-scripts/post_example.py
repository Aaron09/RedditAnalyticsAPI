import requests

api_url = "http://localhost:3000/"
post_details = "post/details?url="
reddit_url = "https://www.reddit.com/r/NoStupidQuestions/comments/8kci0h/does_my_goldfish_know_who_i_am/"

full_path = api_url + post_details + reddit_url
resp = requests.get(full_path)

print(resp.json())
