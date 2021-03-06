require 'test_helper'

class RegisteredUserManagesProfileTest < ActionDispatch::IntegrationTest
  test 'registered user can log in' do
    user = create(:user)
    user.update(role: 1)

    visit root_path
    within ".right" do
      click_link "Login"
    end

    fill_in "Username", with: user.username
    fill_in "Password", with: "pass"

    click_button "Login"

    assert page.has_content?(user.username)
  end

  test 'registered user edit info' do
    user = create(:user)
    user.update(role: 1)

    visit root_path
    within ".right" do
      click_link "Login"
    end

    fill_in "Username", with: user.username
    fill_in "Password", with: "pass"

    click_button "Login"

    assert page.has_content?(user.username)

    click_link "Edit Profile"

    fill_in "Username", with: "Larry.Walker"

    click_button "Update Account"
    assert page.has_content? "Larry.Walker"
  end


end
