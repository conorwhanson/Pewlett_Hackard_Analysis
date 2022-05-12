-- Use Dictinct with Orderby to remove duplicate rows, exclude employees that
-- have left the company, and fall in retirement range (1952-1955 birthday)
select 
distinct on(e.emp_no) e.emp_no,
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
	and ti.to_date = '9999-01-01'
order by emp_no
limit 10;

-- group by employee title and count total of employees with each title who are
-- about to retire.
select 
count(e.emp_no) as title_count,
t.title
into retiring_titles_count
from
	employees as e
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and t.to_date = '9999-01-01'
group by t.title
order by title_count desc
limit 10;

-- Queries to find employees eligible for mentorship program
select distinct on (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
--into mentorship_eligibility
from
	employees as e
	join dept_emp as de on e.emp_no = de.emp_no
	join titles as ti on e.emp_no = ti.emp_no
where
	e.birth_date between '1965-01-01' and '1965-12-31'
	and ti.to_date = '9999-01-01'
order by emp_no
limit 10;