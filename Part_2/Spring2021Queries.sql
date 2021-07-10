-- Student name: < Insert here >

-- Give feedback to student (slide 13)
-- Let's write several statements necessary to add a feedback to a student
-- We need several date points: teacher_id, class_id, student_id, skill_id, skill_weight, skill_negpos
-- We will get these information by writing several SELECT statements before we INSERT our feedback.

-- First, let's start with the teacher. Write a statement that selects all teacher we have in our table
-- (In the app, we wouldn't need this, because the teacher would log into the app with their credentials.)

-- < 1 Write your SELECT statement here >



-- Review the result and select one of the three teachers.

-- For this teacher (teacher_id), write a statement that shows all classes the teacher
-- is either resonsible for or is teaching as a co-teacher.
-- Display the class_ids only.
-- Hint: Since these are two different relationships, I would advise to use UNION

-- < 2 Write your SELECT statement here >



-- Review the result and select a class.

-- First, write a statement that selects all students (student_id, first name, last name, and username)
-- from the class (class_id) you choose.
-- Order by user name

-- < 3 Write your SELECT statement here >



-- Look at the result and select one student. Remember the student_id.

-- Write a statement that select either all positive or all negative skills for the class (class_id) you choose.

-- < 4 Write your SELECT statement here >



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


-- < 6 Write your first UPDATE statement (table student enrollment) here >
-- Hint:add or remove points from total points and add points to either positive or negative points
-- for the student you selected (student_id)
-- Don't forget that the student could have already earned points, so student_points_total = 3 will not work.



-- < 7 Write your second UPDATE statement (table class) here >
-- Hint: add or remove points from the class points (hard code number of points)
-- for the class you selected (class_id)



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



-- < 9 Write INSERT statement here (not needed if sub type is not an own table) >



-- Commit!
COMMIT;

-- Let's have a parent view, like, and comment on the story.

-- First, find the parent_id of a parent from the student you used above. Write a statement to do so.
-- Hint: you only need one table to find the parent_id for a specific student (student_id)

-- < 10 Write your SELECT statement here >



-- For the parent_id you receive, find all stories the parent can view since March 1st, 2021.
-- This query requires quite a few joins!
-- Display only stories from classes, not student stories.
-- Retrieve story id, story text, and story publish datetime

-- < 11 Write your SELECT statement here >



-- The parent likes the story. Insert a new like!

-- < 12 Write INSERT statement here >



-- The parent comments on the story. Insert a comment!

-- < 13 Write INSERT statement here >


-- Commit!
COMMIT;

-- Write a query that counts how many likes the story you created has.

-- < 14 Write your SELECT statement here >




