# Relational Database Design and Development

## Overview

In this project, I designed and developed relational databases with a focus on **normalization** and **table constraints** to ensure data integrity and efficiency. The project includes practical implementations such as a **Dating Database** and an **Employee Database**. Additionally, I gained hands-on experience with database management using **PL/pgSQL**.

## Why This Matters

Effective database design is fundamental for building reliable and scalable applications. This project helped me develop core skills in:

- Structuring databases through normalization to eliminate redundancy  
- Defining and enforcing table constraints (primary keys, foreign keys, unique constraints, etc.)  
- Writing stored procedures and functions using PL/pgSQL for advanced data management  
- Modeling real-world scenarios like dating platforms and employee management systems  

These capabilities enable companies to maintain data accuracy, optimize query performance, and support complex business logic within their database systems.

## Technologies Used

- PostgreSQL  
- PL/pgSQL (Procedural Language/PostgreSQL)  

## Key Features

- Properly normalized database schemas to reduce data anomalies  
- Implementation of table constraints to enforce data integrity  
- Stored procedures and triggers written in PL/pgSQL for automated data handling  
- Sample databases modeling real-world use cases:  
  - Dating Database (user profiles, matches, messages)  
  - Employee Database (employee records, departments, payroll)  

## Getting Started

### Prerequisites

- PostgreSQL installed and running  
- Basic knowledge of SQL and relational database concepts  

### Usage

1. Create the databases and tables using provided SQL scripts.  
2. Apply normalization rules and constraints as defined in the schema.  
3. Use PL/pgSQL scripts to create stored procedures, functions, and triggers.  
4. Perform queries and data manipulations to test database functionality.

## Example

-- Example of table constraint and normalization
CREATE TABLE employees (
employee_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
department_id INT REFERENCES departments(department_id),
UNIQUE (first_name, last_name)
);

-- Example PL/pgSQL function
CREATE OR REPLACE FUNCTION get_employee_count(dept_id INT)
RETURNS INT AS $$
DECLARE
emp_count INT;
BEGIN
SELECT COUNT(*) INTO emp_count FROM employees WHERE department_id = dept_id;
RETURN emp_count;
END;

` ## What I Learned - Designing normalized relational schemas to improve data consistency -
Enforcing data integrity through constraints - Writing procedural code in PL/pgSQL to automate database operations
Modeling complex real-world scenarios within a relational database ## Contributing Contributions and suggestions are welcome!
Feel free to open issues or submit pull requests. ## License This project is licensed under the MIT License.
Developed by Ismail Cisse Building robust and efficient relational databases with PostgreSQL
