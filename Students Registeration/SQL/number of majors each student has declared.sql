-- number of majors each student has declared

select student.name as student, count(department.name) as majors from department
inner join majorsin on majorsin.dept_id = department.id
inner join student on student.id = majorsin.student_id
group by student.id
order by student.name asc