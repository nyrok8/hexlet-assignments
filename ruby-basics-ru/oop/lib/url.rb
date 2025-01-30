# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
    attr_reader :url
    extend Forwardable
    include Comparable

    def initialize(url)
        @url = URI(url)
    end

    def_delegators :@url, :scheme, :host, :port

    def query_params
        return {} if url.query.nil?
        params = url.query.split("&")
        params.reduce({}) do |acc, param|
            key, value = param.split("=")
            acc[key.to_sym] = value
            acc
        end
    end

    def query_param(key, default_value = nil)
        params = query_params
        params.has_key?(key) ? params[key] : default_value
    end

    def <=>(other)
        [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
    end  
end
# END