-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.my_contacts
(
    contact_id bigserial NOT NULL,
    last_name character varying,
    fisrt_name character varying,
    phone numeric,
    email character varying,
    gender character,
    birthday date,
    prof_id bigint,
    zip_code bigint,
    status_id bigint,
    PRIMARY KEY (contact_id, prof_id, zip_code, status_id)
);

INSERT INTO my_contacts(last_name, fisrt_name, phone, email, gender, birthday, prof_id, zip_code, status_id)
VALUES ('Andre', 'Mark', 6789087, 'mark@hotmail.com','M','1996-09-19',1,1111,1 ),
('Obrien', 'Dylan', 6789087, 'dylan@hotmail.com','M','1996-09-11',2,1112,2 ),
('Makenzy', 'Molo', 1223443, 'molo@hotmail.com','F','1993-07-14',3,1113,3 ),
('Omarley', 'Gandou', 9876543, 'gandou@hotmail.com','M','1993-07-14',4,1114,4 ),
('Sylla', 'Mariam', 1239012, 'mariam@hotmail.com','F','1993-07-14',5,1115,5 );

SELECT * FROM my_contacts

CREATE TABLE IF NOT EXISTS public.professions
(
    prof_id bigserial NOT NULL,
    profession character varying(50) NOT NULL,
    PRIMARY KEY (prof_id)
);
INSERT INTO professions(profession)
VALUES('Doctor'),
('Programer'),
('Soccer_Player'),
('Boxer'),
('Dancer');
SELECT * FROM professions

CREATE TABLE IF NOT EXISTS public.zip_codes
(
    zip_code bigint NOT NULL CHECK (zip_code < 9999 AND zip_code >999),
    city character varying(100) NOT NULL,
    province character varying(100) NOT NULL,
    PRIMARY KEY (zip_code)
);

INSERT INTO zip_codes(zip_code, city, province)
VALUES(1111, 'Johanesburg', 'Gauteng'),
(1112, 'Pumalanga', 'Kwazulunatal'),
(1113, 'Northem cap', 'Kimberley'),
(1114 ,'Volar','FreeState'),
(1115,'Nolar','Mpumalanga');

SELECT * FROM zip_codes

--Checking the zip_code constraint
INSERT INTO zip_codes(zip_code, city, province)
VALUES(11, 'Johanesburg', 'Gauteng');

INSERT INTO zip_codes(zip_code, city, province)
VALUES(12345, 'Johanesburg', 'Gauteng');

CREATE TABLE IF NOT EXISTS public."Status"
(
    status_id bigserial NOT NULL,
    status_veri character varying(50) NOT NULL,
    PRIMARY KEY (status_id)
);
INSERT INTO "Status"(status_veri)
VALUES('Single'),
('Complicated'),
('Single'),
('Married'),
('Single');

SELECT * FROM "Status"


CREATE TABLE IF NOT EXISTS public.contact_interests
(
    contact_id bigint NOT NULL,
    interest_id bigint NOT NULL,
    PRIMARY KEY (contact_id, interest_id)
);
INSERT INTO contact_interests(contact_id, interest_id)
VALUES(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
SELECT * FROM contact_interests

CREATE TABLE IF NOT EXISTS public.contact_seekings
(
    contact_id bigint,
    seeking_id bigint,
    PRIMARY KEY (contact_id, seeking_id)
);
INSERT INTO contact_seekings(contact_id, seeking_id)
VALUES(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

SELECT * FROM contact_seekings

CREATE TABLE IF NOT EXISTS public.interests
(
    interest_id bigserial NOT NULL,
    interest character varying(50) NOT NULL,
    PRIMARY KEY (interest_id)
);
INSERT INTO interests(interest)
VALUES('Soccer'),
('Cooking'),
('Traveling'),
('Golf'),
('Rugby');

SELECT * FROM interests



CREATE TABLE IF NOT EXISTS public.seekings
(
    seeking_id bigserial NOT NULL,
    seeking character varying(50),
    PRIMARY KEY (seeking_id)
);
INSERT INTO seekings(seeking)
VALUES('Love'),
('Friendship'),
('Love'),
('Love'),
('Friendship');

SELECT * FROM seekings

SELECT
co.last_name,
pr.profession,
z.zip_code,
z.city,
z.province,
s.status_veri,
i.interest,
se.seeking
FROM "my_contacts" as co
LEFT JOIN professions AS pr
ON co.prof_id = pr.prof_id

LEFT JOIN zip_codes AS z
ON co.zip_code = z.zip_code

LEFT JOIN "Status" AS s
ON co.status_id = s.status_id

LEFT JOIN interests AS i
ON co.contact_id = i.interest_id

LEFT JOIN seekings AS se
ON co.contact_id = se.seeking_id;
----Inner Join


SELECT 
mc.last_name,
mc.fisrt_name,
mc.phone,
mc.email,
mc.gender,
mc.birthday,
prof.profession,
z.city,
z.province,
s.status_veri,
sk.seeking,
interests.interest

FROM my_contacts AS mc

INNER JOIN professions AS prof
ON mc.prof_id = prof.prof_id

INNER JOIN zip_codes AS z
ON mc.zip_code = z.zip_code

INNER JOIN "Status" AS s
ON mc.status_id = s.status_id

--INTERESTS INNER JOIN--

--SELECT *
--FROM my_contacts AS mc

INNER JOIN contact_interests
ON mc.contact_id = contact_interests.contact_id

INNER JOIN interests
ON contact_interests.interest_id = interests.interest_id

--SEEKING INNER JOIN

--SELECT *
--FROM my_contacts AS mc

INNER JOIN contact_seekings
ON mc.contact_id = contact_seekings.contact_id

INNER JOIN seekings AS sk
ON sk.seeking_id = contact_seekings.seeking_id;



ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (zip_code)
    REFERENCES public.zip_codes (zip_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (status_id)
    REFERENCES public."Status" (status_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (prof_id)
    REFERENCES public.professions (prof_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interests
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interests
    ADD FOREIGN KEY (interest_id)
    REFERENCES public.interests (interest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."contact _seekings"
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."contact _seekings"
    ADD FOREIGN KEY (seeking_id)
    REFERENCES public.seekings (seeking_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;