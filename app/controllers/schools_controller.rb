class SchoolsController < ApplicationController
  before_action :authorize_user, only: [:index, :destroy]



  def index
    @school = School.all
  end

 def show
 end

 def create
 end

 def destroy
 end

 private
 def school_params
   params.require(:school).permit(:name, :state, :address, :city, :zip_code)
 end

 def authorize_user
   if !user_signed_in? || !current_user.admin? && !current_user.teacher?
     raise ActionController::RoutingError.new("Not Found")
   end
 end

end
