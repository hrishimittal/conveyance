require 'rails_helper'

RSpec.feature "Add comment to project", type: :feature do
  let!(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  let!(:project) { Project.create(name: "New Project", status: :draft) }

  before do
    sign_in user
    visit project_path(project)
  end

  scenario "User adds a comment to a project" do
    fill_in "comment_body", with: "This is a new comment"
    click_button "Add Comment"
    expect(page).to have_content("This is a new comment")
    expect(project.comments.last.body).to eq("This is a new comment")
    expect(project.comments.last.user).to eq(user)
  end

  scenario "User cannot add a comment when not logged in" do
    logout(:user)
    visit project_path(project)

    expect(page).not_to have_selector("form#new_comment")
    expect(page).to have_content("To comment, please log in or sign up")
    expect(page).to have_link("log in", href: new_user_session_path)
    expect(page).to have_link("sign up", href: new_user_registration_path)
  end
end
