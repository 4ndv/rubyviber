require 'faraday'
require 'faraday_middleware'

module Rubyviber
  class Client
    def initialize token, adapter: Faraday.default_adapter, logging: true, raise_errors: true, log_bodies: false
      @faraday = Faraday.new url: "https://chatapi.viber.com/pa/", headers: { "X-Viber-Auth-Token": token } do |faraday|
        faraday.request :multipart

        # Logging
        faraday.response(:logger, ::Logger.new(STDOUT), bodies: log_bodies) if logging

        # Json encoder
        faraday.use FaradayMiddleware::EncodeJson

        # Enabling error raising
        faraday.use Faraday::Response::RaiseError if raise_errors

        # Enabling json parser
        faraday.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/

        faraday.adapter adapter
      end
    end

    # Using method_missing for catching all the methods
    def method_missing method, *args, &block
      if args.size > 1
        raise ArgumentError.new "wrong number of arguments (#{args.size} for 0..1)"
      end

      args.push({}) if args.size == 0

      call method.to_s, args[0]
    end

    # Call method from viber rest api
    def call method, args = {}
      unless args.is_a? Hash
        raise ArgumentError.new "argument must be a Hash"
      end

      @faraday.post method.to_s, args
    end
  end
end