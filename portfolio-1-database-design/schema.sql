-- Schema for University Student Result Portal
CREATE TABLE department (dept_id SERIAL PRIMARY KEY, name VARCHAR(100) UNIQUE NOT NULL);
CREATE TABLE programme (programme_id SERIAL PRIMARY KEY, dept_id INT REFERENCES department(dept_id), name VARCHAR(100) NOT NULL);
CREATE TABLE student (student_id SERIAL PRIMARY KEY, matric_no VARCHAR(20) UNIQUE NOT NULL, email VARCHAR(100) UNIQUE NOT NULL, dept_id INT REFERENCES department(dept_id), programme_id INT REFERENCES programme(programme_id));
CREATE TABLE course (course_id SERIAL PRIMARY KEY, course_code VARCHAR(10) UNIQUE NOT NULL, title VARCHAR(100) NOT NULL, credit_units INT CHECK (credit_units BETWEEN 1 AND 6), dept_id INT REFERENCES department(dept_id));
CREATE TABLE semester (semester_id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL, start_date DATE, end_date DATE);
CREATE TABLE course_offering (offering_id SERIAL PRIMARY KEY, course_id INT REFERENCES course(course_id), semester_id INT REFERENCES semester(semester_id), lecturer_id INT NOT NULL, capacity INT DEFAULT 50, seats_taken INT DEFAULT 0, UNIQUE (course_id, semester_id));
CREATE TABLE registration (registration_id SERIAL PRIMARY KEY, student_id INT REFERENCES student(student_id), offering_id INT REFERENCES course_offering(offering_id), UNIQUE (student_id, offering_id));
CREATE TABLE score (score_id SERIAL PRIMARY KEY, registration_id INT REFERENCES registration(registration_id) ON DELETE CASCADE, ca_score INT CHECK (ca_score BETWEEN 0 AND 40), exam_score INT CHECK (exam_score BETWEEN 0 AND 60), total_score INT GENERATED ALWAYS AS (ca_score + exam_score) STORED);
CREATE TABLE grade_audit (audit_id SERIAL PRIMARY KEY, registration_id INT REFERENCES registration(registration_id), old_total INT, new_total INT, changed_by VARCHAR(50) NOT NULL, changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
