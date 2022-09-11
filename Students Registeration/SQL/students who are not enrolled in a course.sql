-- students who are not enrolled in a course

select * from student where id not in (select student_id from enrolled group by student_id)