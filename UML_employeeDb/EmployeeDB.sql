-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."OvertimeHours"
(
    overtime_id bigserial NOT NULL,
    overtime_hours numeric(15, 2),
    PRIMARY KEY (overtime_id)
);

--Inserting into OvertimeHours
INSERT INTO "OvertimeHours" (overtime_hours)
VALUES(2.3),
       (1.5 ),
       ( 7.6),
       ( 8.1),
       (10.0);

CREATE TABLE IF NOT EXISTS public."Salaries"
(
    salary_id bigserial NOT NULL,
    salary_pa numeric(10, 2),
    PRIMARY KEY (salary_id)
);
--Inserting into Salaries
INSERT INTO "Salaries" (Salary_pa)
VALUES(95000.56),
       (83000.32  ),
       ( 62500.78),
       ( 59300.23),
       (41000.67);



CREATE TABLE IF NOT EXISTS public."Roles"
(
    role_id bigserial NOT NULL,
    role character varying(50) NOT NULL,
    PRIMARY KEY (role_id)
);
--Inserting into roles
INSERT INTO "Roles" (role)
VALUES('General_Manager'),
       ('Manager'),
       ('Team_Leader'),
       ('Service_Desk'),
       ('Support');


CREATE TABLE IF NOT EXISTS public."Department"
(
    depart_id bigserial NOT NULL,
    depart_name character varying(50) NOT NULL,
    depart_city character varying(50) NOT NULL,
    PRIMARY KEY (depart_id)
);

-- inserting into department
INSERT INTO "Department" (depart_name, depart_city)
VALUES
    ('Tax', 'Atlanta'),
    ('IT', 'Boston'),
    ('Sales', 'Boston'),
    ('Tax', 'Boston'),
    ('IT', 'New York');


CREATE TABLE IF NOT EXISTS public."Employee"
(
    emp_id bigserial NOT NULL,
    first_name character varying(50),
    surname character varying(50),
    gender character(1) NOT NULL CHECK (gender IN('M','F')),
    address character varying(100),
    email character varying(50),
    depart_id bigint NOT NULL,
    role_id bigint NOT NULL,
    salary_id bigint NOT NULL,
    overtime_id bigint NOT NULL,
    PRIMARY KEY (emp_id)
);
INSERT INTO "Employee" (first_name,surname,gender,address, email , depart_id, role_id,salary_id, overtime_id)
VALUES  ('Lee', 'Smith', 'M','_34_Grand_avenue_mall', 'Lee@gmail.com', 2, 2, 2,2);
    ('Nancy', 'Jones', 'F','12_Avenue_rock', 'nancy@gmail.com', 1, 1, 1,1),
    ('Lee', 'Smith', 'M','_34_Grand_avenue_mall', 'Lee@gmail.com', 2, 2, 2,2),
    ('Soo', 'Nguyen', 'M','Blue_street_fall_1', 'soo@gmail.com', 3, 3, 3,3),
    ('Janet', 'King', 'F','67_William_street', 'Janet@gmail.com', 4, 4, 4,4),
     ('John', 'King', 'M','67_William_street', 'John@gmail.com', 5, 5, 5,5);



ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY (depart_id)
    REFERENCES public."Department" (depart_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY (role_id)
    REFERENCES public."Roles" (role_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY (salary_id)
    REFERENCES public."Salaries" (salary_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY (overtime_id)
    REFERENCES public."OvertimeHours" (overtime_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
    
----------Displaying values:
SELECT * FROM "Employee";
SELECT * FROM "Roles";
SELECT * FROM "Department";
SELECT * FROM "Salaries";
SELECT * FROM "OvertimeHours";

SELECT
e.first_name,
e.surname,
e.gender,
e.address,
e.email,
d.depart_name,
r.role,
s.salary_pa,
o.overtime_hours FROM "Employee" as e

LEFT JOIN "Department" AS d
ON e.depart_id = d.depart_id

LEFT JOIN "Salaries" AS s
ON e.salary_id = s.salary_id

LEFT JOIN "Roles" AS r
ON e.role_id = r.role_id

LEFT JOIN "OvertimeHours" AS o
ON e.salary_id = o.overtime_id ;
END;