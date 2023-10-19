require "rails_helper"

RSpec.describe "Signup page", type: :feature do
  before :each do
    @user1 = User.new(name: "ahmed", email: "ahmed@gmail.com", password: "123456",
                      password_confirmation: "123456")
    visit new_user_registration_path
  end

  it "should see the inputs (fields) in register page" do
    expect(page).to have_field "Name"
    expect(page).to have_field "Email"
    expect(page).to have_field "New password"
    expect(page).to have_field "Confirm Password"
  end

  it "should see the next button" do
    expect(page).to have_button "Sign up"
  end

  it "should be able to sign up successfully and go to categories page" do
    fill_in "Name", with: @user1.name
    fill_in "Email", with: @user1.email
    fill_in "New password", with: @user1.password
    fill_in "Confirm Password", with: @user1.password_confirmation
    click_button "Sign up"
    expect(page).to have_content("CATEGORIES")
  end

  it "should error appears if you entered wrong data" do
    fill_in "Name", with: ""
    fill_in "Email", with: ""
    fill_in "New password", with: ""
    fill_in "Confirm Password", with: ""
    click_button "Sign up"
    expect(page).to have_content("3 errors")
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Password can\'t be blank')
    expect(page).to have_content('Name can\'t be blank')
  end

  it "should error appears if the password don't match confirm" do
    fill_in "Name", with: @user1.name
    fill_in "Email", with: @user1.email
    fill_in "New password", with: @user1.password
    fill_in "Confirm Password", with: ""
    click_button "Sign up"
    expect(page).to have_content("1 error")
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end
end
