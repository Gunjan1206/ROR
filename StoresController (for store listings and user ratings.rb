class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @stores = Store.all.order(:name).includes(:ratings)
  end

  def show
    @store = Store.find(params[:id])
    @user_rating = @store.ratings.find_by(user: current_user)
  end
end
