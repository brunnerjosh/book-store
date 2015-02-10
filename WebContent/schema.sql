
CREATE DATABASE Bookstore;
USE Bookstore;

	CREATE TABLE `bookstore`.`users` ( 
		`userId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
		`firstName` VARCHAR(200) NULL , 
		`lastName` VARCHAR(200) NULL , 
		`email` VARCHAR(200) NULL , 
		`password` VARCHAR(100) NULL , 
		`dob` DATE NULL , 
		PRIMARY KEY (`userId`) ) ;

CREATE TABLE `bookstore`.`books` ( 
	`bookId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`title` VARCHAR(200) NULL , 
	`author` VARCHAR(200) NULL , 
	`inventoryAmount` INT NULL , 
	`publisher` VARCHAR(200) NULL , 
	`publicationYear` VARCHAR(200) NULL , 
	`category` VARCHAR(200) NULL , 
	`price` DOUBLE NULL , 
	`reviewRating` INT NULL , 
	PRIMARY KEY (`bookId`) ) ;
 
CREATE TABLE `bookstore`.`transactions` ( 
	`transactionId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`transactionDate` DATE NULL , 
	`bookId` INT UNSIGNED NOT NULL , 
	`userId` INT UNSIGNED NOT NULL , 
	`transactionAmount` DOUBLE NULL , 
	PRIMARY KEY (`transactionId`) );

ALTER TABLE `transactions` ADD CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `Bookstore`.`users`(`userId`);
ALTER TABLE `transactions` ADD CONSTRAINT FOREIGN KEY (`bookId`) REFERENCES `Bookstore`.`books`(`bookId`);

CREATE TABLE `bookstore`.`rating` ( 
	`ratingId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`userId` INT UNSIGNED NOT NULL , 
	`bookId` INT UNSIGNED NOT NULL , 
	`ratingDate` DATE NOT NULL , 
	`rating` INT NOT NULL , 
	PRIMARY KEY (`ratingId`) ) ;

ALTER TABLE `rating` ADD CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `Bookstore`.`users`(`userId`);
ALTER TABLE `rating` ADD CONSTRAINT FOREIGN KEY (`bookId`) REFERENCES `Bookstore`.`books`(`bookId`);

