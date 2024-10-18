class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @total_users = User.count
    @total_stores = Store.count
    @total_ratings = Rating.count
  end
end
