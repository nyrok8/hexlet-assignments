# frozen_string_literal: true

class Web::Movies::ReviewsController < Web::Movies::ApplicationController
  def index
    @reviews = resource_movie.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = resource_movie.reviews.build(review_params)

    @review.save
    redirect_to movie_reviews_path(resource_movie)
  end

  def edit
    @review = resource_movie.reviews.find(params[:id])
  end

  def update
    @review = resource_movie.reviews.find(params[:id])

    if @review.update(review_params)
      redirect_to movie_reviews_path(resource_movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    review = resource_movie.reviews.find(params[:id])
    review.destroy

    redirect_to movie_reviews_path(resource_movie)
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
