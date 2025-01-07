import random

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
symbols = ['!', '@', '#', '%', '&', '*', '(', ')', '_', '+', '=', '-', '[', ']', '{', '}', '<', '>', '?']
digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

password = []

number_of_letters = 7
number_of_symbols = 7
number_of_digits = 7

for n in range(number_of_letters):
        password.append(random.choice(letters))

for n in range(number_of_symbols):
        password.append(random.choice(symbols))

for n in range(number_of_digits):
        password.append(random.choice(digits))

random.shuffle(password)

print(''.join(password))
