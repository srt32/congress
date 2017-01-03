require 'rails_helper'

describe 'homepage' do
  it 'loads the homepage' do
    visit '/'

    expect(page).to have_content("Congress Today")
  end
end
