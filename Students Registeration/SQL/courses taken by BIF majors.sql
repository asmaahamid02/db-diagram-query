-- courses taken by BIF majors

select course.* from course 
inner join enrolled on enrolled.course_id = course.crn
inner join majorsin on majorsin.student_id = enrolled.student_id
inner join department on department.id = majorsin.dept_id
where department.name = 'BIF'
group by course.crn
order by course.crn