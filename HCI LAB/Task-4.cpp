#include <iostream>
#include <string>

using namespace std;

// Function to add a book
void addBook(string &title, string &author, string &isbn) {
    cout << "\nEnter Book Title: ";
    cin.ignore();
    getline(cin, title);
    
    cout << "Enter Author Name: ";
    getline(cin, author);
    
    cout << "Enter ISBN: ";
    getline(cin, isbn);
    
    cout << "\nBook added successfully!\n";
}

// Function to search for a book
void searchBook(const string &title, const string &author) {
    string query;
    cout << "\nEnter title or author to search: ";
    cin.ignore();
    getline(cin, query);
    
    if (title.find(query) != string::npos || author.find(query) != string::npos) {
        cout << "\nBook Found:\n";
        cout << "Title: " << title << "\nAuthor: " << author << "\n";
    } else {
        cout << "\nNo matching books found.\n";
    }
}

int main() {
    string title, author, isbn;
    int choice;
    
    do {
        cout << "\n====== Library Management System ======\n";
        cout << "1. Add a Book\n";
        cout << "2. Search for a Book\n";
        cout << "3. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
            case 1:
                addBook(title, author, isbn);
                break;
            case 2:
                searchBook(title, author);
                break;
            case 3:
                cout << "\nExiting the program...\n";
                break;
            default:
                cout << "\nInvalid choice. Please try again.\n";
        }
    } while (choice != 3);
    
    return 0;
}
