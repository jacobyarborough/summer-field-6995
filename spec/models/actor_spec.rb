require 'rails_helper'

RSpec.describe Actor, type: :model do 
  describe 'relationships' do 
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
  end 

  describe 'class methods' do 
    before(:each) do 
      @harrison = Actor.create!(name: 'Harrison Ford', age: 79)
      @eddie = Actor.create!(name: 'Eddie Murphy', age: 60)
      @cameron = Actor.create!(name: 'Cameron Diaz', age: 49)
      @daniel = Actor.create!(name: 'Daniel Craig', age: 53)
    end 

    describe '.order_by_age_asc' do 
      it 'orders actors table in asc order by age' do 
        expect(Actor.order_by_age_asc).to eq([@cameron, @daniel, @eddie, @harrison])
      end 
    end 

    describe '.avg_age' do 
      it 'returns the average age of the Actors table' do 
        expect(Actor.avg_age).to eq(60.25)
      end 
    end 

    describe '.find_id_by_age' do 
      it 'retuns the id of an Actor instance' do 
        expect(Actor.find_id_by_name(@daniel.name)).to eq(@daniel.id)
      end 
    end 
  end 
end 