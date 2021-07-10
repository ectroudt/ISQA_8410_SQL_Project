--- ISQA8410 Project Part 3, SQL queries
--- Eric Troudt

-----------------------------------------

--- 1. List the number of feedbacks broken down by class and student for the school year 2020-2021 for one
---    school. The output should list {classroom, student, number of feedback}.

SELECT cd_cl.class_name classroom, cd_st.student_key student, COUNT(cd_fd.feedback_id) "number of feedback"
FROM ClassDojo_FeedbackFact cd_fd
	JOIN ClassDojo_ClassDim cd_cl ON cd_fd.class_key = cd_cl.class_key
	JOIN ClassDojo_StudentDim cd_st ON cd_fd.student_key = cd_st.student_key
	JOIN ClassDojo_DateDim cd_dt ON (cd_fd.date_key = cd_dt.date_key AND cd_dt.date_academic_year = '2020-2021')
	JOIN ClassDojo_SchoolDim cd_sch ON (cd.fd.school_key = cd_sch.school_key AND cd_sch.school_name = '**a given school name**')
GROUP BY cd_cl.class_name, cd_st.student_key;



--- 2. List the number of positive and negative feedback broken down by teacher of one school in school year
---    2020-2021. The output should list {teacher, number of positive feedback, number of negative feedback}.

SELECT cd_t.teacher_id, COUNT(CASE WHEN cd_sk.negpos = 'pos' THEN 1 END) "# of positive feedback",
						COUNT(CASE WHEN cd_sk.negpos = 'neg' THEN 1 END) "# of negative feedback"
 FROM ClassDojo_FeedbackFact cd_fd
	 JOIN ClassDojo_TeacherDim cd_t ON cd_fd.teacher_key = cd_t.teacher_key
	 JOIN ClassDojo_SkillDim cd_sk ON cd.fd.skill_id = cd_sk.skill_id
	 JOIN ClassDojo_DateDim cd_dt ON (cd_fd.date_key = cd_dt.date_key AND cd_dt.date_academic_year = '2020-2021')
	 JOIN ClassDojo_SchoolDim cd_sch ON (cd.fd.school_key = cd_sch.school_key AND cd_sch.school_name = '**a given school name**')
 GROUP BY cd_t.teacher_id;



--- 3. List the feedback points for one student for all the months in 2020. The output should list {month, class,
---    feedback points}

SELECT cd_dt.date_month "month", cd_cl.class_name "class", SUM(cd_fd.feedback_points) "Feedback Total Points"
FROM ClassDojo_FeedbackFact cd_fd
	JOIN ClassDojo_DateDim cd_dt ON cd_fd.date_key = cd_dt.date_key
	JOIN ClassDojo_ClassDim cd_cl ON cd_fd.class_key = cd_cl.class_key
	JOIN ClassDojo_StudentDim cd_st ON (cd_fd.student_key = cd_st.student_key AND cd.st.student_key = "** given student key**")
GROUP BY cd_dt.date_month, cd_cl.class_name;



--- 4. List the number of feedbacks broken down by skill for one class for each academic quarter in academic
---    year 2020-2021. The output should list {skill, quarter, number of feedbacks}

SELECT cd_sk.skill_name "skill name", cd_dt.date_academic_year_quarter "academic quarter (2020-2021)", COUNT(cd_fd.feedback_id)
FROM ClassDojo_FeedbackFact cd_fd
	 JOIN ClassDojo_SkillDim cd_sk ON cd.fd.skill_id = cd_sk.skill_id
	 JOIN ClassDojo_DateDim cd_dt ON (cd_fd.date_key = cd_dt.date_key AND cd_dt.date_academic_year = '2020-2021')
	 JOIN ClassDojo_ClassDim cd_cl ON cd_fd.class_key = cd_cl.class_key AND cd_cl.class_name = '**a given class**'
 GROUP BY cd_sk.skill_name, cd_dt.date_academic_year_quarter;
 


--- 5. List the monthly attendance status for students in a class for school year 2020-2021. The output should list
---    {student, month, status, number of attendance}

SELECT cd_st.student_key student, cd_dt.date_month "month", cd_at.attendance_status, COUNT(attendance_status) "# of attendance"
FROM ClassDojo_AttendanceFact cd_at
	JOIN ClassDojo_StudentDim cd_st ON cd_at.student_key = cd_st.student_key
	JOIN ClassDojo_DateDim cd_dt ON (cd_at.date_key = cd_dt.date_key AND cd_dt.date_academic_year = '2020-2021')
	JOIN ClassDojo_ClassDim cd_cl ON cd_at.class_key = cd_cl.class_key AND cd_cl.class_name = '**a given class**'
GROUP BY cd_st.student_key, cd_dt.date_month, cd_at.attendance_status;



--- 6. List the attendance status for students per school districts for schools in year 2020-2021. The output
---    should list {district, status, number of attendance}

SELECT cd_sch.school_district_name, cd_at.attendance_status, COUNT(attendance_status) "# of attendance"
FROM ClassDojo_AttendanceFact cd_at
	JOIN ClassDojo_SchoolDim cd_sch ON cd.at.school_key = cd_sch.school_key
	JOIN ClassDojo_DateDim cd_dt ON (cd_at.date_key = cd_dt.date_key AND cd_dt.date_academic_year = '2020-2021')
	JOIN ClassDojo_ClassDim cd_cl ON cd_at.class_key = cd_cl.class_key
GROUP BY cd_sch.school_district_name, cd_at.attendance_status;