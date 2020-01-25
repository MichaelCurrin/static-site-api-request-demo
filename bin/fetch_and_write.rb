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
resp = Faraday.post(
  'http://httpbin.org/post',
  PAY_LOAD.to_json,
  "Content-Type" => "application/json"
)
resp_data = JSON.parse resp.body
resp_json = resp_data['json']
pretty_json_str = JSON.pretty_generate(resp_json)

public_dir = '_site'
Dir.mkdir(public_dir) unless File.exists?(public_dir)

new_filename = 'api_data.json'
new_filepath = "#{public_dir}/#{new_filename}"

File.open(new_filepath, 'w') { |file| file.write(pretty_json_str) }
