-- number of majoring students in department with more than one majoring student

select department_name, majoring_students from(
select department.name as department_name, count(majorsin.student_id) as majoring_students from department
inner join majorsin on majorsin.dept_id = department.id

group by department.id
) as sub
where majoring_students > 1