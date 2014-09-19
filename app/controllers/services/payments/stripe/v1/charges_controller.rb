class Services::Payments::Stripe::V1::ChargesController < AuthenticatedController

  require 'stripe'

  def create

    Stripe.api_key = "sk_test_gtXQGLTsuAijh5xzPHg78wAc"

    begin

      charge = Stripe::Charge.create(
        amount: params[:charge][:amount],
        currency: "usd",
        card: {number: params[:charge][:card_number], exp_month: params[:charge][:exp_month], exp_year: params[:charge][:exp_year]},
        description: "Practice ID: " + params[:charge][:practice_id]
      )

      render json: charge, status: 200

    rescue Stripe::CardError => e
      error = e.json_body
      render json: error, status: 400

    end

  end

end
