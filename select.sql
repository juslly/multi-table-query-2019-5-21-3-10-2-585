# 1.查询同时存在1课程和2课程的情况
select studentId from student_course where courseId = 1 and courseId in (select studentId from student_course where courseId = 2)
# 2.查询同时存在1课程和2课程的情况
select studentId from student_course where courseId = 1 and courseId in (select studentId from student_course where courseId = 2)
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select student.id,student.name,avg(student_course.score) from student left join student_course on student.id = student_course.studentId GROUP BY student_course.studentId HAVING avg(student_course.score) >= 60
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM course left JOIN student_course on course.id = student_course.courseId left join student on student.id = student_course.studentId where score IS NULL;
# 5.查询所有有成绩的SQL
select studentId,courseId from student_course where score is not null
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select studentId,name from student_course,student where student_course.studentId = student.id and courseId = 1 and courseId in (select studentId from student_course where courseId = 2)
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select studentId,score FROM student_course where courseId = 1 and score<60 order by score desc
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select courseId,AVG(score) from student_course GROUP BY courseId ORDER BY AVG(score) desc,courseId
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select name,score from student,student_course where student.id = student_course.studentId and courseId =(select id from course where name = "数学") and score<60
