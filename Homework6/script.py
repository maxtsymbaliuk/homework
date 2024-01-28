task = input("Choose tasks from 1 to 5: ")

def add(x, y):
    return x + y

def minus(x, y):
    return x - y

def devide(x, y):
    if y == 0:
        print("You can't divide by 0...")
    else:
        return x / y

def multiply(x, y):
    return x * y

if task == "1":
    print("Hello world")

elif task == "2":
    number1 = float(input("Enter first number: "))
    number2 = float(input("Enter second number: "))
    action = input("Enter an action (+, -, *, /): ")
    if action == "+":
        print(number1, "+", number2, "=", add(number1, number2))
    elif action == "-":
        print(number1, "-", number2, "=", minus(number1, number2))
    elif action == "*":
        print(number1, "*", number2, "=", multiply(number1, number2))
    elif action == "/":
        devide_result = devide(number1, number2)
        if devide_result is not None:
            print(number1, "/", number2, "=", devide_result)

elif task == "3":
	f = open("count", "r")
	print(f.read())
	
else:
    print("bye")
