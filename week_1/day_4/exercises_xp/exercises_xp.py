from functools import reduce

# ------ Exercise 1

class Pets():
    def __init__(self, animals):
        self.animals = animals

    def walk(self):
        for animal in self.animals:
            print(animal.walk())

class Cat():
    is_lazy = True

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def walk(self):
        return f'{self.name} is just walking around'

class Bengal(Cat):
    def sing(self, sounds):
        return f'{sounds}'

class Chartreux(Cat):
    def sing(self, sounds):
        return f'{sounds}'


class Siamese(Cat):
    def sing(self, sounds):
        return f'{sounds}'

cat1 = Bengal("mimi",3)
cat2 = Chartreux("chifo",4)
cat3 = Siamese("ili",2)

all_cats = [cat1,cat2,cat3]

sara_pets = Pets(all_cats)

sara_pets.walk()

# ------ Exercise 2

class Dog():

    def __init__(self,name,age,weight):
        self.name = name
        self.age = age
        self.weight = weight
        self.code = 10

    def bark(self):
        return f"{self.name} is barking"
    
    def run_speed(self):
        return float(self.weight / (self.age * 10))
    
    def fight(self, other_dog):
        return f"The dog {self.name if self.run_speed() > other_dog.run_speed() else other_dog.name} is the winner."

# ------ Exercise 3

#dog_file.py 

# ------ Exercise 4

class Family:
    
    def __init__(self, members, last_name):
        self.members = members
        self.last_name = last_name

    def born(self,**kwargs):
        self.members.append(kwargs)

    def is_18(self, name):
        for member in self.members:
            if member["name"] == name:
                return True if member["age"] >= 18 else False
            
        return "don't find this member"

    def family_presentation(self):
        print(f"The family's last name is {self.last_name}")
        for member in self.members:
            print(f"Name : {member["name"]}")
            print(f"Age : {member["age"]}")
            print(f"Gender : {member["gender"]}")
            print(f"Is child : {member["is_child"]}")
            print("####################################")

a_family = Family(    [
        {'name':'Michael','age':35,'gender':'Male','is_child':False},
        {'name':'Sarah','age':32,'gender':'Female','is_child':False}
    ],"jack")


# ------ Exercise 5

class TheIncredibles(Family):
    def __init__(self, members, last_name):
        super().__init__(members, last_name)

    def use_power(self):
        return f"{self.incredible_name} is using {self.power} power" if self.is_18(self.incredible_name) else "This member is not 18 years old, so they cannot use their power."

    def incredible_presentation(self):
        print("*Here is our powerful family **")
        print(f"The family's last name is {self.last_name}")
        for member in self.members:
            print(f"name : {member['name']}")
            print(f"age : {member['age']}")
            print(f"gender : {member['gender']}")
            print(f"is child : {member['is_child']}")
            print("####################################")

incredibles = TheIncredibles(
    members=[
        {'name':'Michael','age':35,'gender':'Male','is_child':False,'power': 'fly','incredible_name':'MikeFly'},
        {'name':'Sarah','age':32,'gender':'Female','is_child':False,'power': 'read minds','incredible_name':'SuperWoman'}
    ],
    last_name="Par",
)

incredibles.incredible_presentation()

incredibles.born(name='Jack', age=5, gender='Male', is_child=True, power='“Unknown Power')

incredibles.family_presentation()
