# coding: UTF-8
require 'open-uri'
require 'json'

exit if ARGV.size < 1

http_protocol = 'http://'
http_host = 'translate.google.com'
source_lang = 'auto'
target_lang = 'auto'

pos = ARGV[0].start_with?('-') ? 1 : 0
text = ARGV[pos..-1].inject(:<<)

query_text = "&sl=#{source_lang}&tl=#{target_lang}&text=#{text}"
url = "#{http_protocol}#{http_host}/translate_a/t?client=p&ie=UTF-8&oe=UTF-8#{query_text}"
respond = (open URI.encode(url)).read
parsed = JSON.parse(respond)

puts parsed["sentences"][0]["trans"]


