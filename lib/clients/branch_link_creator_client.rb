require 'httparty'

include HTTParty

body = {
    "branch_key"=> "key_live_aoxRNscuWAr3XFaqSBYp1embqqhwLjR4",
    "campaign"  => "QATesting",
    "channel"   => "Automation",
    "tags"      => %w["written", "lab2"],
    "type"      => 2,
    "data"      => "{\"name\": \"Deepty\", \"email\": \"deeptymayi.patel@gmail.com\", \"user_id\": \"473396731774521741\", \"$deeplink_path\": \"article/jan/123\", \"$desktop_url\": \"https://branch.io\"}"
}.to_json

headers = {
    "Content-Type"  => "application/json"
}

result = HTTParty.post(
    "https://api.branch.io/v1/url",
    :body => body,
    :headers => headers
)

puts result