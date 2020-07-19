# Pewlett-Hackard-Analysis
Module 7
Pewlett Hackard had fallen a bit behind in the database department, so the intent was to get the information on hand into a usable form that could get the company organized.  With an aging workforce, management needed a database that could help them plan and prepare for excessive turnover/retirements that are department specific that ,given the competitive job market in their industry, could make parts of the organization very vulnerable.  We used PostgreSQL and pgAdmin to analyze the available data quickly using SQL code and logic to give them a glimpse of what may be ahead.

From a structural perspective, we imported 6 data sets: 
1.	Titles—which contains employee Number, job title and a “from” amd “to” date
2.	Salaries—which contains employee number and salary information as well as a “from” and “to” date
3.	Employees—which contains employee number, birthdate, gender and hire date information
4.	Dept_Emp—which contains employee number, department number, and “from” and “to” dates
5.	Dept_Manager—which contains department number, employee number, and “from” and “to” date
6.	Departments—which contains department number and name

Management would like to know the number of roles that will need to be filled as the “silver tsunami” begins to make an impact. They would also like to identify retirement-ready employees who qualify to mentor the next generation of Pewlett Hackard employees. To isolate these employees, we had to filter on everything from birth date (age) to from date (tenure) to isolate the list of potential retirees.  We also needed to include department name so that certain departments had resources ready.

The most common variable across the database was centered on “employee number” with “department number” being the second most common.  There were challenges in importing certain data sets (Dept_EMP, Dept_manager, and Titles) because employee number could be duplicated should an employee change positions (impacts from/to date) or an increase in pay (again from/to impact) so there is a need for very thoughtful join relationships to prevent duplicate records. 

In summary, the PH organization has the potential for 133,776 employees that are eligible for retirement.  Engineers make up 26% of these employees, followed by 24% Staff, 22% Senior Engineers and 21% Senior staff.  In total 60% of retirement eligible employees is male.  The pool for mentors is 1,549 but is unfortunately the composition by department does not complement the retirees.  In total, 37% of mentorships come from Senior staff, 34% Senior Engineer, with just 12% Engineer and 10% Staff.  Although the Engineering expertise is important to the enterprise, the potential for institutional knowledge leaving the company from Staff and Senior Staff can have a damaging effect rather quickly.

My recommendation is to begin prioritizing departments for mentorships and create a strategic plan to overcome any potential disruptions should the “silver tsunami” result.  The team might consider collecting more information about the organization and its employees to build more robust reporting around Human Resources for HR planning, career planning, departmental budgeting, etc. 
