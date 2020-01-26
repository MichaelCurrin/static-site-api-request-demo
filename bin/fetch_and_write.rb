# Fetch and write application.
#
# Do a POST request to a dummy endpoint, handle the response data and write it to a publically
# served file.
#
# As a more advanced feature, an environment variable is sent in the payload, returned by the
# API and written to the JSON file. This emulates reading an environment variable locally or on
# Netlify such as when doing an API request using a secret token.
#
# NB. This script must be run from the project root.
require 'json'
require 'faraday'

PAY_LOAD = {
  "Foo": "bar",
  "Fuzz": 123,
  "Secret": ENV['TOKEN'],
}
API_URL = 'http://httpbin.org/post'

PUBLIC_DIR_PATH = '_site'
OUTPUT_FILENAME = 'api_data.json'
OUTPUT_PATH = "#{PUBLIC_DIR_PATH}/#{OUTPUT_FILENAME}"


def do_post(url, payload)
  puts "Do POST request"

  resp = Faraday.post(
    url,
    payload.to_json,
    "Content-Type" => "application/json"
  )
  puts "Status: #{resp.status}"

  resp_data = JSON.parse resp.body
  # Return as Hash. The 'data' value is just a string.
  resp_data['json']
end


def write(path, json_data)
  puts "Write file: #{path}"
  pretty_json_str = JSON.pretty_generate(json_data)
  File.open(path, 'w') { |file| file.write(pretty_json_str) }
end


Dir.mkdir(PUBLIC_DIR_PATH) unless File.exists?(PUBLIC_DIR_PATH)
json_data = do_post(API_URL, PAY_LOAD)
write(OUTPUT_PATH, json_data)
