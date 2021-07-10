/*------ ISQA8410 Project Part 2 Insert statements:
 *------ tables, attributes, and insertion values are tweaked based on differences in names are data types*/

INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (779350,'lily','Lily','Hughes','LS433','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (924836,'maci','Maci','Murphy','MY277','active', TO_DATE('08/25/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (202784,'michelle','Michelle', 'Kettler', 'MR382','active', TO_DATE('08/22/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (772490,'kate','Kate','Smith','KH796','active', TO_DATE('08/22/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (300797,'braden','Braden','Haas','BS418','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (974146,'parker','Parker','McCormick','PK791','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (727198,'abigail','Abigail','Timperio','AO496','active', TO_DATE('08/19/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (218331,'nico','Nico','Jackson','NN175','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (582062,'eli','Eli','Gartner','ER868','active', TO_DATE('08/20/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (905349,'addison','Addison','Nelsen','AN255','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (252342,'mary','Mary','Smith','MH638','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (352343,'patricia','Patricia','Johnson','PN859','initialized', TO_DATE('08/19/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (465234,'linda','Linda','Williams','LS252','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (622235,'jackson','Jackson','Jones','JS916','active', TO_DATE('08/20/2020', 'MM/DD/YYYY/'));
INSERT INTO student (student_id,student_username,student_firstname,student_lastname,student_access_code,student_account_status,student_signup_date) 
VALUES (622444,'ethan','Ethan','Jones','ES378','active', TO_DATE('08/21/2020', 'MM/DD/YYYY/'));


INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (398876,'Charles','Hughes','Charles@Hughes.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (464106,'Sue','Hughes','Sue@Hughes.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (222826,'Jessica','Murphy','Jessica@Murphy.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (928010,'Trent','Kettler','Trent@Kettler.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (186496,'Rihanna','Kettler','Rihanna@Kettler.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (962049,'Heidi','Smith','Heidi@Smith.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (845465,'Rachel','Haas','Rachel@Haas.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (512027,'Leslie','McCormick','Leslie@McCormick.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (501050,'Leah','Timperio','Leah@Timperio.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (977089,'Matt','Timperio','Matt@Timperio.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (833250,'Alysha','Jackson','Alysha@Jackson.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (680746,'Amanda','Gartner','Amanda@Gartner.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (889007,'Ralph','Nelsen','Ralph@Nelsen.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (927509,'Joshua','Williams','Joshua@Williams.edu');
INSERT INTO parentind (parentind_id,parentind_first_name,parentind_last_name,parentind_email) VALUES (972039,'Sarah','Jones','Sarah@Jones.edu');

INSERT INTO student_parent (parentind_id,student_id) VALUES (398876,779350);
INSERT INTO student_parent (parentind_id,student_id) VALUES (464106,779350);
INSERT INTO student_parent (parentind_id,student_id) VALUES (222826,924836);
INSERT INTO student_parent (parentind_id,student_id) VALUES (928010,202784);
INSERT INTO student_parent (parentind_id,student_id) VALUES (186496,202784);
INSERT INTO student_parent (parentind_id,student_id) VALUES (962049,772490);
INSERT INTO student_parent (parentind_id,student_id) VALUES (962049,252342);
INSERT INTO student_parent (parentind_id,student_id) VALUES (845465,300797);
INSERT INTO student_parent (parentind_id,student_id) VALUES (512027,974146);
INSERT INTO student_parent (parentind_id,student_id) VALUES (501050,727198);
INSERT INTO student_parent (parentind_id,student_id) VALUES (977089,727198);
INSERT INTO student_parent (parentind_id,student_id) VALUES (833250,218331);
INSERT INTO student_parent (parentind_id,student_id) VALUES (680746,582062);
INSERT INTO student_parent (parentind_id,student_id) VALUES (889007,905349);
INSERT INTO student_parent (parentind_id,student_id) VALUES (927509,465234);
INSERT INTO student_parent (parentind_id,student_id) VALUES (972039,622235);
INSERT INTO student_parent (parentind_id,student_id) VALUES (972039,622444);

INSERT INTO teacher (teacher_id,teacher_last_name) VALUES (13927,'Reynolds');
INSERT INTO teacher (teacher_id,teacher_last_name) VALUES (58761,'Wynn');
INSERT INTO teacher (teacher_id,teacher_last_name) VALUES (9164,'Fernandez');

INSERT INTO class_listing (class_listing_id,class_listing_name,class_listing_points_options,class_listing_points,class_listing_story_code,class_listing_grade,teacher_id) VALUES (15232,'Reynolds Class 2020-2021','Total',0,'WLK25','First Grade',13927);
INSERT INTO class_listing (class_listing_id,class_listing_name,class_listing_points_options,class_listing_points,class_listing_story_code,class_listing_grade,teacher_id) VALUES (15233,'Wynns Class 2020-2021','Positive',0,'WON95','Third Grade',58761);

INSERT INTO class_teacher (class_listing_id,teacher_id) VALUES (15232,58761);
INSERT INTO class_teacher (class_listing_id,teacher_id) VALUES (15232,9164);
INSERT INTO class_teacher (class_listing_id,teacher_id) VALUES (15233,13927);
INSERT INTO class_teacher (class_listing_id,teacher_id) VALUES (15233,9164);

INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos, class_listing_id) VALUES (1,'Working hard',3,'pos',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (2,'Following Directions',2,'pos',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (3,'Participating',3,'pos',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (4,'Teamwork',3,'pos',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (5,'Helping others',3,'pos',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (6,'Inappropriate Social Skills',2,'neg',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (7,'Talking out of Turn',1,'neg',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (8,'No homework',1,'neg',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (9,'Off Task',2,'neg',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (10,'Unsafe Behavior',5,'neg',15232);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (11,'Working hard',3,'pos',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (12,'Great Social Skills',4,'pos',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (13,'Participating',3,'pos',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (14,'Helping others',4,'pos',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (15,'Returning Homework',1,'pos',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (16,'Inappropriate Social Skills',2,'neg',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (17,'Talking out of Turn',1,'neg',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (18,'Running in Hallway',1,'neg',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (19,'Off Task',2,'neg',15233);
INSERT INTO skill (skill_id,skill_name,skill_weight, skill_negpos,class_listing_id) VALUES (20,'Unsafe Behavior',5,'neg',15233);

INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,779350,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,924836,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,202784,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,772490,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,300797,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,974146,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,727198,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,218331,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,582062,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15232,905349,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15233,252342,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15233,352343,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15233,465234,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15233,622235,0,0,0);
INSERT INTO student_enrollment (class_listing_id,student_id,student_enrollment_points_total,student_enrollment_points_negative,student_enrollment_points_positive) VALUES (15233,622444,0,0,0);



COMMIT;

