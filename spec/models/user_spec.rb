require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Signup Email" do
    include EmailSpec::Helpers
    include EmailSpec::Matchers
  
    before(:all) do
      @user = User.new(username: 'JojoBinks', email:'jojo@yahoo.com')
      @email = UserMailer.registration_confirmation(@user)
    end
  
    it "delivers to the email passed in" do
      @email.should deliver_to("jojo@yahoo.com")
    end
  end
end