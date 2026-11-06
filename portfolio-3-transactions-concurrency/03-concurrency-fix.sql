BEGIN;
SELECT seats_taken FROM course_offering WHERE offering_id = 1 FOR UPDATE;
UPDATE course_offering SET seats_taken = seats_taken + 1 WHERE offering_id = 1;
COMMIT;