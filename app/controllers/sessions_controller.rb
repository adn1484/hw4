class SessionsController < ApplicationController
  def new
  end

  def create
      @user = User.find_by({"username" => params["username"]})
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      flash["notice"] = "Welcome"
      redirect_to "/places"
      else
        flash["notice"] = "Incorrect Password."
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "No user found."
      redirect_to "/sessions/new"
      end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  