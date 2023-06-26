class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook

  def create
    payment = MonopayRuby::Invoices::SimpleInvoice.new(
      "https://localhost:3000",
      "https://localhost:3000/payments/webhook"
    )

    if payment.create(1)
      redirect_to root_path, notice: "Payment succesful"
    else
      redirect_to root_path, alert: "Something went wrong with payment"
    end
  end

  def webhook
    webhook_validator = MonopayRuby::Webhooks::Validator.new(request)
  end
end
