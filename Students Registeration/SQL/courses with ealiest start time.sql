-- courses with ealiest start time

select * from course where start_time = (select min(start_time) from course)
