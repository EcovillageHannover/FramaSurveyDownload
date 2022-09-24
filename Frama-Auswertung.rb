#!/usr/bin/env ruby

require 'date'
require 'net/http'

# Replace … with the IDs of the Frame surveys

URLs = {
  a: 'https://my-evh.de/framadate/…/admin',
  b: 'https://my-evh.de/framadate/…/admin'
}

URLs.each do |key, value|
  data = Net::HTTP.get(URI(value))

  filename = "#{Date.today.iso8601}-#{key}.html"

  File.open(filename, 'w') do |file|
    file << data.gsub('&quot;', '')
  end

  system("open #{filename}")
end
