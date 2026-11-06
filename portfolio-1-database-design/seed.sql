-- Sample Data
INSERT INTO department (name) VALUES ('Computer Science'), ('Information Technology');
INSERT INTO programme (dept_id, name) VALUES (1, 'BSc Computer Science'), (2, 'BSc Cyber Security');
INSERT INTO student (matric_no, email, dept_id, programme_id) VALUES ('MIV/2026/001', 'student1@miva.edu', 1, 1), ('MIV/2026/002', 'student2@miva.edu', 2, 2);
INSERT INTO course (course_code, title, credit_units, dept_id) VALUES ('CSC101', 'Intro to Programming', 3, 1), ('CYB101', 'Intro to Security', 3, 2);
INSERT INTO semester (name) VALUES ('2026/2027 First Semester');
INSERT INTO course_offering (course_id, semester_id, lecturer_id, capacity) VALUES (1, 1, 101, 50), (2, 1, 102, 50);
INSERT INTO registration (student_id, offering_id) VALUES (1, 1), (2, 2);
INSERT INTO score (registration_id, ca_score, exam_score) VALUES (1, 30, 50), (2, 25, 45);
