class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      binding.pry
      redirect_to user_path(current_user)
    end
  end
end
