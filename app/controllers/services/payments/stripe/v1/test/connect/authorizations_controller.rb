class Services::Payments::Stripe::V1::Test::Connect::AuthorizationsController < ApplicationController

  def index

    # Makes initial GET authorization request to this Stripe URL:
    # https://connect.stripe.com/oauth/authorize?response_type=code&scope=read_write&stripe_landing=login&client_id=ca_4NUi4hPX9R9fbdJrJ0SrZZnfyBQ8I91b

=begin
    connection = Faraday.new(:url => 'https://connect.stripe.com', :ssl => {
        :ca_path => "/usr/local/etc/openssl/certs"
    }) do |faraday|
      faraday.request  :json           # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
=end

    connection = Faraday.new 'https://connect.stripe.com'

    ## GET ##



    stripe_response = connection.get do |req|                           # GET http://sushi.com/search?page=2&limit=100
      req.url '/oauth/authorize', :response_type => 'code'
      req.params['scope'] = 'read_write'
      req.params['client_id'] = 'ca_4NUi4hPX9R9fbdJrJ0SrZZnfyBQ8I91b'
    end



    #scope = stripe_response.params['scope']
    #code = stripe_response.params['code']


    #headers = stripe_response.headers
    #stripe_response = nil

    #redirect_location = stripe_response.headers['Location']







    #head :no_content

    render text: stripe_response

  end

end
