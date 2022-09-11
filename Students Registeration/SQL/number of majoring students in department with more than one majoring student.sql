-- number of majoring students in department with more than one majoring student

select department.name as department_name, count(majorsin.student_id) as majoring_students from department, majorsin
where majorsin.dept_id = department.id
group by department.id
having majoring_students > 1
