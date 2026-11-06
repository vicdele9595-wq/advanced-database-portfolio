CREATE INDEX idx_registration_student ON registration(student_id);
CREATE INDEX idx_score_registration ON score(registration_id);
CREATE INDEX idx_course_offering_sem ON course_offering(semester_id, course_id);