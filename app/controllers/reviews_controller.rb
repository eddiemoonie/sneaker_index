class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def show
  end

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

  def edit
  end

  def update
    binding.pry
    if @review.update(edit_review_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(
      :rating,
      :post,
      :product_id
    )
  end

  def edit_review_params
    params.require(:review).permit(
      :rating,
      :post
    )
  end
end
