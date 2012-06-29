class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
  
  def favorite
    if current_user
      ft = FoodTruck.find_by_handle(params[:handle])
      if ft
        current_user.favorites << ft
        @result = true;
      else
        @result = false
      end
    else
      @result = false
    end
    render layout: false
  end
  
  def unfavorite
    if current_user
      ft = FoodTruck.find_by_handle(params[:handle])
      if ft && current_user.favorites.include?(ft)
        current_user.favorites.delete ft
        @result = true;
      else
        @result = false
      end
    else
      @result = false
    end
    render :favorite, layout: false
  end
  
end
