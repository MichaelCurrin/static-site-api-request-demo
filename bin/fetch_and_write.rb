# Fetch and write application.
#
# Do a POST request to a dummy endpoint, handle the response data and write it to a publically
# served file.
#
# NB. This script must be run from the project root.
require 'json'
require 'faraday'

PAY_LOAD = {
  "Foo": "bar",
  "Fuzz": 123
}
API_URL = 'http://httpbin.org/post'

def do_post(url, payload)
  resp = Faraday.post(
    url,
    payload.to_json,
    "Content-Type" => "application/json"
  )
  puts "Status: #{resp.status}"

  resp_data = JSON.parse resp.body
  resp_data['json']
end


public_dir = '_site'
Dir.mkdir(public_dir) unless File.exists?(public_dir)

new_filename = 'api_data.json'
new_filepath = "#{public_dir}/#{new_filename}"

json_data = do_post(API_URL, PAY_LOAD)

puts "Write file: #{new_filepath}"
pretty_json_str = JSON.pretty_generate(json_data)
File.open(new_filepath, 'w') { |file| file.write(pretty_json_str) }
