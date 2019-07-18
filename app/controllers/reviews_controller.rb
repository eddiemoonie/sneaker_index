class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    binding.pry
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
