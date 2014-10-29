class Services::Payments::Stripe::V1::Connect::TokensController < ApplicationController

  def index

    render json: self.create_stripe_connect_token(params['code'])

  end

  def create

    render json: self.create_stripe_connect_token(params['code'])

  end

  def create_stripe_connect_token(code)

    conn = Faraday.new(:url => 'https://connect.stripe.com/oauth/token') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.post do |req|
      req.body = 'grant_type=authorization_code&client_secret=sk_test_gtXQGLTsuAijh5xzPHg78wAc&code=' + code
    end

    return response.body

  end

end
