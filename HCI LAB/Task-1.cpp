def cli_calculator():
    print("Welcome to the CLI Calculator!")
    while True:
        command = input("Enter a command (add, subtract, multiply, divide, quit): ").strip().lower()
        if command == "quit":
            print("Exiting the calculator. Goodbye!")
            break
        try:
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
            if command == "add":
                print(f"Result: {num1 + num2}")
            elif command == "subtract":
                print(f"Result: {num1 - num2}")
            elif command == "multiply":
                print(f"Result: {num1 * num2}")
            elif command == "divide":
                print(f"Result: {num1 / num2}")
            else:
                print("Invalid command. Try again.")
        except ValueError:
            print("Invalid input. Please enter numbers.")
        except ZeroDivisionError:
            print("Error: Division by zero.")

cli_calculator()