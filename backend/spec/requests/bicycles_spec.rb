require 'rails_helper'

RSpec.describe "/bicycles", type: :request do
  let(:valid_attributes) {
    { name: "MyString", description: "MyText", price: 1, image: "MyString" }
  }

  let(:invalid_attributes) {
    { name: "MyString", description: "MyText", price: "Mystring", image: "MyString" }
  }

  let(:valid_headers) {
    {
      "Accept" => "application/json",
      "Content-Type" => "application/json",
      "Authorization" => "Bearer [token]"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Bicycle.create! valid_attributes
      get bicycles_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      bicycle = Bicycle.create! valid_attributes
      get bicycle_url(bicycle), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Bicycle" do
        expect {
          post bicycles_url,
               params: { bicycle: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Bicycle, :count).by(1)
      end

      it "renders a JSON response with the new bicycle" do
        post bicycles_url,
             params: { bicycle: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Bicycle" do
        expect {
          post bicycles_url,
               params: { bicycle: invalid_attributes }, as: :json
        }.to change(Bicycle, :count).by(0)
      end

      it "renders a JSON response with errors for the new bicycle" do
        post bicycles_url,
             params: { bicycle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested bicycle" do
        bicycle = Bicycle.create! valid_attributes
        patch bicycle_url(bicycle),
              params: { bicycle: new_attributes }, headers: valid_headers, as: :json
        bicycle.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the bicycle" do
        bicycle = Bicycle.create! valid_attributes
        patch bicycle_url(bicycle),
              params: { bicycle: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the bicycle" do
        bicycle = Bicycle.create! valid_attributes
        patch bicycle_url(bicycle),
              params: { bicycle: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested bicycle" do
      bicycle = Bicycle.create! valid_attributes
      expect {
        delete bicycle_url(bicycle), headers: valid_headers, as: :json
      }.to change(Bicycle, :count).by(-1)
    end
  end
end
