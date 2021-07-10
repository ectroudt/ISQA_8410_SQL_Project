-- Student name: Eric Troudt

-- Give feedback to student (slide 13)
-- Let's write several statements necessary to add a feedback to a student
-- We need several date points: teacher_id, class_id, student_id, skill_id, skill_weight, skill_negpos
-- We will get these information by writing several SELECT statements before we INSERT our feedback.

-- First, let's start with the teacher. Write a statement that selects all teacher we have in our table
-- (In the app, we wouldn't need this, because the teacher would log into the app with their credentials.)

-- < 1 Write your SELECT statement here >

SELECT *
FROM teacher;


-- Review the result and select one of the three teachers.

SELECT *
FROM teacher
WHERE teacher_id = 58761;

-- For this teacher (teacher_id), write a statement that shows all classes the teacher
-- is either resonsible for or is teaching as a co-teacher.
-- Display the class_ids only.
-- Hint: Since these are two different relationships, I would advise to use UNION

-- < 2 Write your SELECT statement here >

SELECT ct.class_listing_id "Class ID"
FROM teacher t
	JOIN class_teacher ct ON t.teacher_id = ct.teacher_id
	JOIN class_listing cl ON ct.class_listing_id = cl.class_listing_id
WHERE t.teacher_id = 58761
UNION 
SELECT cl.class_listing_id "Class ID"
FROM teacher t
	JOIN class_listing cl ON t.teacher_id = cl.teacher_id
WHERE t.teacher_id = 58761;


-- Review the result and select a class.

-- First, write a statement that selects all students (student_id, first name, last name, and username)
-- from the class (class_id) you choose.
-- Order by user name


-- < 3 Write your SELECT statement here >

SELECT st.student_id, st.student_firstname "First Name", st.student_lastname "Last Name", st.student_username "Username", 
	   cl.class_listing_id, cl.class_listing_name "Class Name"
FROM student st
	JOIN student_enrollment se ON st.student_id = se.student_id
	JOIN class_listing cl ON se.class_listing_id = cl.class_listing_id
WHERE cl.class_listing_id = 15232
ORDER BY st.student_username ASC;

-- Look at the result and select one student. Remember the student_id.

-- Write a statement that select either all positive or all negative skills for the class (class_id) you choose.

-- < 4 Write your SELECT statement here >

SELECT sk.skill_id, sk.skill_name "Skill name", sk.skill_negpos "Skill Point mode" ,
       cl.class_listing_id, cl.class_listing_name "Class name"
FROM skill sk
	JOIN class_listing cl ON (sk.class_listing_id = cl.class_listing_id 
							  AND cl.class_listing_id = 15232 
							  AND sk.skill_negpos = 'pos')
ORDER BY sk.skill_id ASC;

-- Review the result and select one skill that you want to use in the subsequent query.
-- Remember the skill_id and the points (positive for positive behavior, negative for negative behavior)

-- We have all information that we need:
-- class_id, student_id, skill_id, skill_weight, skill_posneg, teacher_id

-- Write an INSERT statement to create a new feedback for the class, student, and 
-- You need one INSERT statement to create a new feedback.
-- Don't forget to update the points in the tables student enrollment and class. (Two UPDATE statements needed)
-- The feedback is for the individual student.
-- Use SYSDATE for the date.


-- < 5 Write your INSERT statement here >

INSERT INTO student_feedback (student_feedback_id, student_feedback_datetime, student_feedback_given_to, 
							  student_feedback_note, student_feedback_points, student_id,
							  class_listing_id, skill_id, teacher_id)
							 VALUES(186933, SYSDATE, 'individual student', 
							        'Braden followed directions well today', 2, 300797, 
							        15232, 2, 58761);


-- < 6 Write your first UPDATE statement (table student enrollment) here >
-- Hint:add or remove points from total points and add points to either positive or negative points
-- for the student you selected (student_id)
-- Don't forget that the student could have already earned points, so student_points_total = 3 will not work.
							       
							       
UPDATE student_enrollment 
SET student_enrollment_points_positive = student_enrollment_points_positive + 2        
WHERE student_enrollment.student_id = 300797;

--**Updating both positive and total points in same update statement was not working
UPDATE student_enrollment 
SET student_enrollment_points_total = student_enrollment_points_total + student_enrollment_points_positive
WHERE student_enrollment.student_id = 300797;


-- < 7 Write your second UPDATE statement (table class) here >
-- Hint: add or remove points from the class points (hard code number of points)
-- for the class you selected (class_id)

UPDATE class_listing
SET class_listing_points = class_listing_points + 2 --would actually be a subquery that pulls total student points for student_id 300797 in class_listing_id 15232
WHERE class_listing_id = 15232;

-- Commit!
COMMIT;

-- Let's create a class story and add a comment and a like
-- Use the same class_id and teacher_id as before
-- Depending on how you transformed the conceptual model, you will need one or two
-- INSERT statement.
-- If you kept the subtype in its own table, you will need two INSERT statements.
-- If you only kept the supertype, you will need one.
-- Use SYSDATE for the create and publish dates.

-- < 8 Write INSERT statement here >

INSERT INTO story (story_id, story_text, story_create_datetime, story_publish_datetime) 
				  VALUES (509343, 'The class had a fun field trip today', SYSDATE, SYSDATE);

-- < 9 Write INSERT statement here (not needed if sub type is not an own table) >

--class_story_comments_allowed defaults to True and is not needed in insert statement
INSERT INTO class_story (story_id, class_listing_id, teacher_id)
						VALUES (509343, 15232, 58761);

-- Commit!
COMMIT;

-- Let's have a parent view, like, and comment on the story.

-- First, find the parent_id of a parent from the student you used above. Write a statement to do so.
-- Hint: you only need one table to find the parent_id for a specific student (student_id)

-- < 10 Write your SELECT statement here >

SELECT stp.parentind_id
FROM student_parent stp
WHERE stp.student_id = 300797;

-- For the parent_id you receive, find all stories the parent can view since March 1st, 2021.
-- This query requires quite a few joins!
-- Display only stories from classes, not student stories.
-- Retrieve story id, story text, and story publish datetime

-- < 11 Write your SELECT statement here >

SELECT se.class_listing_id "Class ID", s.story_id "Story ID", s.story_text "Story Text", s.story_publish_datetime "Story published"
FROM parentind pnt
	JOIN student_parent spnt ON (pnt.parentind_id = spnt.parentind_id AND pnt.parentind_id = 845465)
	JOIN student_enrollment se ON spnt.student_id = se.student_id
	JOIN class_story cs ON se.class_listing_id = cs.class_listing_id
	JOIN story s ON (cs.story_id = s.story_id AND s.story_publish_datetime > TO_DATE('01-MAR-2021', 'DD-MON-YYYY'));

-- The parent likes the story. Insert a new like!

-- < 12 Write INSERT statement here >

INSERT INTO story_like (parentind_id, story_id) VALUES (845465, 509343);

-- The parent comments on the story. Insert a comment!

-- < 13 Write INSERT statement here >

INSERT INTO comment_post (comment_post_id, comment_post_datetime, comment_post_text, parentind_id, story_id)
						 VALUES (454624, SYSDATE, 'Sounds like a fun time!', 845465, 509343);

-- Commit!
COMMIT;

-- Write a query that counts how many likes the story you created has.

-- < 14 Write your SELECT statement here >

SELECT COUNT(*) "Number of Likes"
FROM story_like
WHERE story_like.story_id = 509343;


COMMIT;