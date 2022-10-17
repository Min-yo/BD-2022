--a
select title
from course
where credits > 3;

--b
select room_number
from classroom
where building = 'Watson' or building = 'Packard';

--c
select title
from course
where dept_name = 'Computer Science';

--d
select title
from course
inner join section on course.course_id = section.course_id
where semester = 1 or semester = 3 or semester = 5 or semester = 7;

--e
select id, name
from student
where tot_cred > 45 and tot_cred < 90;

--f
select id, name
from student
where right(name, 1) = 'a' 
    or right(name, 1) = 'o' 
    or right(name, 1) = 'e' 
    or right(name, 1) = 'y' 
    or right(name, 1) = 'u' 
    or right(name, 1) = 'i';

--g
select title
from course
inner join prereq on course.course_id = prereq.course_id
where prereq_id = 'CS-101';