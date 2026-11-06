-- Session A
BEGIN;
SELECT seats_taken FROM course_offering WHERE offering_id = 1;
-- Session B
BEGIN;
SELECT seats_taken FROM course_offering WHERE offering_id = 1;
-- Session A
UPDATE course_offering SET seats_taken = 50 WHERE offering_id = 1;
COMMIT;
-- Session B
UPDATE course_offering SET seats_taken = 50 WHERE offering_id = 1;
COMMIT;