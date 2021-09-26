# Pewlett-Hackard Analysis
## Overview
In the organization, we are aware of a potentially upcoming flood of retirees which may critically impact the operations and future of the firm without proper planning.  In order to better understand this, the first phase of this project (already completed) was to gather the raw data and add it to a database.  In this phase, we built a number of SQL queries to gather data and insights for two purposes:
* Determine the number of retiring employees per title
* Identify employees who are eligible to participate in a mentorship program  
## Results  
### Number of retiring employees per title  
In examining employees that were born between 1952 and 1955 (high likelihood of retiring soon), there is a substantial brain drain that will be occurring:  
![retiring-titles](https://user-images.githubusercontent.com/88070999/134784756-699810d3-d894-4132-b5a3-778747daba37.png)
* The grand total of this group is 90,398, which represents 38% of the company's employees.
* Between Asst, Engineer, and Sr Engineers, potentially 45,397 engineers could be retiring soon.  At present, that also represents about 38% of the company's engineers.
* Out of 9 current managers, 2 are nearing retirement, which will place significant stress on leadership within the organization

To help fill this void of technical and people leadership, we have conducted an analysis to show that 1,549 employees are eligible for the mentorship program.  The data for this group is found in the "mentorship_eligibility.csv" in the github repository.  This group consists of a number of different titles:  
![mentorship](https://user-images.githubusercontent.com/88070999/134785538-da792da0-5f79-4dea-b50b-ae498be8ee5c.png)  

## Summary  
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?  
The wave of upcoming retirements will be significant- 45,397 (38% of the company's workforce).  Substantial efforts will be required in the form of mentorship programs, recruiting, cross-training, and many other initiatives to mitigate the impacts of retirements over the next few years.
### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?  
There are more than enough retirement ready employees (born between 1952 and 1955) who could help mentor those in the mentorship program, and in turn mentor future generations of employees.  Though mentoring alone will not be sufficient in filling the gaps led by retirements, necessitating further recruiting programs.
Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
For comparison, titles retiring soon:  
![retiring-titles](https://user-images.githubusercontent.com/88070999/134789280-46049d01-90f1-4094-ad52-ed078b903570.png)  

Count of current titles:  
![current_count](https://user-images.githubusercontent.com/88070999/134789291-839a486a-6585-4a1b-a908-53d7eef6cf0f.png)  
SQL code to generate:
```
select title, count(emp_no)
from titles
where to_date = '9999-01-01'
group by title
order by count desc;
```

Departments most impacted by upcoming retirements:  
![dept](https://user-images.githubusercontent.com/88070999/134790455-e3f8ffa0-3977-4bf8-858b-aabdab8d5147.png)

```
SELECT de.dept_no, COUNT(e.emp_no)
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE (e.birth_date >= '1952-01-01' AND e.birth_date <= '1955-12-31' AND de.to_date = '9999-01-01')
GROUP BY de.dept_no
ORDER BY count DESC;
```
