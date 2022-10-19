--a
select name, grade
from student inner join takes on student.id = takes.id
where course_id = 'CS-101' --Comp. Sci. course id = CS-101
    and (grade = 'A' or grade = 'A-')
group by name , grade
order by name;

--b
select instr.name, takes.grade
from advisor inner join student as st on st.id = advisor.s_id
inner join takes on advisor.s_id = takes.id
inner join instructor as instr on advisor.i_id = instr.id
where not (grade = 'A' or grade = 'A-' or grade = 'B+' or grade = 'B')
group by instr.name, takes.grade;

--c
select dept_name
from student
join takes on student.id = takes.id
group by dept_name
having sum(case when grade = 'C' or grade = 'F' then 1 else 0 end) = 0;

--d
select name
from instructor inner join teaches on instructor.id = teaches.id
inner join takes on teaches.course_id = takes.course_id
group by name
having sum(case when grade = 'A' then 1 else 0 end) = 0;

--e
select course.title, end_hr
from section inner join time_slot on section.time_slot_id = time_slot.time_slot_id
inner join course on course.course_id = section.course_id
--where datediff(hour, end_time, '13:00') > 0; -- returns true if end_time is before 13:00
where end_hr < 13
group by course.title, end_hr;
