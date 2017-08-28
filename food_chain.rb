module BookKeeping
  VERSION = 2
end

class Animal
  attr :name, :prey, :action, :comment

  def initialize(name: '', prey: nil, comment: nil, act: '')
    @name = name
    @prey = prey
    @comment = comment
    @action = act
  end

  def to_s
    @name
  end
end

class FoodChain

  def self.intro(animal)
    "I know an old lady who swallowed a #{animal.to_s}."
  end

  def self.refrain
    "\nI don't know why she swallowed the fly. Perhaps she'll die.\n\n"
  end

  def self.chase(animal)
    "She swallowed the #{animal} to catch the #{animal.prey}#{animal.prey.action}."
  end

  def self.sing_about(animal)
    arr = [FoodChain.intro(animal), animal.comment]
    while animal.prey do
      arr << FoodChain.chase(animal)
      animal = animal.prey
    end
    arr.compact.join("\n")
  end

  def self.animals
    fly    = Animal.new(name: 'fly')
    spider = Animal.new(name: 'spider', prey: fly, 
                        comment: "It wriggled and jiggled and tickled inside her.",
                        act: " that wriggled and jiggled and tickled inside her") 
    bird   = Animal.new(name: 'bird',  prey: spider, comment: "How absurd to swallow a bird!") 
    cat    = Animal.new(name: 'cat',   prey: bird, comment: "Imagine that, to swallow a cat!")
    dog    = Animal.new(name: 'dog',   prey: cat,  comment: "What a hog, to swallow a dog!")
    goat   = Animal.new(name: 'goat',  prey: dog,  comment: "Just opened her throat and swallowed a goat!")
    cow    = Animal.new(name: 'cow',   prey: goat, comment: "I don't know how she swallowed a cow!") 
    horse  = Animal.new(name: 'horse', prey: nil,  comment: "She's dead, of course!") 

    [fly, spider, bird, cat, dog, goat, cow, horse] 
  end

  # Sing about each animal
  #   Introduce animal
  #   describe animal
  #   chase animal
  def self.song
    animal_songs = FoodChain.animals.map{ |animal| FoodChain.sing_about(animal) }
    verse = animal_songs.join(FoodChain.refrain)
    verse + "\n"
  end
end
