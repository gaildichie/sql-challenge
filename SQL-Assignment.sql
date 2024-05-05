
CREATE TABLE Employees (
    emp_no int primary key NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar NOT NULL,
    hire_date date NOT NULL
);



CREATE TABLE Titles (
    title_id varchar primary key  NOT NULL,
    title varchar   NOT NULL
);


CREATE TABLE Departments (
    dept_number varchar primary key  NOT NULL,
    dept_name varchar  NOT NULL
);

CREATE TABLE Dept_Employee (
    emp_no int NOT NULL,
    dept_no varchar NOT NULL, 
	foreign key (emp_no) references Employees (emp_no),
	foreign key (dept_no) references Departments(dept_number),
    primary key (emp_no, dept_no)
);


CREATE TABLE Dept_manager (
    dept_no varchar NOT NULL,
    emp_no int NOT NULL,
	foreign key (emp_no) references Employees (emp_no),
	foreign key (dept_no) references Departments(dept_number),
    primary key (dept_no, emp_no)
);

CREATE TABLE Salaries (
    emp_no int primary key NOT NULL,
    salary varchar NOT NULL
    
);

--1.Employee no, last name, first name, sex and salary of each employee
select Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
from Employees
Join Salaries on Employees.emp_no = Salaries.emp_no;

--2.First name, last name and hire date for employees hired in 1986
Select first_name, last_name, hire_date
from Employees
where hire_date between '01/01/1986' and '12/31/1986';

--3.Department managers with dept names, nos., employee nos., first and last names
select Dept_manager.dept_no, Departments.dept_name, Dept_manager.emp_no, Employees.last_name, Employees.first_name
from Dept_manager
inner join Employees on Dept_manager.emp_no = Employees.emp_no
inner join Departments on Dept_manager.dept_no = Departments.dept_number;

-- 4.Each employees first name, last name, employee number and department name
 select Dept_Employee.dept_no, Dept_Employee.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
 from Dept_Employee
 inner join Employees on Dept_Employee.emp_no = Employees.emp_no
 inner join Departments on Dept_Employee.dept_no = Departments.dept_number;

--5.First name, last name, sex of each employee named Hercules with last name starting with B
select first_name, last_name, sex
from Employees
where first_name = 'Hercules' and last_name like'B%';

--6.Each employee number, last name, first name in Sales DEPARTMENT
select Employees.emp_no, Employees.last_name, Employees.first_name
from Employees
inner join Dept_Employee on Employees.emp_no = Dept_Employee.emp_no
inner join Departments on Dept_Employee.dept_no = Departments.dept_number
where Departments.dept_name = 'Sales';

--7. Each employee in Sales and Development with employee no, last, first and department names
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
from Employees
inner join Dept_Employee on Employees.emp_no = Dept_Employee.emp_no
inner join Departments on Dept_Employee.dept_no = Departments.dept_number
where Departments.dept_name in ('Sales', 'Development');


--8.Frequency counts of all Employee last names
select last_name, count(*) as frequency
from Employees
group by last_name
order by frequency desc;



