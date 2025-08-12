import random
# ------ Exercise 1
spring = [3,4,5]
summer = [6,7,8]
autumn = [9,10,11]
winter = [12,1,2]


inp = int(input("Invalid input. Please enter a number between 1 and 12: "))

while inp < 1 or inp > 12:
    inp = int(input("Invalid input. Please enter a number between 1 and 12: "))
if inp in spring:
  print("Spring")
elif inp in summer:
  print("Summer")
elif inp in autumn:
  print("Autumn")
elif inp in winter:
  print("Winter")

# ------ Exercise 2

for i in range(1, 21):
  print(i)

for i in range(1, 21):
  if i % 2 == 0:
    print(i)

# ------ Exercise 3

name = input("Please enter your name: ")
while name != "youness" :
    name = input("Please enter your name: ")


# ------ Exercise 4

names = ['Samus', 'Cortana', 'V', 'Link', 'Mario', 'Cortana', 'Samus']
input_name = input("Please enter a name: ")
for name in names:
    if input_name == name:
        print(f"The index of {name} is {names.index(name)}")
        break
# ------ Exercise 5

numbers = []

for i in range(0 , 3):
   currentnum = int(input("Please enter a number: "))
   numbers.append(currentnum)

print("The largest number is: ", max(numbers))

# ------ Exercise 6
wins = 0
losses = 0

usernum = int(input("Enter a number: "))
num = random.randint(1, 10)
while True:
    usernum = int(input("Enter a number: "))
    if usernum == num:
     print("Winner")
     wins += 1
    else:
     print("etter luck next time")
     losses += 1
