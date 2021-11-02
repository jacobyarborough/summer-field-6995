# Studios
universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
mgm = Studio.create!(name: 'MGM', location: 'Los Angeles')
wb = Studio.create!(name: 'Warner Brothers', location: 'Hollywood')

# Movies 
ark = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
shrek = universal.movies.create!(title: 'Shrek', creation_year: 2000, genre: 'Comedy')

spectre = mgm.movies.create!(title: 'Spectre', creation_year: 2015, genre: 'Action/Adventure')
af = mgm.movies.create!(title: 'Adams Family', creation_year: 2019, genre: 'Comedy')

dune = wb.movies.create!(title: 'Dune', creation_year: 2021, genre: 'Action/Adventure')
hp = wb.movies.create!(title: "Harry Potter and the Sorcerer's Stone", creation_year: 2001, genre: 'Fantasy')

# Actors
harrison = Actor.create!(name: 'Harrison Ford', age: 79)
eddie = Actor.create!(name: 'Eddie Murphy', age: 60)
cameron = Actor.create!(name: 'Cameron Diaz', age: 49)
daniel = Actor.create!(name: 'Daniel Craig', age: 53)
naomie = Actor.create!(name: 'Naomie Harris', age: 45)
oscar = Actor.create!(name: 'Oscar Isaac', age: 42)
charlize = Actor.create!(name: 'Charlize Theron', age: 46)
timothee = Actor.create!(name: 'Timothee Chalamet', age: 25)
harrison = Actor.create!(name: 'Harrison Ford', age: 79)
zendaya = Actor.create!(name: 'Zendaya Maree Stoermer Coleman', age: 25)
emma = Actor.create!(name: 'Emma Watson', age: 31)
rupert = Actor.create!(name: 'Rupert Grint', age: 33)

# MovieActors associations
ark.actors << harrison 
ark.actors << eddie

shrek.actors << eddie 
shrek.actors << cameron
shrek.actors << charlize

spectre.actors << daniel 
spectre.actors << naomie 
spectre.actors << rupert

af.actors << oscar 
af.actors << charlize 
af.actors << harrison

dune.actors << timothee 
dune.actors << zendaya 
dune.actors << eddie

hp.actors << emma 
hp.actors << rupert 
hp.actors << oscar 
