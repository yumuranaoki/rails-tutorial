require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signup" do
    it "works! (now write some real specs)" do
      get signup_path
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
      expect(response).to have_http_status(200)
    end
  end
end