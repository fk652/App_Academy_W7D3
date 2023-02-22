require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    
    describe "POST /users (:create)" do
      it "fails with invalid params" do
        post users_url, params: {
          user: {
            username: "Asuma Sarutobi"
          }
        }
      end
    end
    
    describe "GET /users (:index)" do
      it "renders the users index" do
        get users_url
        expect(response).to have_http_status(200)
        expect(response.body).to include("ALL NINJAS")
      end
    end

  end
end
