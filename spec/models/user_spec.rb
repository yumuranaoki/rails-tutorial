require 'rails_helper'

RSpec.describe User, type: :model do
  context "Userを作成するとき" do
    let(:user) { FactoryBot.build(:user, password: 'password', password_confirmation: 'password') }

    it "should be valid" do
      expect(user).to be_valid
    end

    it "should be invalid with name empty" do
      user.name = ""
      expect(user).to be_invalid
    end

    it "should be invalid with email empty" do
      user.email = ""
      expect(user).to be_invalid
    end

    it "name shoud not be too long" do
      user.name = "a" * 51
      expect(user).to be_invalid
    end

    it "email shoud not be too long" do
      user.email = "a" * 244 + "@example.com"
      expect(user).to be_invalid
    end
    
    it "email shoud not be too long" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to be_invalid
      end
    end

    it "email addresses should be unique" do
      user.save
      duplicate_user = user.dup
      expect(duplicate_user).to be_invalid
    end

    specify "email addresses should be saved as lower-case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      user.email = mixed_case_email
      user.save
      expect(mixed_case_email.downcase).to eq user.reload.email
    end

    specify "password should be present" do
      user.password = user.password_confirmation = ""
      expect(user).to be_invalid
    end
  end
end
