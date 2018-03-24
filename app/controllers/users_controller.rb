class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def signup
  	@signup = User.new
  end

  def create
  	@user = User.new(user_params)
  	byebug
  	if @user.save
  		flash[:notice] = "User created successfully"
  		render plain: "done"
  	end
  end

  private
  	def user_params
  		params.require('user').permit(:username, :password, :email);
  	end
end
