require 'rails_helper'

RSpec.describe 'the movies show page' do 
  before(:each) do 
    @wb = Studio.create!(name: 'Warner Brothers', location: 'Hollywood')
    @dune = @wb.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Action/Adventure')
    @eddie = Actor.create!(name: 'Eddie Murphy', age: 60)
    @timothee = Actor.create!(name: 'Timothee Chalamet', age: 25)
    @zendaya = Actor.create!(name: 'Zendaya Maree Stoermer Coleman', age: 24)
    @emma = Actor.create!(name: 'Emma Watson', age: 31)
    @dune.actors << @timothee 
    @dune.actors << @zendaya 
    @dune.actors << @eddie
  end 

  it 'shows a movie, its attributes, actors in desc order by age, and actors average age' do 
    visit "/movies/#{@dune.id}"

    expect(current_path).to eq("/movies/#{@dune.id}")
    expect(page).to have_content(@dune.title)
    expect(page).to have_content(@dune.creation_year)
    expect(page).to have_content(@dune.genre)
    expect(@zendaya.name).to appear_before(@timothee.name)
    expect(@timothee.name).to appear_before(@eddie.name)
    expect(page).not_to have_content(@emma.name)
    expect(page).to have_content("Average Age of Actors: 36.33")
  end 

  it 'allows a user to add an existing actor to the movie' do 
    visit "/movies/#{@dune.id}"

    expect(current_path).to eq("/movies/#{@dune.id}")
    within "#add_actor" do 
      fill_in 'Actor Name:', with: 'Emma Watson'
      click_button 'Add Actor'
    end 

    expect(current_path).to eq("/movies/#{@dune.id}")
    expect(page).to have_content(@emma.name)
  end 
end 