-- =======================================
-- DROP EXISTING TABLES
-- =======================================
DROP TABLE IF EXISTS attendance CASCADE;
DROP TABLE IF EXISTS schedules CASCADE;
DROP TABLE IF EXISTS teacher_classes CASCADE;
DROP TABLE IF EXISTS student_classes CASCADE;
DROP TABLE IF EXISTS classes CASCADE;
DROP TABLE IF EXISTS course_teachers CASCADE;
DROP TABLE IF EXISTS student_courses CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS holidays CASCADE;
DROP TABLE IF EXISTS organisations CASCADE;

-- =======================================
-- DROP ENUMS
-- =======================================
DROP TYPE IF EXISTS person_role CASCADE;
DROP TYPE IF EXISTS attendance_method CASCADE;
DROP TYPE IF EXISTS class_slot CASCADE;

-- =======================================
-- ENABLE UUID GENERATION
-- =======================================
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- =======================================
-- ENUMS
-- =======================================
CREATE TYPE person_role AS ENUM ('student','teacher','admin');

CREATE TYPE attendance_method AS ENUM ('qr', 'face', 'biometric', 'manual');

CREATE TYPE class_slot AS ENUM (
    '08:00-08:50','09:00-09:50','10:00-10:50','11:00-11:50',
    '12:00-12:50','13:00-13:50','14:00-14:50','15:00-15:50'
);

-- =======================================
-- ORGANISATIONS
-- =======================================
CREATE TABLE organisations (
                               organisation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                               name VARCHAR(150) NOT NULL,
                               code CHAR(4) NOT NULL UNIQUE,
                               address TEXT,
                               created_at TIMESTAMP DEFAULT NOW(),
                               updated_at TIMESTAMP DEFAULT NOW()
);

-- =======================================
-- PEOPLE
-- =======================================
CREATE TABLE people (
                        person_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                        name VARCHAR(100) NOT NULL,
                        email VARCHAR(150) UNIQUE NOT NULL,
                        role person_role NOT NULL,
                        organisation_id UUID REFERENCES organisations(organisation_id),
                        created_at TIMESTAMP DEFAULT NOW(),
                        updated_at TIMESTAMP DEFAULT NOW()
);

-- =======================================
-- COURSES
-- =======================================
CREATE TABLE courses (
                         course_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         name VARCHAR(150) NOT NULL,
                         code CHAR(8) NOT NULL,
                         organisation_id UUID REFERENCES organisations(organisation_id),
                         created_at TIMESTAMP DEFAULT NOW(),
                         updated_at TIMESTAMP DEFAULT NOW()
);

-- Student-Course join table
CREATE TABLE student_courses (
                                 student_id UUID REFERENCES people(person_id),
                                 course_id UUID REFERENCES courses(course_id),
                                 PRIMARY KEY(student_id, course_id)
);

-- Teacher-Course join table
CREATE TABLE course_teachers (
                                 teacher_id UUID REFERENCES people(person_id),
                                 course_id UUID REFERENCES courses(course_id),
                                 PRIMARY KEY(teacher_id, course_id)
);

-- =======================================
-- CLASSES / SECTIONS
-- =======================================
CREATE TABLE classes (
                         class_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         name VARCHAR(50),
                         course_id UUID REFERENCES courses(course_id),
                         organisation_id UUID REFERENCES organisations(organisation_id),
                         created_at TIMESTAMP DEFAULT NOW(),
                         updated_at TIMESTAMP DEFAULT NOW()
);

-- Student-Class join table
CREATE TABLE student_classes (
                                 student_id UUID REFERENCES people(person_id),
                                 class_id UUID REFERENCES classes(class_id),
                                 PRIMARY KEY(student_id, class_id)
);

-- Teacher-Class join table
CREATE TABLE teacher_classes (
                                 teacher_id UUID REFERENCES people(person_id),
                                 class_id UUID REFERENCES classes(class_id),
                                 PRIMARY KEY(teacher_id, class_id)
);

-- =======================================
-- SCHEDULES
-- =======================================
CREATE TABLE schedules (
                           schedule_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                           class_id UUID REFERENCES classes(class_id),
                           teacher_id UUID REFERENCES people(person_id),
                           day_of_week INT NOT NULL CHECK(day_of_week BETWEEN 1 AND 7),
                           slot class_slot NOT NULL,
                           location VARCHAR(5) NOT NULL CHECK(location ~ '^(SB|VB)[1-6][0-3][0-9]$'),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- =======================================
-- ATTENDANCE
-- =======================================
CREATE TABLE attendance (
                            attendance_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                            student_id UUID NOT NULL REFERENCES people(person_id),
                            class_id UUID REFERENCES classes(class_id),
                            course_id UUID REFERENCES courses(course_id),
                            attendance_date DATE NOT NULL,
                            status VARCHAR(10) NOT NULL CHECK (status IN ('present','absent','late','excused')),
                            method attendance_method NOT NULL,
                            metadata JSONB,
                            marked_by UUID REFERENCES people(person_id),
                            created_at TIMESTAMP DEFAULT NOW(),
                            updated_at TIMESTAMP DEFAULT NOW(),
                            UNIQUE(student_id, class_id, attendance_date)
);

-- =======================================
-- HOLIDAYS
-- =======================================
CREATE TABLE holidays (
                          holiday_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          organisation_id UUID REFERENCES organisations(organisation_id),
                          date DATE NOT NULL,
                          description VARCHAR(100),
                          UNIQUE(organisation_id, date)
);

-- Pre-fill common Indian public holidays
INSERT INTO holidays (organisation_id, date, description)
SELECT organisation_id, '2025-01-26'::DATE, 'Republic Day' FROM organisations
UNION ALL
SELECT organisation_id, '2025-08-15'::DATE, 'Independence Day' FROM organisations
UNION ALL
SELECT organisation_id, '2025-10-02'::DATE, 'Gandhi Jayanti' FROM organisations;

ALTER TABLE people
    ADD COLUMN roll_no VARCHAR(20) UNIQUE;

ALTER TABLE people
    ADD COLUMN emp_id VARCHAR(20) UNIQUE;


ALTER TABLE people DROP CONSTRAINT IF EXISTS student_roll_no_check;
ALTER TABLE people DROP CONSTRAINT IF EXISTS teacher_emp_id_check;

ALTER TABLE people
    ADD CONSTRAINT student_roll_no_check
        CHECK (role='student' OR roll_no IS NULL);

ALTER TABLE people
    ADD CONSTRAINT teacher_emp_id_check
        CHECK (role='teacher' OR emp_id IS NULL);

-- =======================================
-- Update student roll numbers (10-char alphanumeric)
-- =======================================
DO $$
    DECLARE
        stu RECORD;
        roll VARCHAR(10);
    BEGIN
        FOR stu IN SELECT person_id FROM people WHERE role='student' LOOP
                roll := substring(md5(random()::text) from 1 for 10); -- random 10 chars
                UPDATE people
                SET roll_no = roll
                WHERE person_id = stu.person_id;
            END LOOP;
    END $$;

-- =======================================
-- Update teacher employee IDs (5-char alphanumeric)
-- =======================================
DO $$
    DECLARE
        tch RECORD;
        eid VARCHAR(5);
    BEGIN
        FOR tch IN SELECT person_id FROM people WHERE role='teacher' LOOP
                eid := substring(md5(random()::text) from 1 for 5); -- random 5 chars
                UPDATE people
                SET emp_id = eid
                WHERE person_id = tch.person_id;
            END LOOP;
    END $$;

ALTER TABLE people ADD COLUMN password_hash VARCHAR(255);
