import tkinter as tk
from tkinter import messagebox

# List to store books
books = []

# Function to add a book
def add_book():
    title = title_entry.get().strip()
    author = author_entry.get().strip()
    isbn = isbn_entry.get().strip()
    
    if title and author and isbn:
        book = {"title": title, "author": author, "isbn": isbn}
        books.append(book)
        messagebox.showinfo("Success", f"Book '{title}' by {author} added successfully!")
        title_entry.delete(0, tk.END)
        author_entry.delete(0, tk.END)
        isbn_entry.delete(0, tk.END)
        title_entry.focus()  # Set focus back to the title field
    else:
        messagebox.showwarning("Input Error", "Please fill in all fields.")

# Function to search for a book
def search_book():
    search_term = search_entry.get().strip().lower()
    if not search_term:
        messagebox.showwarning("Search Error", "Enter a title or author to search.")
        return

    found_books = [book for book in books if search_term in book["title"].lower() or search_term in book["author"].lower()]
    
    if found_books:
        result_text = "\n".join([f"Title: {b['title']}\nAuthor: {b['author']}\nISBN: {b['isbn']}\n" for b in found_books])
        messagebox.showinfo("Search Results", result_text)
    else:
        messagebox.showinfo("Search Results", "No books found.")

# Create the main window
root = tk.Tk()
root.title("Library Management System")
root.geometry("400x350")

# Add Book Section
add_frame = tk.LabelFrame(root, text="Add a Book", padx=10, pady=10)
add_frame.pack(pady=10, fill="both", expand=True)

tk.Label(add_frame, text="Title:").grid(row=0, column=0, sticky="w")
title_entry = tk.Entry(add_frame, width=30)
title_entry.grid(row=0, column=1, padx=5, pady=5)

tk.Label(add_frame, text="Author:").grid(row=1, column=0, sticky="w")
author_entry = tk.Entry(add_frame, width=30)
author_entry.grid(row=1, column=1, padx=5, pady=5)

tk.Label(add_frame, text="ISBN:").grid(row=2, column=0, sticky="w")
isbn_entry = tk.Entry(add_frame, width=30)
isbn_entry.grid(row=2, column=1, padx=5, pady=5)

add_button = tk.Button(add_frame, text="Add Book", command=add_book)
add_button.grid(row=3, column=0, columnspan=2, pady=10)

# Search Book Section
search_frame = tk.LabelFrame(root, text="Search for a Book", padx=10, pady=10)
search_frame.pack(pady=10, fill="both", expand=True)

tk.Label(search_frame, text="Search by Title/Author:").grid(row=0, column=0, sticky="w")
search_entry = tk.Entry(search_frame, width=30)
search_entry.grid(row=0, column=1, padx=5, pady=5)

search_button = tk.Button(search_frame, text="Search", command=search_book)
search_button.grid(row=1, column=0, columnspan=2, pady=10)

# Exit Button
exit_button = tk.Button(root, text="Exit", command=root.quit)
exit_button.pack(pady=10)

# Run the application
root.mainloop()
