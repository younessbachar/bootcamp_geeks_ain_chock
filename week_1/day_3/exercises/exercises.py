# ------ Exercise 1
class Cat:
    def __init__(self, cat_name, cat_age):
        self.name = cat_name
        self.age = cat_age


mimi = Cat("Mimi", 3)
linda = Cat("Linda", 5)
rex = Cat("Rex", 2)

def oldest_cat(*cats):
    return max(cats, key = lambda cat: cat.age)

oldest = oldest_cat(mimi, linda, rex)
print(f"The oldest cat is {oldest.name}, and is {oldest.age} years old.")
# ------ Exercise 2
class Dog :
     def __init__(self, dog_name, dog_height):
         self.name = dog_name
         self.height = dog_height
     def bark(self):
          print(f"{self.name} says Woof!")
     def jump(self) :
          print(f"{self.name} jumps {self.height * 2} cm high!")

rex = Dog("Rex", 50)
rex.bark()
rex.jump()

sarah_dog = Dog("Teacup", 20)
sarah_dog.bark()
sarah_dog.jump()

if rex.height > sarah_dog.height:
     print(f"{rex.name} is bigger than {sarah_dog.name}")
else :
     print(f"{sarah_dog.name} is bigger than {rex.name}")
# ------ Exercise 3
class Song:
     def __init__(self, lyrics):
          self.lyrics =  lyrics

     def sing_me_a_song (self):
          for line in self.lyrics:
               print(line)
stairway = Song([
    "There’s a lady who's sure",
    "all that glitters is gold",
    "and she’s buying a stairway to heaven"
])
      
stairway.sing_me_a_song()
# ------ Exercise 4
class Zoo:
     def __init__ (self, zoo_name):
          self.name = zoo_name
          self.animals = []
     def add_animal(self, new_animal) :
          if new_animal not in self.animals:
               self.animals.append(new_animal)
     def get_animals(self) :
          print(f"Animals in the {self.name} zoo are {self.animals}:")
     def sell_animal(self, animal_sold):
          if animal_sold in self.animals:
               self.animals.remove(animal_sold)
               print(f"{animal_sold} has been sold.")
          else:
               print(f"{animal_sold} is not in the zoo.")
     def sort_animals(self):
          self.animals.sort()
          print(f"Animals sorted: {self.animals}")
     def get_group(self):
          print(f"Animals in the group: {self.animals}")
     
     
          
new_york_zoo = Zoo("New York")
new_york_zoo.add_animal("Lion")
new_york_zoo.add_animal("Tiger")
new_york_zoo.add_animal("Bear")
new_york_zoo.get_animals()
new_york_zoo.sell_animal("Tiger")
new_york_zoo.get_animals()
new_york_zoo.sort_animals()
new_york_zoo.get_group()
          
      
# ------ Exercise 5

# ------ Exercise 6

# ------ Exercise 7

# ------ Exercise 8
