# Pewlett-Hackard-Analysis
 Module 7
Background
Now that Bobby has proven his SQL chops, his manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

What You're Creating
This new assignment consists of two technical analysis deliverables and a written report. You will submit the following:

Deliverable 1: The Number of Retiring Employees by Title
Deliverable 2: The Employees Eligible for the Mentorship Program
Deliverable 3: A written report on the employee database analysis (README.md)
Files

NOTE
The starter folder includes the solution ERD and database schema, as well as the data CSV files, in case you need them to get started.

Instructions
Deliverable 1: The Number of Retiring Employees by Title (50 points)
Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title. Finally, because we want to include only current employees in our analysis, be sure to exclude those employees who have already left the company.

Create a SQL file in the Queries folder of your Pewlett-Hackard-Analysis GitHub folder, and name it Employee_Database_challenge.sql.

Follow the instructions below to complete Deliverable 1.

Retrieve the emp_no, first_name, and last_name columns from the Employees table.

Retrieve the title, from_date, and to_date columns from the Titles table.

Create a new table using the INTO clause.

Join both tables on the primary key.

Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.

Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

Before you export your table, confirm that it looks like this image:

![image](https://user-images.githubusercontent.com/119356389/233218348-d777d596-75b7-4013-b9e2-df5663593a94.png)


The Retirement Titles table with employee number, first name, last name, title, the title from and to dates, and ordered by employee number.

NOTE
There are duplicate entries for some employees because they have switched titles over the years. Use the following instructions to remove these duplicates and keep only the most recent title of each employee.

Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.

Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.

These columns will be in the new table that will hold the most recent title of each employee.
Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

         Select Distinct on (emp_no) emp_no,
         first_name,
         last_name, 
         birth_date,
         title, 
         from_date,
         to_date
         INTO membership_eligibility
         FROM membership
         WHERE membership.birth_date BETWEEN ('1965-01-01') AND ('1965-12-31')
         ORDER BY membership.emp_no ASC, membership.birth_date DESC; 



Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.

Create a Unique Titles table using the INTO clause.

Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.

Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

Before you export your table, confirm that it looks like this image:

![image](https://user-images.githubusercontent.com/119356389/233218734-92ec9333-98b5-44bf-b79a-fcaf49e9ec63.png)




The unique titles table is ascending ordered by employee number and descending order by the most recent title date.

Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.

First, retrieve the number of titles from the Unique Titles table.

Then, create a Retiring Titles table to hold the required information.

Group the table by title, then sort the count column in descending order.

Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

Before you export your table, confirm that it looks like this image:


![image](https://user-images.githubusercontent.com/119356389/233218995-e843979a-1d1b-4595-bd78-d6f038098ac2.png)



The retiring title table ordered by title and sorted by count in descending order.

Save your Employee_Database_challenge.sql file in your Queries folder in the Pewlett-Hackard folder.

Deliverable 2: The Employees Eligible for the Mentorship Program (30 points)
Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

In the Employee_Database_challenge.sql file, write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
Retrieve the from_date and to_date columns from the Department Employee table.
Retrieve the title column from the Titles table.
Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

Create a new table using the INTO clause.
         Select Distinct on (emp_no) emp_no,
         first_name,
         last_name, 
         birth_date,
         title, 
         from_date,
         to_date
         INTO membership_eligibility
         FROM membership
         WHERE membership.birth_date BETWEEN ('1965-01-01') AND ('1965-12-31')
         ORDER BY membership.emp_no ASC, membership.birth_date DESC; 


Join the Employees and the Department Employee tables on the primary key.
Join the Employees and the Titles tables on the primary key.
Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
Order the table by the employee number.
Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
Before you export your table, confirm that it looks like this image:

![image](https://user-images.githubusercontent.com/119356389/233219109-289ef859-8da4-46b4-ba9b-ba8c4e0763b6.png)






The mentorship table with the employee number, first and last name, birth date, from and to date for the current title, ordered by employee number.

Deliverable 3: A written report on the employee database analysis (20 points)

Overview of the analysis: Explain the purpose of this analysis.

Results:
   At the time of this analysis there are currently 331,603 employees in the company.

   There are 240,124 employees who will be retiring within the near future.

   There are 1,549 employees who are eligible to participate in the mentorship program.

Most of the retiring employees hold Senior positions in the company. It will be even more important to ensure that the employees who will fill their positions are trained well to ensure the positions contiue to be run smoothly.

