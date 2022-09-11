-- number of majors each student has declared

select student.name as student, count(department.name) as majors from department,majorsin,student
where majorsin.dept_id = department.id and student.id = majorsin.student_id
group by student.id
order by student.name asc