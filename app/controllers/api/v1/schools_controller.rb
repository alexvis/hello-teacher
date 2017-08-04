class Api::V1::SchoolsController < ApplicationController
  skip_before_action :verify_authenticity_token



  def index
    render json: School.all
  end

  def show
    render json: School.find(params[:id])

  end

  def create
    binding.pry
    data = JSON.parse(request.body.read)
     review = School.new(data)
     review.save
     render json: review
  end

end
