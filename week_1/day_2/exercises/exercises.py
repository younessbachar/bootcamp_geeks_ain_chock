# ------ Exercise 1
dic2={
    "ten": 10,
    "twenty": 20,
    "thirty": 30
}

print(dic2)
# ------ Exercise 2
#1# rick: 15$ beth: 15$,  morty: 5, summer: 8
#2# total is 50$
#3#
family = {}
while True:
    name = input("Enter family member or 'Exit' to stop: ")
    if name.lower() == "exit" :
      break
    age = input(f"Enter {name}'s age: ")
    family[name] = int(age)
  

    print("\nFamily members and their ages:")
    for name, age in family.items():
      print(f"{name}: {age} years old")

# ------ Exercise 3

# ------ Exercise 4

# ------ Exercise 5

# ------ Exercise 6

# ------ Exercise 7

# ------ Exercise 8
