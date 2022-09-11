-- number of CS students enrolled in CSC275

select count(enrolled.student_id) as students from enrolled, course, majorsin, department
where course.crn = enrolled.course_id and
      majorsin.student_id = enrolled.student_id and 
      department.id = majorsin.dept_id and
      department.name = 'CS' and course.name = 'CSC275'