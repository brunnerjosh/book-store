
CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE `Bookstore`.`users` ( 
	`userId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`firstName` VARCHAR(200) NULL , 
	`lastName` VARCHAR(200) NULL , 
	`email` VARCHAR(200) NULL , 
	`password` VARCHAR(100) NULL , 
	`dob` DATE NULL , 
	PRIMARY KEY (`userId`) ) 
ENGINE = InnoDB;

CREATE TABLE `Bookstore`.`books` ( 
	`bookId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`title` VARCHAR(200) NULL , 
	`author` VARCHAR(200) NULL , 
	`inventoryAmount` INT NULL , 
	`publisher` VARCHAR(200) NULL , 
	`publicationYear` VARCHAR(200) NULL , 
	`category` VARCHAR(200) NULL , 
	`price` DOUBLE NULL , 
	`reviewRating` INT NULL , 
	PRIMARY KEY (`bookId`) ) 
ENGINE = InnoDB;

CREATE TABLE 'transactions'(
	'transactionId' INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	'transactionDate' DATE NULL DEFAULT NULL , 
	'bookId' INT NULL ,
	'userId' INT NULL ,
	'transactionAmount' DOUBLE NULL ,
	PRIMARY KEY ('transactionId', 'userId')
	)
	ENGINE = InnoDB;

 
CREATE TABLE `Bookstore`.`transactions` ( 
	`transactionId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`transactionDate` DATE NULL , 
	`bookId` INT NULL , 
	`userId` INT NULL , 
	`transactionAmount` DOUBLE NULL , 
	PRIMARY KEY (`transactionId`) ) 
ENGINE = InnoDB;
ALTER TABLE `transaction` ADD INDEX(`userId`);
ALTER TABLE `transactions` ADD CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `Bookstore`.`users`(`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `transaction` ADD INDEX(`bookId`);
ALTER TABLE `transactions` ADD CONSTRAINT FOREIGN KEY (`bookId`) REFERENCES `Bookstore`.`books`(`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `Bookstore`.`rating` ( 
	`ratingId` INT UNSIGNED NOT NULL AUTO_INCREMENT , 
	`userId` INT NOT NULL , 
	`bookId` INT NOT NULL , 
	`ratingDate` DATE NOT NULL , 
	`rating` INT NOT NULL , 
	PRIMARY KEY (`ratingId`) ) 
ENGINE = InnoDB;

ALTER TABLE `rating` ADD INDEX(`userId`);
ALTER TABLE `rating` ADD CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `Bookstore`.`users`(`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `rating` ADD INDEX(`bookId`);
ALTER TABLE `rating` ADD CONSTRAINT FOREIGN KEY (`bookId`) REFERENCES `Bookstore`.`books`(`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

