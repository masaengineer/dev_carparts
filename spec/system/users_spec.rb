require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "creates a new user" do
    visit user_registration_path	
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Create User"

    expect(page).to have_content "User was successfully created"
  end
end
