require "rails_helper"

RSpec.describe PendingMembersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pending_members").to route_to("pending_members#index")
    end

    it "routes to #new" do
      expect(get: "/pending_members/new").to route_to("pending_members#new")
    end

    it "routes to #show" do
      expect(get: "/pending_members/1").to route_to("pending_members#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pending_members/1/edit").to route_to("pending_members#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pending_members").to route_to("pending_members#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pending_members/1").to route_to("pending_members#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pending_members/1").to route_to("pending_members#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pending_members/1").to route_to("pending_members#destroy", id: "1")
    end
  end
end
