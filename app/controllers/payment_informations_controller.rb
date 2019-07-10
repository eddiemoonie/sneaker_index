class PaymentInformationsController < ApplicationController
  def new
    @payment_info = PaymentInformation.new
  end

  def create
    @payment_info = PaymentInformation.new(payment_params)
    @payment_info.save
  end

  def destroy
    @payment_info = PaymentInformation.find(params[:id])
    @payment_info.destroy
  end

  private

    def payment_params
      params.require(:payment_information).permit(
        :card_number,
        :exp_month,
        :exp_year,
        :ccv,
        :full_name,
        :street_address,
        :city,
        :state,
        :zip_code
      )
    end
end
