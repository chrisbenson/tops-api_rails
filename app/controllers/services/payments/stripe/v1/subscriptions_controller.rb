class Services::Payments::Stripe::V1::SubscriptionsController < AuthenticatedController

  require 'stripe'

  def create

    Stripe.api_key = "sk_test_gtXQGLTsuAijh5xzPHg78wAc"

    begin

    customer = Stripe::Customer.create(
        description: "Practice ID: " + params[:subscription][:practice_id],
        card: {number: params[:subscription][:card_number], exp_month: params[:subscription][:exp_month], exp_year: params[:subscription][:exp_year]}
    )
    customer.subscriptions.create(plan: "tops-test")

    render json: customer, status: 200

    rescue Stripe::CardError => e
      error = e.json_body
      render json: error, status: 400

    end

  end

end
