-- Generated by Oracle SQL Developer Data Modeler 20.4.0.374.0801
--   at:        2021-03-31 18:42:26 CDT
--   site:      Oracle Database 12cR2
--   type:      Oracle Database 12cR2



DROP TABLE class_listing CASCADE CONSTRAINTS;

DROP TABLE class_story CASCADE CONSTRAINTS;

DROP TABLE class_teacher CASCADE CONSTRAINTS;

DROP TABLE comment_post CASCADE CONSTRAINTS;

DROP TABLE parentind CASCADE CONSTRAINTS;

DROP TABLE skill CASCADE CONSTRAINTS;

DROP TABLE story CASCADE CONSTRAINTS;

DROP TABLE story_like CASCADE CONSTRAINTS;

DROP TABLE student CASCADE CONSTRAINTS;

DROP TABLE student_enrollment CASCADE CONSTRAINTS;

DROP TABLE student_feedback CASCADE CONSTRAINTS;

DROP TABLE student_parent CASCADE CONSTRAINTS;

DROP TABLE student_story CASCADE CONSTRAINTS;

DROP TABLE teacher CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE class_listing (
    class_listing_id              NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 ),
    class_listing_name            VARCHAR2(30),
    class_listing_points_options  VARCHAR2(20) DEFAULT 'Total'
        CONSTRAINT "Point mode" CHECK ( class_listing_points_options IN ( 'Negative', 'Positive', 'Total' ) ),
    class_listing_points          NUMBER(3),
    class_listing_story_code      VARCHAR2(5),
    class_listing_grade           VARCHAR2(30),
    teacher_id                    NUMBER(10) NOT NULL CHECK ( teacher_id > 0 )
);

ALTER TABLE class_listing ADD CONSTRAINT class_pk PRIMARY KEY ( class_listing_id );

ALTER TABLE class_listing ADD CONSTRAINT story_code UNIQUE ( class_listing_story_code );

CREATE TABLE class_story (
    story_id                      NUMBER(10) NOT NULL CHECK ( story_id > 0 ),
    class_story_comments_allowed  VARCHAR2(5) DEFAULT 'True' CHECK ( class_story_comments_allowed IN ( 'False', 'True' ) ),
    class_listing_id              NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 ),
    teacher_id                    NUMBER(10) NOT NULL CHECK ( teacher_id > 0 )
);

ALTER TABLE class_story ADD CONSTRAINT class_story_pk PRIMARY KEY ( story_id );

CREATE TABLE class_teacher (
    class_listing_id  NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 ),
    teacher_id        NUMBER(10) NOT NULL CHECK ( teacher_id > 0 )
);

ALTER TABLE class_teacher ADD CONSTRAINT class_teacher_pk PRIMARY KEY ( class_listing_id,
                                                                        teacher_id );

CREATE TABLE comment_post (
    comment_post_id        NUMBER(10) NOT NULL CHECK ( comment_post_id > 0 ),
    comment_post_text      VARCHAR2(200),
    comment_post_datetime  DATE,
    parentind_id           NUMBER(10) NOT NULL CHECK ( parentind_id > 0 ),
    story_id               NUMBER(10) NOT NULL CHECK ( story_id > 0 )
);

ALTER TABLE comment_post ADD CONSTRAINT comment_pk PRIMARY KEY ( comment_post_id );

CREATE TABLE parentind (
    parentind_id          NUMBER(10) NOT NULL CHECK ( parentind_id > 0 ),
    parentind_first_name  VARCHAR2(30),
    parentind_last_name   VARCHAR2(30),
    parentind_email       VARCHAR2(40) CHECK ( parentind_email LIKE ( '%@%' ) )
);

ALTER TABLE parentind ADD CONSTRAINT parent_pk PRIMARY KEY ( parentind_id );

CREATE TABLE skill (
    skill_id          NUMBER(10) NOT NULL CHECK ( skill_id > 0 ),
    skill_name        VARCHAR2(30),
    skill_negpos      VARCHAR2(3) DEFAULT 'pos'
        CONSTRAINT "skill mode" CHECK ( skill_negpos IN ( 'neg', 'pos' ) ),
    skill_weight      NUMBER CHECK ( skill_weight BETWEEN - 5 AND 5 ),
    class_listing_id  NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 )
);

ALTER TABLE skill ADD CONSTRAINT skill_pk PRIMARY KEY ( skill_id );

