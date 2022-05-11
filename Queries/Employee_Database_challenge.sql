-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

select 
distinct on(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	
from
	employees e
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and t.to_date = "9999-01-01"
order by emp_no
limit 10;

-- group by employee title and count total of with each title
select 
t.title,
count(e.emp_no) as title_count

from
	employees e
	join titles t on e.emp_no = t.emp_no
where
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and t.to_date = "9999-01-01"

group by t.title
order by title_count desc
limit 10;