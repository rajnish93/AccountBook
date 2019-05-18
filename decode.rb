#!/usr/bin/env ruby
# just pass in the string straight from `curl -v http://my-url-goes-here.com | grep Set-Cookie`
# should look like this:
# Set-Cookie: _my_new_app_session=BAh7B0kiD3Nlc3Npb25faWQGOgZFVEkiJWE1NTA3NWU2MDBjYjE1NWY3N2Y0NzhkOWE3NzdlYzY2BjsAVEkiEG15X3ZhcmlhYmxlBjsARkkiDW15IHZhbHVlBjsAVA%3D%3D--9583fe7995314e148eaa4c16269ca2f6864f6abf; path=/; HttpOnly
# e.g. ruby decode.rb BAh7B0kiD3Nlc3Npb25faWQGOgZFVEkiJWE1NTA3NWU2MDBjYjE1NWY3N2Y0NzhkOWE3NzdlYzY2BjsAVEkiEG15X3ZhcmlhYmxlBjsARkkiDW15IHZhbHVlBjsAVA%3D%3D--9583fe7995314e148eaa4c16269ca2f6864f6abf
require 'uri'
require 'rack'

base64_text = URI.unescape(ARGV[0])
first_part_text, second_part_text = base64_text.split('--')

puts Rack::Session::Cookie::Base64::Marshal.new.decode(first_part_text)
