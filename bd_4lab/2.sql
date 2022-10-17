--a
select dept_name, avg(salary)
from instructor inner join department on department.dept_name = instructor.dept_name
order by avg(salary) asc;

--b
select building, count(course_id)
from department inner join course on department.dept_name = course.dept_name
having max(count(course_id)) = count(course_id);

--c
select building, count(course_id)
from department inner join course on department.dept_name = course.dept_name
having min(count(course_id)) = count(course_id);

--d
select id, name
from student inner join takes on student.id = takes.id
where dept_name = 'Computer Science'
having count(course_id) > 3;

--e
select name
from instructor
where dept_name = 'Biology' 
    or dept_name = 'Philosophy' 
    or dept_name = 'Music';

--f 
select name
from instructor inner join teaches on instructor.id = teaches.id
where year = 2018 
    and not year = 2017;