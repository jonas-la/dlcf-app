require "rails_helper"

RSpec.describe(OrginfosController, type: :routing) do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/orginfos").to(route_to("orginfos#index"))
    end

    it "routes to #new" do
      expect(get: "/orginfos/new").to(route_to("orginfos#new"))
    end

    it "routes to #show" do
      expect(get: "/orginfos/1").to(route_to("orginfos#show", id: "1"))
    end

    it "routes to #edit" do
      expect(get: "/orginfos/1/edit").to(route_to("orginfos#edit", id: "1"))
    end


    it "routes to #create" do
      expect(post: "/orginfos").to(route_to("orginfos#create"))
    end

    it "routes to #update via PUT" do
      expect(put: "/orginfos/1").to(route_to("orginfos#update", id: "1"))
    end

    it "routes to #update via PATCH" do
      expect(patch: "/orginfos/1").to(route_to("orginfos#update", id: "1"))
    end

    it "routes to #destroy" do
      expect(delete: "/orginfos/1").to(route_to("orginfos#destroy", id: "1"))
    end
  end
end
