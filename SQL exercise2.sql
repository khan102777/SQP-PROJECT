use khan;
CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

select*from departments;
select*from employees;


/*q2.1*/
select lastname from employees;

/*q2.2*/
select lastname from employees
group by lastname;

/*q2.3*/
select*from employees
where lastname = "smith";

/*q2.4*/
select*from employees
where lastname in ("smith","Doe");
select*from employees
where lastname="smith"|| lastname="Doe";

/*q2.5*/
select*from employees
where department = 14;

/*q2.6*/
select*from employees
where department = 37 || department = 77;

/*q2.7*/
select*from employees
where lastname like "S%";

/*q2.8*/
select sum(budget) from departments;

/*q2.9*/
select department as "Department code", count(concat(name," ",lastname)) as "employees" 
from employees
group by department
order by department;

/*q2.10*/
select*from employees left join departments
on employees.department = departments.code;

/*q2.11*/
select employees.name as "employees.
 name", employees.lastname, departments.name as "departments name" , departments.budget
from employees left join departments
on employees.department = departments.code;

/*q2.12*/
select employees.name, lastname from employees left join departments
on employees.department = departments.code
where departments.budget > 60000;

/*q2.13*/
select name, budget from departments
where budget > (select avg(budget) from departments);

/*q2.14*/
select dep from (select departments.name as "dep", count(concat(employees.name,employees.lastname)) as "emp"
                               from departments left join employees
                                on employees.department = departments.code
                                group by dep) as subquery
                                where emp > 2;
                                
select departments.name, count(concat(employees.name,employees.lastname)) as "emp"
from departments left join employees
on employees.department = departments.code
group by departments.name
having emp >2;                               
                
/*q2.15*/
select e.name, e.lastname from employees e
join departments d
on d.code = e.department
where d.budget = (select budget from (select budget from departments
order by budget limit 2) as a
order by budget desc limit 1);
      
/*q2.16*/
INSERT INTO Departments(Code,Name,Budget) VALUES(11,'Quality Assurance',40000);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('847219811','Mary','Moore',11);

/*q2.17*/
update departments
set budget = (90/100*budget);

/*q2.18*/
update employees 
set department = 14 where department = 77;

/*q2.19*/
delete from employees
where department = 14;

/*q2.20*/
delete from employees 
where department in (select code from departments
	   where budget >= 60000);
       
/*q2.21*/
delete from employees;
      






