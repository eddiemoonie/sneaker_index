class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to user_path(current_user)
    else
      redirect_to new_review_path
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :post,
      :product_id
    )
  end
end
