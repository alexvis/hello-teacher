require 'rails_helper'

feature "profile photo" do
  xscenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"
    fill_in "First Name", with: "Alex"
    fill_in "Last Name", with: "Vis"
    fill_in "Email", with: "ash@s-mart.com"
    attach_file "user_profile_photo", "#{Rails.root}/spec/support/images/photo.png"
    click_button "Upload Picture"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign Up"

    expect(page).to have_css("img[src*='photo.png']")
  end
end
