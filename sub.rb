require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new(:host => 'hackon.cc')

$redis.subscribe('rcne') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "##{channel} - [#{data['user']}]: #{data['msg']}"
  end
end
