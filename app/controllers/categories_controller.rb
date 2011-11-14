class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_name(params[:name])
    @tweets = Twitter.user_timeline("corywilliamson")
  end

end
