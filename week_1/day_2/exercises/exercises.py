import random

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
brand = {
   "name": "Zara",
   "creation_date": 1975 ,
   "creator_name": "Amancio Ortega Gaona",
   "type_of_clothes":  ["men", "women", "children", "home"] ,
   "international_competitors": ["Gap", "H&M", "Benetton" ],
   "number_stores": 7000 ,
   "major_color": {
      "France": "blue", 
      "Spain": "red", 
      "US": ["pink", "green"]
   }
}

brand["number_stores"] = 2
print(brand["type_of_clothes"])
brand["country_creation"]= "Spain"

if "international_competitors" in brand:
   brand["international_competitors"] += ["Desigual"]

del brand["creation_date"]

print(brand["international_competitors"][-1])

print(brand["major_color"]["US"])

print(len(brand))

print(brand.keys())

more_on_zara = {
    "creation_date": 1975,
    "number_stores": 10000
}

brand.update(more_on_zara)
print(brand["number_stores"])
#it is overwritten to 10000

# ------ Exercise 4
def describe_city(city, country = "world") :
   print(city + " is in " + country)


describe_city("rabat")

# ------ Exercise 5
def random_number(number):
    randomnum = random.randint(1,100)
    if number == randomnum:
        print("success message")
    else:
        print("fail message your number is", number , "the random number is" , randomnum)

random_number(1)

# ------ Exercise 6
def make_shirt(size = "l", message= "I love python"):
   print("THE size of the shirt is", size , "and the message is", message) 
   
make_shirt()
make_shirt("l")
make_shirt("xl", "hello Geeks")
make_shirt(message = "Hello world", size="s")

def make_shirt(size = "l", message= "I love python"):
   print("THE size of the shirt is", size , "and the message is", message) 
   
make_shirt()
make_shirt("l")
make_shirt("xl", "hello Geeks")
make_shirt(message = "Hello world", size="s")


# ------ Exercise 7
def get_random_temp(month) :
    if month in [12, 1, 2]:
        return round(random.uniform(-10, 16), 1)
    elif month in [9, 10, 11]:
        return round(random.uniform(16, 23), 1)
    elif month in ["3", "4", "5"]:
        return round(random.uniform(23, 32), 1)
    elif month in ["6", "7", "8"]:  
        return round(random.uniform(32, 40), 1)
    else : 
        return round(random.uniform(-10, 40), 1)

def main() :
   month = input("Enter the month between (1-12): ")
   
   temperature = get_random_temp(month)
   print(f"Temperature is {temperature} degrees Celsius")
   if temperature < 0 :
      print("Brrr, that’s freezing! Wear some extra layers today!")
   elif temperature < 16 :
      print("Quite chilly! Don’t forget your coat")
   elif temperature < 32 :
      print("Nice weather! A light jacket should be enough")
   else :
      print("It’s a beautiful day! Wear sunscreen!")

main()
# ------ Exercise 8

def ask_questions() : 
    data = [
      {
        "question": "What is Baby Yoda's real name?",
        "answer": "Grogu"
      },
      {
        "question": "Where did Obi-Wan take Luke after his birth?",
        "answer": "Tatooine"
      },
      {
        "question": "What year did the first Star Wars movie come out?",
        "answer": "1977"
      },
      {
        "question": "Who built C-3PO?",
        "answer": "Anakin Skywalker"
      },
      {
        "question": "Anakin Skywalker grew up to be who?",
        "answer": "Darth Vader"
      },
      {
          "question": "What species is Chewbacca?",
          "answer": "Wookiee"
      }
   ]

    correct_answers = 0
    incorrect_answers = 0
    for item in data :
        answer = input(item["question"] + " ")
        if answer.lower() == item["answer"].lower():
            print("Correct!")
            correct_answers += 1
        else: 
            print("Incorrect! The correct answer is:", item["answer"])
            incorrect_answers += 1

    print(f"You answered {correct_answers} questions correctly and {incorrect_answers} incorrectly.")


ask_questions()

