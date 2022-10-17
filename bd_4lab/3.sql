--a
select name
from student inner join takes on student.id = takes.id
inner join course on takes.course_id = course.course_id
where title = 'Computer Science' 
    and (grade = 'A' or grade = 'A-')
order by name;

--b
select name
from instructor inner join advisor on instructor.id = advisor.s_id
inner join takes on advisor.s_id = takes.id
where grade != 'A' 
    or grade != 'A-' 
    or grade != 'B+' 
    or grade != 'B';

--c
select all dept_name
from department inner join student on department.dept_name = student.dept_name
inner join takes on student.id = takes.id
where grade != 'F' or grade != 'C';

--d
select all name
from instructor inner join teaches on instructor.id = teaches.id
inner join takes on teaches.course_id = takes.course_id
where grade != 'A';

--e
select title
from course inner join section on course.course_id = section.course_id
inner join time_slot on section.time_slot_id = time_slot.time_slot_id
where datediff(hour, end_time, '13:00') > 0; -- returns true if end_time is before 13:00