CREATE TABLE story (
    story_id                NUMBER(10) NOT NULL CHECK ( story_id > 0 ),
    story_text              VARCHAR2(200),
    story_create_datetime   DATE,
    story_publish_datetime  DATE
);

ALTER TABLE story ADD CONSTRAINT story_pk PRIMARY KEY ( story_id );

CREATE TABLE story_like (
    parentind_id  NUMBER(10) NOT NULL CHECK ( parentind_id > 0 ),
    story_id      NUMBER(10) NOT NULL CHECK ( story_id > 0 )
);

ALTER TABLE story_like ADD CONSTRAINT story_like_pk PRIMARY KEY ( parentind_id,
                                                                  story_id );

CREATE TABLE student (
    student_id              NUMBER(10) NOT NULL CHECK ( student_id > 0 ),
    student_username        VARCHAR2(15),
    student_firstname       VARCHAR2(30),
    student_lastname        VARCHAR2(30),
    student_account_status  VARCHAR2(25) DEFAULT 'initialized'
        CONSTRAINT "Valid Statuses" CHECK ( student_account_status IN ( '', 'active', 'graduated', 'inactive', 'initialized' ) ),
    student_signup_date     DATE,
    student_access_code     VARCHAR2(5)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( student_id );

ALTER TABLE student ADD CONSTRAINT student_access_code UNIQUE ( student_access_code );

ALTER TABLE student ADD CONSTRAINT username UNIQUE ( student_username );

CREATE TABLE student_enrollment (
    student_id                          NUMBER(10) NOT NULL CHECK ( student_id > 0 ),
    class_listing_id                    NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 ),
    student_enrollment_points_total     NUMBER(3),
    student_enrollment_points_negative  NUMBER CHECK ( student_enrollment_points_negative BETWEEN - 5 AND 5 ),
    student_enrollment_points_positive  NUMBER CHECK ( student_enrollment_points_positive BETWEEN - 5 AND 5 )
);

ALTER TABLE student_enrollment ADD CONSTRAINT student_enrollment_pk PRIMARY KEY ( student_id,
                                                                                  class_listing_id );

CREATE TABLE student_feedback (
    student_feedback_id        NUMBER(10) NOT NULL CHECK ( student_feedback_id > 0 ),
    student_feedback_datetime  DATE,
    student_feedback_given_to  VARCHAR2(30) DEFAULT 'whole class'
        CONSTRAINT "feedback recipient" CHECK ( student_feedback_given_to IN ( 'individual student', 'whole class' ) ),
    student_feedback_note      VARCHAR2(200),
    student_feedback_points    NUMBER CHECK ( student_feedback_points BETWEEN - 5 AND 5 ),
    student_id                 NUMBER(10) NOT NULL CHECK ( student_id > 0 ),
    class_listing_id           NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 ),
    teacher_id                 NUMBER(10) NOT NULL CHECK ( teacher_id > 0 ),
    skill_id                   NUMBER(10) NOT NULL CHECK ( skill_id > 0 )
);

ALTER TABLE student_feedback ADD CONSTRAINT feedback_pk PRIMARY KEY ( student_feedback_id );

CREATE TABLE student_parent (
    student_id    NUMBER(10) NOT NULL CHECK ( student_id > 0 ),
    parentind_id  NUMBER(10) NOT NULL CHECK ( parentind_id > 0 )
);

ALTER TABLE student_parent ADD CONSTRAINT student_parent_pk PRIMARY KEY ( student_id,
                                                                          parentind_id );

CREATE TABLE student_story (
    story_id                NUMBER(10) NOT NULL CHECK ( story_id > 0 ),
    student_story_approved  VARCHAR2(5) DEFAULT 'False' CHECK ( student_story_approved IN ( 'False', 'True' ) ),
    student_id              NUMBER(10) NOT NULL CHECK ( student_id > 0 ),
    class_listing_id        NUMBER(10) NOT NULL CHECK ( class_listing_id > 0 ),
    teacher_id              NUMBER(10) NOT NULL CHECK ( teacher_id > 0 )
);

ALTER TABLE student_story ADD CONSTRAINT student_story_pk PRIMARY KEY ( story_id );

CREATE TABLE teacher (
    teacher_id         NUMBER(10) NOT NULL CHECK ( teacher_id > 0 ),
    teacher_last_name  VARCHAR2(30)
);

