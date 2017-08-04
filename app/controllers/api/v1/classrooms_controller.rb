class Api::V1::ClassroomsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    render json: Classroom.all
  end

  def show
    render json: Classroom.find(params[:id])
  end

  def create
    data = JSON.parse(request.body.read)
     classroom = Classroom.new(data)
     classroom.save
     render json: classroom
  end

end
