-- 1. Semester GPA per student
WITH CoursePoints AS (SELECT r.student_id, c.credit_units, CASE WHEN s.total_score >= 70 THEN 5 ELSE 0 END AS gp FROM registration r JOIN course_offering co ON r.offering_id = co.offering_id JOIN course c ON co.course_id = c.course_id JOIN score s ON r.registration_id = s.registration_id) SELECT student_id, SUM(credit_units * gp) / NULLIF(SUM(credit_units), 0) AS gpa FROM CoursePoints GROUP BY student_id;

-- 2. Transcript View
CREATE VIEW student_transcript AS SELECT st.matric_no, c.course_code, c.title, s.total_score FROM student st JOIN registration r ON st.student_id = r.student_id JOIN course_offering co ON r.offering_id = co.offering_id JOIN course c ON co.course_id = c.course_id JOIN score s ON r.registration_id = s.registration_id;

-- 3. Top 10 students per department
SELECT dept_id, matric_no, gpa, RANK() OVER(PARTITION BY dept_id ORDER BY gpa DESC) as rank FROM (SELECT st.dept_id, st.matric_no, AVG(sc.total_score) as gpa FROM student st JOIN registration r ON st.student_id = r.student_id JOIN score sc ON r.registration_id = sc.registration_id GROUP BY st.dept_id, st.matric_no) as cgpas LIMIT 10;
