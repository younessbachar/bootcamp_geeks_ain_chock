# ------ Challenge 1
number = int(input("Enter a number: "))
lenght = int(input("Enter a lenght: "))
number2 = 0
list = []
    
for i in range(lenght) :
    number2 += number
    list.append(number2)
    
print(list)

# ------ Challenge 2

word = input("Enter a word: ")


result = word[0] if word else ""
for char in word[1:len(word)]:
    if char != result[-1]:
     result += char

print("The new word is: ", result)

