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

USE Bookstore;
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

USE Bookstore;
CREATE TABLE `Bookstore`.`transactions` (
	`transactionId` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	`transactionDate` DATE NULL ,
	`bookId` INT UNSIGNED NULL ,
	`userId` INT UNSIGNED NULL ,
	`transactionAmount` DOUBLE NULL ,
	PRIMARY KEY (`transactionId`) )
ENGINE = InnoDB;

USE Bookstore;
ALTER TABLE `transactions` ADD INDEX(`userId`);
ALTER TABLE `transactions` ADD CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `Bookstore`.`users`(`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `transactions` ADD INDEX(`bookId`);
ALTER TABLE `transactions` ADD CONSTRAINT FOREIGN KEY (`bookId`) REFERENCES `Bookstore`.`books`(`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

USE Bookstore;
CREATE TABLE `Bookstore`.`rating` (
	`ratingId` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
	`userId` INT UNSIGNED NOT NULL ,
	`bookId` INT UNSIGNED NOT NULL ,
	`ratingDate` DATE NOT NULL ,
	`rating` INT NOT NULL ,
	PRIMARY KEY (`ratingId`) )
ENGINE = InnoDB;

USE Bookstore;
ALTER TABLE `rating` ADD INDEX(`userId`);
ALTER TABLE `rating` ADD CONSTRAINT FOREIGN KEY (`userId`) REFERENCES `Bookstore`.`users`(`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `rating` ADD INDEX(`bookId`);
ALTER TABLE `rating` ADD CONSTRAINT FOREIGN KEY (`bookId`) REFERENCES `Bookstore`.`books`(`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ADDITIONS TO SQL FILE: initial
ALTER TABLE `Bookstore`.`books`
ADD COLUMN `photo` BLOB NULL AFTER `reviewRating`;

-- FURTHER ADDITIONS: 2/21/2015 @ 7:54pm
ALTER TABLE `Bookstore`.`transactions`
ADD COLUMN `sharedTransID` INT(10) NULL DEFAULT NULL AFTER `transactionId`;
