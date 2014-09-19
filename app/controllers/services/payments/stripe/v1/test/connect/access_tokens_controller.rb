class Services::Payments::Stripe::V1::Test::Connect::AccessTokensController < ApplicationController

  def create

    code = params[:code]




    connection = Faraday.new 'http://localhost:3000'

    # stripe_response = connection.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
    #   req.url '/services/payments/stripe/v1/test/connect/access_tokens', :response_type => 'code'
    #   req.params['scope'] = 'read_write'
    #   req.params['client_id'] = 'ca_4NUi4hPX9R9fbdJrJ0SrZZnfyBQ8I91b'
    # end








    stripe_response = connection.post do |req|
      req.url '/services/payments/stripe/v1/test/connect/access_tokens'
      req.headers['Content-Type'] = 'application/json'
      req.body = { "code": code, "grant_type": "authorization_code", "client_secret": "sk_test_gtXQGLTsuAijh5xzPHg78wAc" }
    end

    render json: stripe_response.body


  end


end
