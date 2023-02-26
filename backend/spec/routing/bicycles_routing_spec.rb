require "rails_helper"

RSpec.describe BicyclesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bicycles").to route_to("bicycles#index")
    end

    it "routes to #show" do
      expect(get: "/bicycles/1").to route_to("bicycles#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bicycles").to route_to("bicycles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bicycles/1").to route_to("bicycles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bicycles/1").to route_to("bicycles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bicycles/1").to route_to("bicycles#destroy", id: "1")
    end
  end
end
