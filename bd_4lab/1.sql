--a
select title, credits
from course
where credits > 3
group by title, credits;

--b
select room_number, building
from classroom
where building = 'Watson' or building = 'Packard'
group by room_number, building;

--c
select title, dept_name
from course
where dept_name = 'Comp. Sci.'
group by title, dept_name;

--d
select title, semester
from course
inner join section on course.course_id = section.course_id
where semester = 'Fall'
group by title, semester;

--e
select name, tot_cred
from student
where tot_cred > 45 and tot_cred < 90
group by name, tot_cred;

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
select title, prereq_id
from course
inner join prereq on course.course_id = prereq.course_id
where prereq_id = 'CS-101'
group by title, prereq_id;