# Short Overview
This is a team project for my web development class at the University of Washington.

1. We’ve implemented a fully functional bookstore according to the specification provided
2. Users may browse, search, view, purchase, and rate books
3. Administrators may alter information on users, books, transactions, and ratings

# Stakeholders
* Users - Customers looking to purchase a book
* Administrators - Users with the ability to make system-level changes to the relation model’s data
* Investors - People looking to have financial interest in Quest
* Authors - The people that will write books to be hosted for sale on Quest’s online bookstore
* Publishers - The “gate-keeper” that makes sure that we are only showing well-written books

# Assumptions
1. All users have admin-level access to the system
2. No users have malicious intent while using system
3. System has been tested to work on the latest version of Google Chrome running on Mac OS X
4. The system cannot accept actual payments from users

# Data Interactions
* Users & Transactions - Each unique user can have zero or many transactions. This type of activity indicates the user purchase of a book and a sale for the book store. The userId is placed into the transaction record.
* Users & Rating - Each unique user can have zero or many ratings. This type of activity indicates a user rated a book. The userId is placed into the rating record.
* Books & Transactions - Each unique book can have zero or many transactions for a book. When a user purchases a book, the bookId is placed into the transaction record.
* Books & Rating - Each unique book can have zero or many ratings. When a user rates a book, the bookId is placed in the rating record.

# Graphical Schema
![Graphical Schema](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/schema.png)

# Limitations
* No differentiation between users and administrators
* Not accessible on devices other than desktop computers
* System does not take cards for purchases
* Book covers need to be added after a book is created
* No password recovery service
* Users cannot add a profile photo
* When a user makes changes to their account, the must sign out in order for those changes to take effect

# Improvements
* Implement all changes to address limitations mentioned in previous slide
* Add graphs to visualize analytics information
* Add a responsive design allowing users to view and browse Quest on mobile and tablet devices
* Make the user, books, transactions, and ratings pages look nicer and more helpful
* An updated styling done in CSS

# Screenshots
## Landing Page
![Landing Page](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/welcome.png)
## Browse Books
![Browse Books](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/browse-books.png)
## Book Detail
![Book Detail](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/book-detail.png)
## Checkout Page
![Checkout Page](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/checkout-page.png)
## User Profile
![User Profile](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/user-profile.png)
## Admin Dashboard
![Admin Dashboard](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/admin-dashboard.png)
## Top 10 Best Sellers
![Top 10 Best Sellers](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/top-10.png)
## Top 5 Best Sellers (By Category)
![Top 5 Best Sellers (By Category)](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/top-5.png)
## Top 20 Rated Books
![Top 20 Rated Books](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/top-20.png)
## View Transactions By Price
![View Transactions By Price](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/transactions-price.png)
## Sales Stats
![Sales Stats](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/sales-stats.png)
## Direct Market Data (By Category)
![Direct Market Data (By Category)](https://raw.githubusercontent.com/brunnerjosh/book-store/master/images/market-data.png)
