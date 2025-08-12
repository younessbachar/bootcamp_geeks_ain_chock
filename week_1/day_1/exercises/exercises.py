# ------ Exercise 1

print("hello world")
print("hello world")
print("hello world")
print("hello world")

# ------ Exercise 2

result = (99 ** 3) * 8

print(result)


# ------ Exercise 3

inp = input("Enter your name: ")

print("Hello, "+ inp)

# ------ Exercise 4

height = int(input("Enter your height in metres : "))

if height > 145 :
  print("you are tall enough to ride")
else:
  print("you are not tall enough to ride")


# ------ Exercise 5

My_fav_numbers = {6,45,30,15,7,4}
Friend_fav_numbers = {8,0,45,67,2,1}

My_fav_numbers.add(3)
My_fav_numbers.add(9)
My_fav_numbers.remove(9)
print(My_fav_numbers)


conc = My_fav_numbers.union(Friend_fav_numbers)
print(conc)


# ------ Exercise 6

#(yes because it is a inmutable)

# ------ Exercise 7

basket = ["Banana", "Apples", "Oranges", "Blueberries"]
basket.remove("Banana")
basket.remove("Blueberries")
basket.append("kiwi")
basket.append("Apples")

x = basket.count("Apples")

basket.clear()

print(basket)

# ------ Exercise 8

sandwich_orders = ["Tuna sandwich", "Pastrami sandwich", "Avocado sandwich", "Pastrami sandwich", "Egg sandwich", "Chicken sandwich", "Pastrami sandwich"]

while "Pastrami sandwich" in sandwich_orders:
    sandwich_orders.remove("Pastrami sandwich")

fineshed_sandwiches = []

while sandwich_orders:
    current_sandwich = sandwich_orders.pop()
    fineshed_sandwiches.append(current_sandwich)

      

print(fineshed_sandwiches)


