CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address_id INTEGER,
email VARCHAR(50),
phone VARCHAR(50)
FOREIGN KEY (address_id) REFERENCES address(address_id))

/*CREATE TABLE city (
city_id
city_name VARCHAR(50) NOT NULL,