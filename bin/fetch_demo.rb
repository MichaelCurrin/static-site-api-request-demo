# Fire off a couple of API request and print the results.

# json allows Hash.to_json
require 'json'
require 'faraday'


def format (resp)
  puts "status: #{resp.status}"
  puts "success: #{resp.success?}"
  puts 'body: ', resp.body
  puts
end


puts 'GET basic'
resp = Faraday.get('http://httpbin.org/get')

format resp

puts 'GET advanced'

# You would not often send body on GET but this is an example from Faraday docs to show how.
resp = Faraday.get('http://httpbin.org/get') do |req|
  req.params['limit'] = 100
  req.headers['Content-Type'] = 'application/json'
  req.body = {query: 'foo'}.to_json
end

format resp

puts 'GET with connection object'
conn = Faraday.new :url => 'http://httpbin.org/get'
resp = conn.get

format resp

puts 'POST'
payload = {"Foo": "bar", "Fuzz": 123}
resp = Faraday.post(
  'http://httpbin.org/post',
  payload.to_json,
  "Content-Type" => "application/json"
)

format resp
resp_data = JSON.parse resp.body
puts 'Convert body to data'
puts resp_data
puts 'Show JSON on data'
puts resp_data['json']
puts 'Value in the data for key "Foo"'
puts resp_data['json']['Foo']
