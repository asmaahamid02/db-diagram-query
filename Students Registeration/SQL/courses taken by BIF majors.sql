-- courses taken by BIF majors

select course.* from course, enrolled, majorsin, department
where enrolled.course_id = course.crn and majorsin.student_id = enrolled.student_id and department.id = majorsin.dept_id and department.name = 'BIF'
group by course.crn
order by course.crn