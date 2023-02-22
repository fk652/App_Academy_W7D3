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
    
    

  end
end
