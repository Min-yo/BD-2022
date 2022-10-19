--a
select dept_name, avg(salary) as average
from instructor
group by dept_name
order by average;

--b
select building, count(course_id) as count_1
from section
group by building
order by count_1 desc
limit 1;

--c
select building, count(course_id) as count_1
from section
group by building
order by count_1
limit 1;

--d
select st.id, st.name
from student as st inner join takes on st.id = takes.id
where st.dept_name = 'Comp. Sci.'
group by st.id, st.name
having count(course_id) > 3;


--e
select name, dept_name
from instructor
where dept_name = 'Biology'
    or dept_name = 'Philosophy'
    or dept_name = 'Music'
group by name, dept_name;

--f 
select name, year
from instructor inner join teaches on instructor.id = teaches.id
where year = 2018 
    and not year = 2017
group by name, year;