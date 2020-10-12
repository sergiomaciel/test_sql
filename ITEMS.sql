-- 1
CREATE TABLE students (
	id INTEGER PRIMARY KEY,
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL
)

INSERT INTO students (id, firstName, lastName)
    VALUES
    (1, "Juan", "Perez"),
    (2, "John", "Conor"),
    (3, "john", "Max"),
    (4, "JOHN", "R"),
    (5, "Maria", "Perez");

SELECT count(s.id) as Cant
FROM students AS s
WHERE UPPER(s.firstName) = UPPER('John')


-- 2
CREATE TABLE enrollments (
    id INTEGER PRIMARY KEY,
    year INTEGER NOT NULL,
    student INTEGER REFERENCES students(id)
    	ON UPDATE CASCADE
    	ON DELETE CASCADE
)

INSERT INTO enrollments (id, year, student)
    VALUES
    (1, 20, 1),
    (2, 55, 2),
    (3, 100, 3),
    (4, 250, 4),
    (5, 500, 5);

SELECT s.id, s.firstName, s.lastName
FROM students AS s INNER JOIN enrollments as e 
    ON s.id = e.student
WHERE e.year > 20 AND e.year <= 100

-- 3
CREATE TABLE dogs (
  id INTEGER PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

INSERT INTO dogs(id, name) 
    VALUES
    (1, 'Lola'),
    (2, 'Bella');

CREATE TABLE cats (
  id INTEGER PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

INSERT INTO cats(id, name) 
    VALUES
    (1, 'Lola'),
    (2, 'Kitty');

SELECT d.name 
FROM dogs as d
UNION 
SELECT c.name 
FROM cats as c

-- 4
-- Mary,2
-- Brenda, 1

-- 5
CREATE TABLE sessions (
  id INTEGER PRIMARY KEY,
  userId INTEGER NOT NULL,
  duration DECIMAL NOT NULL
);

INSERT INTO sessions(id, userId, duration) VALUES(1, 1, 10);
INSERT INTO sessions(id, userId, duration) VALUES(2, 2, 18);
INSERT INTO sessions(id, userId, duration) VALUES(3, 1, 14);

SELECT s.userid, avg(s.duration)
FROM sessions AS s 
GROUP BY userid
HAVING count(*) > 1;

-- 6
CREATE TABLE sellers (
  id INTEGER PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  rating INTEGER NOT NULL
);

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  sellerId INTEGER REFERENCES sellers(id)
);

INSERT INTO sellers(id, name, rating) VALUES(1, 'Roger', 3);
INSERT INTO sellers(id, name, rating) VALUES(2, 'Penny', 5);

INSERT INTO items(id, name, sellerId) VALUES(1, 'Notebook', 2);
INSERT INTO items(id, name, sellerId) VALUES(2, 'Stapler', 1);
INSERT INTO items(id, name, sellerId) VALUES(3, 'Pencil', 2);

SELECT i.name, s.name
FROM items as i INNER JOIN sellers as s
    ON i.sellerId = s.id
WHERE s.rating > 4
ORDER BY i.sellerId

-- 7
CREATE TABLE employees (
  id INTEGER PRIMARY KEY,
  managerId INTEGER REFERENCES employees(id), 
  name VARCHAR(30) NOT NULL
);

INSERT INTO employees(id, managerId, name) VALUES(1, NULL, 'John');
INSERT INTO employees(id, managerId, name) VALUES(2, 1, 'Mike');

SELECT e.name
FROM employees as e
WHERE id NOT IN (
    SELECT managerId 
    FROM employees 
    WHERE managerId IS NOT null
    )

-- 8
CREATE TABLE users (
  id INTEGER NOT NULL PRIMARY KEY,
  userName VARCHAR(50) NOT NULL
);

CREATE TABLE roles (
  id INTEGER NOT NULL PRIMARY KEY,
  role VARCHAR(20) NOT NULL
);

INSERT INTO users(id, userName) VALUES(1, 'Steven Smith');
INSERT INTO users(id, userName) VALUES(2, 'Brian Burns');

INSERT INTO roles(id, role) VALUES(1, 'Project Manager');
INSERT INTO roles(id, role) VALUES(2, 'Solution Architect');

CREATE TABLE users_roles (
  userId INTEGER NOT NULL,
  roleId INTEGER NOT NULL,
  FOREIGN KEY(userId) REFERENCES users(id),
  FOREIGN KEY(roleId) REFERENCES roles(id),
  PRIMARY KEY (userId, roleId)
)

INSERT INTO users_roles(userId, roleId) VALUES(1, 1);
INSERT INTO users_roles(userId, roleId) VALUES(2, 1);
INSERT INTO users_roles(userId, roleId) VALUES(2, 2);

-- 9
CREATE TABLE regions(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE states(
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  regionId INTEGER NOT NULL REFERENCES regions(id)
); 

CREATE TABLE employees_9 (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  stateId INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE sales (
  id INTEGER PRIMARY KEY,
  amount INTEGER NOT NULL,
  employeeId INTEGER NOT NULL REFERENCES employees_9(id)
);

INSERT INTO regions(id, name) VALUES(1, 'North');
INSERT INTO regions(id, name) VALUES(2, 'South');
INSERT INTO regions(id, name) VALUES(3, 'East');
INSERT INTO regions(id, name) VALUES(4, 'West');
INSERT INTO regions(id, name) VALUES(5, 'Midwest');

INSERT INTO states(id, name, regionId) VALUES(1, 'Minnesota', 1);
INSERT INTO states(id, name, regionId) VALUES(2, 'Texas', 2);
INSERT INTO states(id, name, regionId) VALUES(3, 'California', 3);
INSERT INTO states(id, name, regionId) VALUES(4, 'Columbia', 4);
INSERT INTO states(id, name, regionId) VALUES(5, 'Indiana', 5);

INSERT INTO employees_9(id, name, stateId) VALUES(1, 'Jaden', 1);
INSERT INTO employees_9(id, name, stateId) VALUES(2, 'Abby', 1);
INSERT INTO employees_9(id, name, stateId) VALUES(3, 'Amaya', 2);
INSERT INTO employees_9(id, name, stateId) VALUES(4, 'Robert', 3);
INSERT INTO employees_9(id, name, stateId) VALUES(5, 'Tom', 4);
INSERT INTO employees_9(id, name, stateId) VALUES(6, 'William', 5);

INSERT INTO sales(id, amount, employeeId) VALUES(1, 2000, 1);
INSERT INTO sales(id, amount, employeeId) VALUES(2, 3000, 2);
INSERT INTO sales(id, amount, employeeId) VALUES(3, 4000, 3);
INSERT INTO sales(id, amount, employeeId) VALUES(4, 1200, 4);
INSERT INTO sales(id, amount, employeeId) VALUES(5, 2400, 5);

CREATE VIEW SalesAvg as (
  select R.name as region, 
    CASE WHEN SUM(IFNULL(SL.amount,0)) = 0 THEN 0
    ELSE  SUM(IFNULL(SL.amount,0)) / COUNT(DISTINCT E.id) END as average             

  from regions R
    left join states S on R.id = S.regionId
    left join employees_9 E on S.id = E.stateId
    left join sales SL on E.id = SL.employeeId
  group by R.Id, R.name
) 

SELECT region, average,(SELECT max(average) FROM SalesAvg)- average as difference
FROM SalesAvg