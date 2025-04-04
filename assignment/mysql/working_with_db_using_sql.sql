CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(45),
    Zip VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');

SELECT DISTINCT Employee.FirstName, Employee.LastName
FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact ON ContactEmployee.ContactID = Contact.ContactID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';

# (8) Significance of % and _ in the LIKE Statement
# % matches any sequence of characters 
# Exa - WHERE Name LIKE 'shruti%'.
# - '_' matches exactly one character.
# Exa: WHERE Name LIKE 'shruti_vh'.

# (9) Normalization in Databases
# 1NF: Eliminates duplicate columns and ensures each column has atomic values.
# 2NF: Removes partial dependencies.
# 3NF: Removes transitive dependencies.

# (10) = A JOIN in MySQL is used to combine rows from multiple tables based on a related column.

# (11) DDL, DCL, and DML in MySQL
# DDL (Data Definition Language): Defines structures (e.g., CREATE, ALTER, DROP).
# DML (Data Manipulation Language): Modifies data (e.g., INSERT, UPDATE, DELETE).
# DCL (Data Control Language): Controls access (GRANT, REVOKE).

# (12) Role of JOIN Clause and Common Joins
#The JOIN clause is used to fetch related data from multiple tables.
#Common types of joins:
#INNER JOIN: Returns matching records from both tables.
#LEFT JOIN: Returns all records from the left table and matching ones from the right.
#RIGHT JOIN: Returns all records from the right table and matching ones from the left.
#FULL JOIN: Returns all records from both tables (not supported in MySQL but can be done with UNION).

