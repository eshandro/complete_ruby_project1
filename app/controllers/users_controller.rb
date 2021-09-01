class UsersController < ApplicationController
  # GET /signup
  def new
    @user = User.new
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "#{@user.username}! You have successfully updated your profile."
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.username}! You have successfully signed up."
      redirect_to articles_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end