CREATE DATABASE donhang;
USE donhang;

CREATE TABLE produclines (
	productLine VARCHAR(255) PRIMARY KEY,
    textDescription VARCHAR(255),
    htmlDescription VARCHAR (255),
    image VARCHAR (255)
);

CREATE TABLE products (
	productCode INT(10) AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(255),
    productLine VARCHAR(255),
    productScale VARCHAR(255),
    productVendor VARCHAR(255),
    productDescription VARCHAR(255),
    quantityInStock INT,
    buyPrice DECIMAL (8, 2) DEFAULT NULL,
    MSRP VARCHAR(255),
    FOREIGN KEY (productLine) REFERENCES produclines (productLine) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE offices (
	officeCode INT(10) AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255),
    phone VARCHAR(255),
    addressLine1 VARCHAR(255),
    addressLine2 VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    postalCode INT,
    territory VARCHAR(255)
);

CREATE TABLE employees (
	employeeNumber INT (10) AUTO_INCREMENT PRIMARY KEY,
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    extension VARCHAR(255),
    email VARCHAR(255),
    officeCode INT (10),
    reportsTo INT (10),
    jobTitle VARCHAR(255),
--     FOREIGN KEY (employeeNumber) REFERENCES employees (employeeNumber) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (officeCode) REFERENCES offices (officeCode) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE customers (
	customerNumber INT(10) AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(255),
    contractLastName VARCHAR(255),
    contractFirstName VARCHAR(255),
    phone INT(11),
    addressLine1 VARCHAR(255),
    addressLine2 VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postalCode INT(10),
    country VARCHAR(255),
    salesRepEmployeeNumber INT(10),
    creditLimit INT(10),
     FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE payments (
	customerNumber INT(10),
    checkNumber INT,
    paymentDate DATE,
    amount INT,
    PRIMARY KEY (customerNumber, checkNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE orders (
	orderNumber INT(10) AUTO_INCREMENT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE DEFAULT NULL,
    shippedDate DATE DEFAULT NULL,
    `status` VARCHAR(255),
    comments VARCHAR(255),
    customerNumber INT(10),
    FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE orderdetails (
	orderNumber INT(10),
    productCode INT(10),
    quantityOrdered INT,
    priceEach DECIMAL (8, 2) DEFAULT NULL,
    orderLineNumber INT,
    PRIMARY KEY (orderNumber, productCode),
    FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (productCode) REFERENCES products (productCode) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO produclines (productLine, textDescription, htmlDescription, image) 
VALUES ('Phone', 'New', '', 'https://guide-images.cdn.ifixit.com/igi/o4OjCNmNeOhvsS1P.medium'),
	   ('Television', 'New', '', 'https://dictionary.cambridge.org/vi/images/thumb/televi_noun_002_37599.jpg?version=5.0.295'),
       ('Camera', 'New', '', 'https://guide-images.cdn.ifixit.com/igi/o4OjCNmNeOhvsS1P.mediumhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRk_Y86MEqFmVEkZRHV0zN-crF0ZUvbV302g&usqp=CAU'),
       ('Laptop', 'New', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX4oOlfeg37-w0mR4TFjpO14o_LpwPWvXYjw&usqp=CAU'),
       ('Smart watch', 'New', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLxKpSkqSXas0WsUqONl6oolGF6T1_dAuABQ&usqp=CAU');
       
INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)       
VALUES (1, 'Samsung Galaxy S23 Ultra', 'Phone', '', '', '5G 256GB', 50, 319900, ''),
	   (2, 'Oppo A77s', 'Phone', '', '', '8GB-128GB', 50, 60900, ''),
       (3, 'Samsung Smart TV QLED', 'Television', '', '', '55 inch', 10, 152000, ''),
       (4, 'LG Smart TV NanoCell', 'Television', '', '', '55 inch', 10, 176500, ''),
       (5, 'Sony ILCE', 'Camera', '', '', '5000L Black', 10, 67400, ''),
       (6, 'Asus TUF Gaming', 'Laptop', '', '', '15.6 inch', 10, 159900, ''),
       (7, 'Lenovo Gaming IdeaPad3', 'Laptop', '', '', '15.6 inch', 10, 229900, ''),
       (8, 'Apple Watch Ultra', 'Smart watch', '', '', '1.92 inch', 20, 199900, ''),
       (9, 'Samsung Galaxy Watch5', 'Smart watch', '', '', '1.2 inch', 20, 54900, ''),
       (10, 'Iphone 14 Pro Max', 'Phone', '', '', '1TB', 10, 414900, '');
       
INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUES (1, 'Da Nang', '0236111111', '369 Nguyen Tri Phuong', '912 Ton Duc Thang', '', 'VietNam', 0, 'VietNam'),
	   (2, 'Da Nang', '0236222222', '318 Le Duan', '206 Nguyen Tri Phuong', '', 'VietNam', 0, 'VietNam'),
       (3, 'Da Nang', '0236333333', '351 Nguyen Huu Tho', '210 Nguyen Tri Phuong', '', 'VietNam', 0, 'VietNam');
       
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES (1, 'Steven', 'King', '', 'steven.king@sqltutorial.org', '1', 0, 'Public Accountant'),
	   (2, 'Neena', 'Kochhar', '', 'neena.kochhar@sqltutorial.org', '1', 0, 'Accounting Manager'),
       (3, 'Lex', 'De Haan', '', 'lex.de haan@sqltutorial.org', '2', 0, 'Marketing Representative'),
       (4, 'Alexander', 'Hunold', '', 'alexander.hunold@sqltutorial.org', '3', 0, 'Purchasing Manager'),
       (5, 'Bruce', 'Ernst', '', 'bruce.ernst@sqltutorial.org', '3', 0, 'Sales Manager');
       
INSERT INTO customers (customerNumber, customerName, contractLastName, contractFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES (1, 'David Austin', 'Austin', 'David', '0905111111', '111 Nguyen Van Linh', '', 'Da Nang', '', 0, 'Viet Nam', '1', 0),   
	   (2, 'Valli Pataballa', 'Pataballa', 'Valli', '0905222222', '112 Nguyen Tri Phuong', '', 'Da Nang', '', 0, 'Viet Nam', '1', 0),       
       (3, 'Diana Lorentz', 'Lorentz', 'Diana', '0905333333', '113 Le Duan', '', 'Da Nang', '', 0, 'Viet Nam', '2', 0),       
       (4, 'Nancy Greenberg', 'Greenberg', 'Nancy', '0905444444', '114 Nguyen Huu Tho', '', 'Da Nang', '', 0, 'Viet Nam', '4', 0),       
       (5, 'Daniel Faviet', 'Faviet', 'Daniel', '0905555555', '115 Ngo Quyen', '', 'Da Nang', '', 0, 'Viet Nam', '4', 0);
       
INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)    
VALUES (1, 0, '2022-12-25', 319900), 
	   (3, 0, '2023-02-11', 229900), 
       (5, 0, '2022-01-12', 109800);
       
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, comments, customerNumber)
VALUES (1, '2022-12-20', '2022-12-20', '2022-12-25', 'Da thanh toan', 'Good', '1'), 
	   (2, '2023-02-10', '2023-02-10', '2023-02-11', 'Da thanh toan', 'Good', '3'), 
       (3, '2022-01-12', '2022-01-12', '2022-01-12', 'Chua thanh toan', 'Good', '5');
       
INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (1, 1, 1, 319900, 0),    
	   (2, 7, 1, 229900, 0),   
       (3, 9, 2, 109800, 0);
       
SELECT lastname FROM employees;    

SELECT lastname, firstname, jobTitle FROM employees;   

SELECT * FROM customers;

SELECT * FROM customers WHERE salesRepEmployeeNumber = 1;

UPDATE customers SET salesRepEmployeeNumber = 1 WHERE salesRepEmployeeNumber = 4;

DELETE FROM employees WHERE officeCode = 1;

DELETE FROM employees;

DELETE FROM customers ORDER BY customername LIMIT 10;
