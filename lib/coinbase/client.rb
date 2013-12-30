require 'faraday'
require 'faraday_middleware'
module Coinbase
  class Client
    attr_reader :oauth_token, :connection

    def initialize(oauth_token)
      @oauth_token = oauth_token
    end

    def balance
      connection.get do |req|
        req.url 'api/v1/account/balance'
        req.headers = { "Authorization" => "Bearer #{oauth_token}", :accept => 'application/json' }
      end.body.amount
    end

    def send_money(email, amount)
      connection.post do |req|
        req.url 'api/v1/transactions/send_money'
        req.headers = { "Authorization" => "Bearer #{oauth_token}", :accept => 'application/json' }
        req.body    = {
          "transaction" => {
            "to"     => email,
            "amount" => amount
          }
        }
      end
    end

    private
    def connection
      @connection = Faraday.new(:url => 'https://coinbase.com') do |faraday|
        faraday.response :mashify
        faraday.response :json
        faraday.request :json
        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
    end
  end
end