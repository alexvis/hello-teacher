class SchoolsController < ApplicationController
  def index
    @school = School.all
  end
 def show
 end

end
