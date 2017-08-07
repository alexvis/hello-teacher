class SchoolsController < ApplicationController
  before_action :authorize_user, only: [:index, :destroy]



  def index
    @schools = School.all
  end

 def show
   @school = School.find(params[:id])
   @user = @school.users
 end

 def create
   @school = School.new(school_params)
   user_id = current_user.id

   if @school.save
     redirect_to "/users/user_id"
   else
     print @school.errors.full_messages
     redirect_to '/users/user_id'
   end
 end

 def destroy
   school = School.find(params[:id])
   school.destroy
   redirect_to users_path, notice: ' School was successfully destroyed!'
 end

 private
 def school_params
   params.require(:school).permit(:name, :state, :address, :city, :zip_code, :user_id)
 end

 def authorize_user
   if !user_signed_in? || !current_user.admin? && !current_user.teacher?
     raise ActionController::RoutingError.new("Not Found")
   end
 end

end
