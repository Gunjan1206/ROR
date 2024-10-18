class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @store = Store.find(params[:store_id])
    @rating = @store.ratings.build(rating_params.merge(user: current_user))

    if @rating.save
      redirect_to store_path(@store), notice: 'Rating submitted successfully.'
    else
      redirect_to store_path(@store), alert: 'Failed to submit rating.'
    end
  end

  def update
    @store = Store.find(params[:store_id])
    @rating = @store.ratings.find_by(user: current_user)

    if @rating.update(rating_params)
      redirect_to store_path(@store), notice: 'Rating updated successfully.'
    else
      redirect_to store_path(@store), alert: 'Failed to update rating.'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end
