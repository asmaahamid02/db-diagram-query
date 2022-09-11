-- number of CS students enrolled in CSC275

select count(student.id) as students from student
inner join enrolled on enrolled.student_id = student.id
inner join course on course.crn = enrolled.course_id
inner join majorsin on majorsin.student_id = student.id
inner join department on department.id = majorsin.dept_id
where department.name = 'CS' and course.name = 'CSC275'