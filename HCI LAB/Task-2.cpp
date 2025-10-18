def cli_book_manager():
    print("Welcome to the Book Manager!")

    while True:
        command = input("Enter a command (book, quit): ").strip().lower()

        if command == "quit":
            print("Exiting the Book Manager. Goodbye!")
            break

        if command == "book":
            author = input("Enter book author name: ").strip()
            title = input("Enter book title: ").strip()
            isbn = input("Enter book ISBN: ").strip()
            print("\nBook Information:")
            print(f"Author: {author}")
            print(f"Title: {title}")
            print(f"ISBN: {isbn}\n")
        else:
            print("Invalid command. Try again.")

cli_book_manager()