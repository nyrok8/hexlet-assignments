# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'net/http'

class Hacker
  class << self
    def hack(email, password)
      uri = URI.open('https://rails-collective-blog-ru.hexlet.app/users/sign_up')
      cookie = uri.meta['set-cookie']
      html = uri.read

      doc = Nokogiri::HTML(html)
      token = doc.at('meta[name="csrf-token"]')&.[]('content')

      params = {
        'authenticity_token' => token,
        'user[email]' => email,
        'user[password]' => password,
        'user[password_confirmation]' => password
      }

      uri = URI('https://rails-collective-blog-ru.hexlet.app/users')
      req = Net::HTTP::Post.new(uri)
      req['Cookie'] = cookie
      req['Content-Type'] = 'application/x-www-form-urlencoded'
      req.set_form_data(params)

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end

      case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        puts "#{res.code}: success"
        true
      else
        puts "#{res.code}: failed"
        res.value
      end
    end
  end
end
