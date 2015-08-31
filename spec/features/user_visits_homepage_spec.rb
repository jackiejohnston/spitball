require "rails_helper"

feature "User visits homepage" do

  scenario "sucessfully" do
    visit root_path
    page { should respond_with 200 }
    expect(page).to have_css('h1', text: 'Welcome')
  end

end