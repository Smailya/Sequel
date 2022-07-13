--------------------------------------------------------------
-- Practical SQL: A Beginner's Guide to Storytelling with Data
-- by Anthony DeBarros

-- Chapter 1 Code Examples
--------------------------------------------------------------

-- Listing 1-1: Creating a database named analysis

CREATE DATABASE analysis;

-- Listing 1-2: Creating a table named teachers with six columns

CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

-- This command will remove (drop) the table.
-- DROP TABLE teachers;

-- Listing 1-3 Inserting data into the teachers table

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

----Try it yourself 

CREATE DATABASE analysis

CREATE TABLE animal( id bigserial, name varchar(10), species varchar(10), age integer);
CREATE TABLE specific(origine varchar(10), sex integer);


-- inserting the values

INSERT INTO animal(name, species, age)
                 VALUES (crocodile, macroco, 5),
                   (lion, lanissi, 3),
                   (monkey, keymon, 1);


--omiting the coma to generate error

INSERT INTO specific(origine, sex)
VALUES(south africa, male),
      (congo, female)
      (mali, male);

-- the error message is, 