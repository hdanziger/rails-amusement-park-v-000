class UsersController < ApplicationController

    
    def index
         @users = User.all
    end
  
   def show
        @user = User.find(params[:id])
         @message = params[:message] if params[:message]
    @message ||= false
    end

  
  def new
      @user = User.new
  end
  
  def create 
      @user = User.new(user_params)
    #  binding.pry
      if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          render :new
      end
  end
  
  def edit
  end
  
  def update
      if @user.update(user_params)
          redirect_to @user
      else
          render :edit
      end
  end
  
  def destroy 
      session.delete :user_id
      redirect_to '/'
  end
  
  
  
  private
  
    
    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :height, :tickets, :admin, :password)
    end
end



