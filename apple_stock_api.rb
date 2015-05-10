require 'httparty'
require 'nokogiri'
# require 'json'
require 'open-uri'
require 'sinatra'

url = 'http://finance.yahoo.com/q?s=AAPL'
response = HTTParty.get(URI::encode(url))
dom = Nokogiri::HTML(response.body)

# body = JSON.parse response.body

# puts body.class
# puts response.body
# puts response.headers.inspect
# puts response.headers
# puts dom.class
# puts response.headers['content-type']
# puts dom.xpath("/").size
# puts dom.xpath("//*").size
# puts dom.xpath("//*[@id='yfs_l84_aapl']").size

# puts dom.xpath("//*[@id='yfs_l84_aapl']").first
applestock= dom.xpath("//*[@id='yfs_l84_aapl']").first.content()

puts "the current apple stock price is: $#{applestock}"


# # =>Nokogiri::HTML::Document
#
#
# puts response.headers['content-space']
# my_span = dom.xpath("//span[@id='yfs_184_aapl']")
# puts my_span

get '/' do
	"the current apple stock price is: $#{applestock}"
end