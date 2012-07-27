class UserController < ApplicationController
  before_filter :signed_in_user, :only => [:showall, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
  
  def index
    @user = User.new
    if signed_in?
      redirect_to user_id_url(current_user)
    end
  end
  
  def create 
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_id_url(@user)
    else
     #redirect_to "http://localhost:3000/user/"
    end
  end
  
  def add_stock
    @stock = Stock.new
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
  
  def show
    @user = User.find(params[:id])
    @stock = Stock.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to user_id_path(@user)
    else
      render 'edit'
    end
  end
  
  def showall
    @user = User.paginate(:page => params[:page], :per_page => 4)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to user_path
  end
  
  private
    def signed_in_user
      redirect_to signin_path, :notice => "Please sign in." unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless (current_user.admin == true)
    end
end