ALTER TABLE teacher ADD CONSTRAINT teacher_pk PRIMARY KEY ( teacher_id );

ALTER TABLE class_listing
    ADD CONSTRAINT class_admin FOREIGN KEY ( teacher_id )
        REFERENCES teacher ( teacher_id )
            ON DELETE CASCADE;

ALTER TABLE comment_post
    ADD CONSTRAINT class_commented FOREIGN KEY ( story_id )
        REFERENCES class_story ( story_id )
            ON DELETE CASCADE;

ALTER TABLE student_enrollment
    ADD CONSTRAINT class_enrolled FOREIGN KEY ( student_id )
        REFERENCES student ( student_id )
            ON DELETE CASCADE;

ALTER TABLE class_story
    ADD CONSTRAINT class_published FOREIGN KEY ( class_listing_id )
        REFERENCES class_listing ( class_listing_id )
            ON DELETE CASCADE;

ALTER TABLE student_story
    ADD CONSTRAINT class_setting FOREIGN KEY ( class_listing_id )
        REFERENCES class_listing ( class_listing_id )
            ON DELETE CASCADE;

ALTER TABLE student_feedback
    ADD CONSTRAINT class_settingv2 FOREIGN KEY ( class_listing_id )
        REFERENCES class_listing ( class_listing_id )
            ON DELETE CASCADE;

ALTER TABLE skill
    ADD CONSTRAINT class_settingv3 FOREIGN KEY ( class_listing_id )
        REFERENCES class_listing ( class_listing_id )
            ON DELETE CASCADE;

ALTER TABLE class_teacher
    ADD CONSTRAINT class_taught FOREIGN KEY ( class_listing_id )
        REFERENCES class_listing ( class_listing_id );

ALTER TABLE class_teacher
    ADD CONSTRAINT class_taughtv2 FOREIGN KEY ( teacher_id )
        REFERENCES teacher ( teacher_id );

ALTER TABLE student_feedback
    ADD CONSTRAINT feedback_given FOREIGN KEY ( student_id )
        REFERENCES student ( student_id )
            ON DELETE CASCADE;

ALTER TABLE student_story
    ADD CONSTRAINT inherited FOREIGN KEY ( story_id )
        REFERENCES story ( story_id );

ALTER TABLE class_story
    ADD CONSTRAINT inheritedv2 FOREIGN KEY ( story_id )
        REFERENCES story ( story_id );

ALTER TABLE story_like
    ADD CONSTRAINT liked FOREIGN KEY ( parentind_id )
        REFERENCES parentind ( parentind_id );

ALTER TABLE story_like
    ADD CONSTRAINT liked_story FOREIGN KEY ( story_id )
        REFERENCES story ( story_id );

ALTER TABLE student_parent
    ADD CONSTRAINT parental_relationshp FOREIGN KEY ( student_id )
        REFERENCES student ( student_id );

ALTER TABLE comment_post
    ADD CONSTRAINT posted_comment FOREIGN KEY ( parentind_id )
        REFERENCES parentind ( parentind_id )
            ON DELETE CASCADE;

ALTER TABLE student_feedback
    ADD CONSTRAINT relation_10 FOREIGN KEY ( skill_id )
        REFERENCES skill ( skill_id )
            ON DELETE CASCADE;

ALTER TABLE student_feedback
    ADD CONSTRAINT sender FOREIGN KEY ( teacher_id )
        REFERENCES teacher ( teacher_id )
            ON DELETE CASCADE;

ALTER TABLE student_story
    ADD CONSTRAINT story_approval FOREIGN KEY ( teacher_id )
        REFERENCES teacher ( teacher_id )
            ON DELETE CASCADE;

ALTER TABLE student_enrollment
    ADD CONSTRAINT student_enrolled FOREIGN KEY ( class_listing_id )
        REFERENCES class_listing ( class_listing_id )
            ON DELETE CASCADE;

ALTER TABLE student_parent
    ADD CONSTRAINT student_relationship FOREIGN KEY ( parentind_id )
        REFERENCES parentind ( parentind_id );

ALTER TABLE student_story
    ADD CONSTRAINT written_story FOREIGN KEY ( student_id )
        REFERENCES student ( student_id )
            ON DELETE CASCADE;

ALTER TABLE class_story
    ADD CONSTRAINT written_teacher FOREIGN KEY ( teacher_id )
        REFERENCES teacher ( teacher_id )
            ON DELETE CASCADE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             40
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
