class Api::V1::SchoolsController < ApplicationController
  skip_before_action :verify_authenticity_token



  def index
    render json: School.all
  end

  def show
    park = School.find(params[:id])
    render json: park
  end

  def create
    data = JSON.parse(request.body.read)
     review = School.new(data)
     review.save
  end
end
