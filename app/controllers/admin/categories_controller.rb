class Admin::CategoriesController < ApplicationController
  layout "admin"
  
  before_filter :get_resource , :only => [:show, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def show
  end
  
  def new
    @category = Category.new
  end

  def edit
  end

  def update
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully created Category." 
      redirect_to admin_categories_path
    else
      render :action => 'new'
    end
  end

  def destroy
  end

private
  def get_resource
    @category = Category.find(params[:id])
  end

end
