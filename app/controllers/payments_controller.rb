class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook

  def create
    payment = MonopayRuby::Invoices::SimpleInvoice.new(
      "https://localhost:3000",
      "https://localhost:3000/payments/webhook"
    )
    amount = params[:amount].to_d
    discount_is_fixed = params[:discount_is_fixed] == "true"

    if discount_is_fixed
      discount = params[:discount].to_d
    else
      discount = params[:discount].to_i
    end

    if payment.create(amount, discount, discount_is_fixed)
      redirect_to payment.page_url, allow_other_host: true
    else
      redirect_to root_path, alert: "Something went wrong with payment"
    end
  end

  def webhook
    webhook_validator = MonopayRuby::Webhooks::Validator.new(request)
  end
end
