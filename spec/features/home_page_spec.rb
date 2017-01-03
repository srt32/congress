require 'rails_helper'

describe 'homepage' do
  it 'loads the homepage' do
    visit '/'

    expect(page).to have_content("Congress Today")
  end
end

describe 'about' do
  it 'loads the about page' do
    visit '/'

    click_on "About Us"

    expect(page.current_path).to eq("/about")
    expect(page).to have_content("We are a group of")
  end
end
