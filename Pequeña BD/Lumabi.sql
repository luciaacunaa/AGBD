CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address_id INTEGER,
email VARCHAR(50),
phone VARCHAR(50),
FOREIGN KEY (address_id) REFERENCES address(address_id));

CREATE TABLE city (
city_id INTEGER PRIMARY KEY AUTOINCREMENT,
city_name VARCHAR(50) NOT NULL);


CREATE TABLE address (
address_id INTEGER PRIMARY KEY AUTOINCREMENT,
city_id INTEGER,
address_name VARCHAR(50),
FOREIGN KEY (city_id) REFERENCES city (city_id));

CREATE TABLE drinks (
drinks_id INTEGER PRIMARY KEY AUTOINCREMENT,
drinks_name VARCHAR(50) NOT NULL
);

CREATE TABLE category (
category_id INTEGER PRIMARY KEY AUTOINCREMENT,
meals_id INTEGER NOT NULL, 
drinks_id INTEGER NOT NULL,
FOREIGN KEY (drinks_id) REFERENCES drinks(drinks_id),
FOREIGN KEY (meals_id) REFERENCES meals(meals_id)
);

CREATE TABLE meals (
meals_id INTEGER PRIMARY KEY AUTOINCREMENT,
meals_name VARCHAR(50) NOT NULL,
price DECIMAL(8,2),
payment_id INTEGER NOT NULL,
FOREIGN KEY(payment_id) REFERENCES payment (payment_id)
);

CREATE TABLE employees(
employees_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
address_id INTEGER NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE metodos_pago(
metodos_id INTEGER PRIMARY KEY AUTOINCREMENT,
pago_name VARCHAR(15) NOT NULL, ---referencio que metodo quiere elegir (mp, tarjeta credito o debito)
employees_id INTEGER NOT NULL,
payment_id INTEGER NOT NULL,
FOREIGN KEY (employees_id) REFERENCES employees(employees_id),
FOREIGN KEY (payment_id) REFERENCES payment(payment_id));


CREATE TABLE payment (
payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
employees_id INTEGER,
customer_id INTEGER NOT NULL,
payment VARCHAR(15),
FOREIGN KEY (employees_id) REFERENCES employees(employees_id)
);

INSERT INTO city (city_name)
VALUES ('Buenos Aires');

INSERT INTO address (address_name, city_id)
VALUES ('Canadá 2454', 1),
('Ordoñez 6537', 1),
('Av. Fernandez de la Cruz 6953',1),
('Troilo 132', 1),
('Madreselva 645', 1),
('Canadá 1720', 1),
('Manuela Garandilla 7891',1),
('Comodoro Ceferino Ramirez 5524', 1),
('Cafayate 5986', 1),
('Chilavert 4870', 1);

INSERT INTO customers (first_name, last_name, address_id, email, phone)
VALUES ('Mary Luz', 'Llusco', 1, 'mary@gmail.com', '1131175565'),
('Lucía', 'Acuña', 3, 'luci@gmail.com', '1141719615'),
('Abril', 'Herbas', 4, 'abril@gmail.com', '1167377704'),
('Rocio', 'Albarracín', 5, 'rocio@gmail.com', '1136118005'),
('Valentín', 'Velazquez', 6, 'valen@gmail.com', '1161138645'),
('Dylan', 'Aragón', 7, 'dylan@gmail.com', '1152603980'),
('Thomás', 'Ávila', 8, 'thomas@gmail.com', '1152297349'),
('Enzo', 'Materazzi', 9, 'enzo@gmail.com', '1123539461'),
('Ayelén', 'Quispe', 10, 'aye@gmail.com', '1140430201'),
('Ariana', 'Villa', 11, 'ari@gmail.com',  '1161929792');

INSERT INTO employees (first_name, last_name, address_id, email)
VALUES ('Federico', 'Villace', 1, 'fede@gmail.com'),
('Tomás', 'Mayorga', 3, 'mayorga@gmail.com'),
('Julián', 'Impelluso', 4, 'impelluso@gmail.com'),
('Andrés', 'Navarro',  5, 'navarro@gmail.com'),
('Mauricio', 'Uribe', 6, 'uribe@gmail.com'),
('Natan', 'Jaibe', 7, 'jaibe@gmail.com'),
('Eduardo', 'Mestrovich', 8, 'mestrovich@gmail.com'),
('Alejandro', 'Salomón', 9, 'salomon@gmail.com'),
('Enrico', 'Roboletti', 10, 'roboletti@gmail.com'),
('Adrián', 'Corvalan', 11, 'corvalan@gmail.com');

INSERT INTO payment (employees_id, customer_id, payment)
VALUES (1, 1, 'Mercado Pago'),
(3, 3, 'Efectivo'),
(4, 4, 'Tarjeta de Crédito'),
(5, 5, 'Tarjeta de Débito'),
(6, 6, 'Tarjeta UALA'),
(7, 7, 'Tarjeta NARANJA');

INSERT INTO meals (meals_name, price, payment_id)
VALUES ('Pastel de papa', 7500, 1),
('Fideos con Bolognesa', 11000, 2),
('Risotto', 9500, 3);
('Milanesa (pollo/carne) a la napolitana', 17000, 4),
('Hamburguesa completa con papas', 15000, 5),
('Empanadas (variedad)', 1200, 6),
('Porción de papas', 5500, 1),
('Pizza Muzzarella', 8000, 2),
('Pizza Fugazzeta', 9500, 3),
('Pizza con jamón y morrón', 9000, 4),
('Burguer Pizza (especial de la casa)', 19000, 5);