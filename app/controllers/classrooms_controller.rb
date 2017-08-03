class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
  end
  def show
  end
end
