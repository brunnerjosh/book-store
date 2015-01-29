Customers(
	customerId INT NOT NULL,
	password VARCHAR(20),
	firstName VARCHAR(100),
	lastName VARCHAR(100),
	emailAddress VARCHAR(20),

	PRIMARY KEYS(customerId, emailAddress)
);

Books(
	bookId INT NOT NULL,
	productType VARCHAR(100),
	title VARCHAR(100),
	author VARCHAR(100),
	publisher VARCHAR(100),
	publicationDate VARCHAR(100),
	inventoryAmount INT,
	price ,
	reviewRating INT,

	PRIMARY KEYS(bookId, productType, title, author)
);

Transactions(
	transactionId
	transactionType
	transactionDate
	bookId
	
);

Review(

);
