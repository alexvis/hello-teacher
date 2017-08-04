require "rails_helper"

RSpec.describe Api::V1::ClassroomsController, type: :controller do
  let!(:classroom) { Classroom.create(
    subject: "Mat",
    grade: "3",
    class_number: "35",
    ) }

  xdescribe "GET#index" do
    it "should return details about a school" do

      get :index
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 1
      expect(returned_json["classrooms"][0]["subject"]).to eq "Mat"
      expect(returned_json["classrooms"][0]["grade"]).to eq "3"
      expect(returned_json["classrooms"][0]["class_number"]).to eq  "35"
    end
  end

end
