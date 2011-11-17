class Admin::TwitterListsController < ApplicationController
  layout "admin"
  
  def index
    @twitter_lists = TwitterList.all
  end

  def show
    @twitter_list = TwitterList.find(params[:id])
  end

  def new
    @twitter_list = TwitterList.new
  end

  def create
    @twitter_list = TwitterList.new(params[:twitter_list])
    if @twitter_list.save
      redirect_to [:admin, @twitter_list], :notice => "Successfully created twitter list."
    else
      render :action => 'new'
    end
  end

  def edit
    @twitter_list = TwitterList.find(params[:id])
  end

  def update
    @twitter_list = TwitterList.find(params[:id])
    if @twitter_list.update_attributes(params[:twitter_list])
      redirect_to [:admin, @twitter_list], :notice  => "Successfully updated twitter list."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @twitter_list = TwitterList.find(params[:id])
    @twitter_list.destroy
    redirect_to admin_twitter_lists_url, :notice => "Successfully destroyed twitter list."
  end
end
