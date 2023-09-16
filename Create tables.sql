--DROP TABLE readers, publishing_houses, books, issued_books;

create table if not exists  readers(
	reader_id serial PRIMARY KEY,
	readername VARCHAR ( 255 ) NOT NULL,
	adress VARCHAR ( 255 ) NOT NULL,
	phone char( 20 ) NOT NULL 
);
create table if not exists  publishing_houses(
	publishing_house_id serial PRIMARY KEY,
	publishing_house_name  VARCHAR ( 255 ) NOT NULL,
	city VARCHAR(255) NOT NULL
);
create table if not exists  books(
	book_id VARCHAR ( 255 ) PRIMARY KEY,
	bookname  VARCHAR ( 255 ) NOT NULL,
	author VARCHAR(255) NOT NULL,
	year_of_publishing date NOT NULL,
	pages bigint,
	price bigint,
	amount bigint,
	publishing_house_id bigint,
	FOREIGN KEY(publishing_house_id) REFERENCES publishing_houses(publishing_house_id) ON DELETE CASCADE
);
create table if not exists  issued_books(
	index_number serial PRIMARY KEY,
	reader_id bigint,
	book_id VARCHAR ( 255 ),
	year_of_publishing date NOT NULL,
	date_issue date,
	date_return date,
	FOREIGN KEY(reader_id) REFERENCES readers(reader_id) ON DELETE CASCADE,
	FOREIGN KEY(book_id) REFERENCES books(book_id) ON DELETE CASCADE
);