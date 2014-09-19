class Website::V1::DemoRequestsController < ApplicationController

  def create
    Website::V1::WebsiteMailer.demo_request().deliver
    head :ok
  end

end
