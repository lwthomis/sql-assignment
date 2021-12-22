USE university_assignment;

-- The average grade that is given by each professor
SELECT g.grade_professor_id, AVG(g.grade_percent)
FROM grades g
GROUP BY g.grade_professor_id;

-- The top grades for each student
SELECT grade_student_id, MAX(grade_percent)
FROM grades
GROUP BY grade_student_id;

-- Group students by the courses that they are enrolled in
SELECT DISTINCT c.course_name, s.student_lname, s.student_fname
FROM grades g
JOIN courses c
ON g.grade_course_id = c.course_id
JOIN students s
ON g.grade_student_id = s.student_id
ORDER BY c.course_name;

-- Create a summary report of courses and their average grades, 
-- sorted by the most challenging course (course with the lowest average grade) 
-- to the easiest course
SELECT c.course_name, AVG(g.grade_percent)
FROM grades g
JOIN courses c
ON g.grade_course_id = c.course_id
GROUP BY c.course_name
ORDER BY AVG(g.grade_percent) ASC;

-- Finding which student and professor have the most courses in common
SELECT c.course_name, s.student_lname, p.professor_lname
FROM Courses c
JOIN Grades g
ON g.grade_course_id = c.course_id
JOIN Students s 
ON s.student_id = g.grade_student_id
JOIN Professors p
ON c.course_professor_id = p.professor_id
ORDER BY p.professor_lname, s.student_lname;