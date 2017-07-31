class Api::V1::SchoolsController < ApplicationController
  def index
    render json: School.all
  end

  def show
    park = School.find(params[:id])
    render json: park
  end

end
