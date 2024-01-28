import os

filename = "count"

def print_hello():
    print("Hello world")

def calc(x, y):
    action = input("Enter an action (+, -, *, /): ")
    if action == "+":
        print(x, "+", y, "=", x + y)
    elif action == "-":
        print(x, "-", y, "=", x - y)
    elif action == "*":
        print(x, "*", y, "=", x * y)
    elif action == "/":
        if y != 0:
            print(x, "/", y, "=", x / y)
        else:
            print("Error: Division by zero")
    else:
        print("Error: Invalid action")

def find_number(filename):
    if not os.path.exists(filename):
        print("Error: File does not exist")
        return

    with open(filename, 'r') as file:
        numbers = file.read().split()
    try:
        numbers = [float(num.strip()) for num in numbers]
        largest_num = max(numbers)
        print("The largest number is:", largest_num)
    except ValueError:
        print("Error: File consists of non-numeric data")

def checklist():
    fruits = ['banana', 'orange', 'apple', 'grape']
    element_to_check = input("Enter a fruit: ")

    if element_to_check in fruits:
        print(f'Yes, the element "{element_to_check}" exists in the fruits list.')
        print(fruits)
    else:
        print('No, the element does not exist in list.')
        print(fruits)

while True:
    print("\nMenu:")
    print("1. Print Hello")
    print("2. Calculator")
    print("3. Find Largest Number")
    print("4. Check Element in List")
    print("5. Exit")

    task = input("Choose a task (1-5): ")
    
    if task == "1":
        print_hello()

    elif task == "2":
        x = float(input("Enter first number: "))
        y = float(input("Enter second number: "))
        calc(x, y)

    elif task == "3":
        find_number(filename)

    elif task == "4":
        checklist()

    elif task == "5":
        print("Exiting program...")
        break

    else:
        print("Invalid choice. Please enter a number between 1 and 5.")
