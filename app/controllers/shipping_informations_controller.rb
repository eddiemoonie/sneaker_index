class ShippingInformationsController < ApplicationController
  def new
    @shipping_info = ShippingInformation.new
  end

  def create
    @shipping_info = ShippingInformation.new(shipping_params)
    @shipping_info.save
  end

  def destroy
    @shipping_info = ShippingInformation.find(params[:id])
    @shipping_info.destroy
  end

  private

    def shipping_params
      params.require(:shipping_information).permit(
        :first_name,
        :last_name,
        :street_address,
        :city,
        :state,
        :zip_code
      )
    end

end
