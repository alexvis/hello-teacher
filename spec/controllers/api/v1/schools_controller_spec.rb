require "rails_helper"

RSpec.describe Api::V1::SchoolsController, type: :controller do
  let!(:school) { School.create(
    name: "Yosamite",
    address: "Ciceron 6237",
    city: "Montevideo",
    state: "CA",
    zip_code: "12200",
    ) }

  xdescribe "GET#index" do
    it "should return details about a school" do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 1
      expect(returned_json["schools"][0]["name"]).to eq "Yosamite"
      expect(returned_json["schools"][0]["address"]).to eq "Ciceron 6237"
      expect(returned_json["schools"][0]["city"]).to eq  "Montevideo"
      expect(returned_json["schools"][0]["state"]).to eq "CA"
      expect(returned_json["schools"][0]["zip_code"]).to eq  "12200"
    end
  end

end
