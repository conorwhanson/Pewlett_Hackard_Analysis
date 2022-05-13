-- DELIVERABLE 1: Join Employee table and Title table conditioned on birthdate
select distinct on (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_titles
from
	employees as e
	join titles as ti on e.emp_no = ti.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
order by emp_no;

-- group by most recent employee title
select distinct on (emp_no)
emp_no,
first_name,
last_name,
title
into unique_titles
from retirement_titles
where to_date = '9999-01-01'
order by emp_no, to_date desc;

-- find # of employees by most recent title who are ready to retire
select count(title) as title_count,
title
into retiring_titles
from unique_titles
group by title
order by title_count desc

-- Queries to find employees eligible for mentorship program
select distinct on (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
from 
	employees as e
	join dept_emp as de on e.emp_no = de.emp_no
	join titles as ti on e.emp_no = ti.emp_no
where 
	e.birth_date between '1965-01-01' and '1965-12-31'
	and ti.to_date = '9999-01-01'
order by 
	e.emp_no, ti.to_date desc

-- PROF BOOTH DELV 2
select *
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join titles as ti on e.emp_no = ti.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and ti.to_date  = '9999-01-01'
	order by e.emp_no
limit 10