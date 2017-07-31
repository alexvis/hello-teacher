class SchoolsController < ApplicationController
  def index
    @school = School.all
  end


end
