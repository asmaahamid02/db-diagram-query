-- number of majoring students in department with more than one majoring student

select department_name, majoring_students from(
select department.name as department_name, count(majorsin.student_id) as majoring_students from department, majorsin
where majorsin.dept_id = department.id
group by department.id
) as sub
where majoring_students > 1