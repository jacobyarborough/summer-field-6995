require 'rails_helper'

RSpec.describe 'the studios index page' do 
  before(:each) do 
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @mgm = Studio.create!(name: 'MGM', location: 'Los Angeles')
    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')
    @spectre = @mgm.movies.create!(title: 'Spectre', creation_year: 2015, genre: 'Action/Adventure')
    @af = @mgm.movies.create!(title: 'Adams Family', creation_year: 2019, genre: 'Comedy')
  end 

  it 'shows a list of all studios, their attributes, and its movies' do 
    visit "/studios"

    expect(current_path).to eq("/studios")
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@universal.location)
    expect(page).to have_content(@ark.title)
    expect(page).to have_content(@shrek.title)
    expect(page).to have_content(@mgm.name)
    expect(page).to have_content(@mgm.location)
    expect(page).to have_content(@ark.title)
    expect(page).to have_content(@shrek.title)
  end 
end 