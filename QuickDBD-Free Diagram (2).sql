-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/SxdjLP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "employee_number" int   NOT NULL,
    "employee_title_id" varchar   NOT NULL,
    "birth_date" int   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" int   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Departments" (
    "department_name" varchar   NOT NULL,
    "department_number" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "Dept_Employee" (
    "Employee_number" int   NOT NULL,
    "department_number" varchar   NOT NULL,
    CONSTRAINT "pk_Dept_Employee" PRIMARY KEY (
        "Employee_number","department_number"
     )
);

CREATE TABLE "Dept_manager" (
    "Department_number" varchar   NOT NULL,
    "employee_number" int   NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY (
        "Department_number","employee_number"
     )
);

CREATE TABLE "Salaries" (
    "employee_number" int   NOT NULL,
    "salary" varchar   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "employee_number"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_employee_title_id" FOREIGN KEY("employee_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_Employee_number" FOREIGN KEY("Employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_department_number" FOREIGN KEY("department_number")
REFERENCES "Departments" ("department_number");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Department_number" FOREIGN KEY("Department_number")
REFERENCES "Departments" ("department_number");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

