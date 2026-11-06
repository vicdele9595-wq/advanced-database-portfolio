BEGIN;
INSERT INTO registration (student_id, offering_id) VALUES (1, 10);
UPDATE course_offering SET seats_taken = seats_taken + 1 WHERE offering_id = 10;
COMMIT;

BEGIN;
INSERT INTO score (registration_id, ca_score, exam_score) VALUES (999, 50, 50);
ROLLBACK;