class ReviewsController < ApplicationController
  before_filter :load_movie
  before_filter :restrict_access
  def new
    @review = @movie.reviews.build # since review is nested in build, it has movie id to create new review
    #@review = Review.new(movie_id: @movie.id)
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @movie, notice: "review created successfully"
    else
      render :new
    end
  end

  protected

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end
end
