-- ddl 
CREATE DATABASE databasename;

DROP DATABASE databasename;

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

ALTER TABLE table_name
ADD column_name datatype;

-- dml

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

DELETE FROM table_name WHERE condition;

SELECT column1, column2, ...
FROM table_name;