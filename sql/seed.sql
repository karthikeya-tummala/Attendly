-- =======================================
-- Organisation
-- =======================================
INSERT INTO organisations (name, code, address)
VALUES ('Gitam University', 'GU01', 'Rushikonda, Visakhapatnam, Andhra Pradesh');

-- =======================================
-- Faculty / Teachers (20)
-- =======================================
INSERT INTO people (name, email, role, organisation_id)
VALUES
    ('Arun Kumar', 'arun.kumar@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Priya Sharma', 'priya.sharma@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ravi Verma', 'ravi.verma@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Sonal Reddy', 'sonal.reddy@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Vikas Joshi', 'vikas.joshi@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Anjali Mehta', 'anjali.mehta@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Suresh Babu', 'suresh.babu@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Neha Gupta', 'neha.gupta@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Manoj Singh', 'manoj.singh@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Kavya Iyer', 'kavya.iyer@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Rajesh Kumar', 'rajesh.kumar@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Deepa Nair', 'deepa.nair@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Praveen Reddy', 'praveen.reddy@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Meera Singh', 'meera.singh@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ajay Kumar', 'ajay.kumar@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Shreya Sharma', 'shreya.sharma@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Vivek Rao', 'vivek.rao@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Lakshmi Menon', 'lakshmi.menon@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ankit Gupta', 'ankit.gupta@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Richa Kapoor', 'richa.kapoor@gitam.edu', 'teacher', (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- =======================================
-- Students (50)
-- =======================================
INSERT INTO people (name, email, role, organisation_id)
VALUES
    ('Aarav Sharma', 'aarav.sharma1@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ananya Reddy', 'ananya.reddy2@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Vihaan Kumar', 'vihaan.kumar3@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ishita Mehta', 'ishita.mehta4@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Arjun Verma', 'arjun.verma5@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Diya Singh', 'diya.singh6@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Rohan Babu', 'rohan.babu7@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Sanya Gupta', 'sanya.gupta8@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Krishna Rao', 'krishna.rao9@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Aisha Iyer', 'aisha.iyer10@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Kabir Singh', 'kabir.singh11@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Anika Nair', 'anika.nair12@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Advait Reddy', 'advait.reddy13@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Maya Sharma', 'maya.sharma14@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Dhruv Kumar', 'dhruv.kumar15@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ira Mehta', 'ira.mehta16@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Yash Verma', 'yash.verma17@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Tanya Singh', 'tanya.singh18@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Neil Babu', 'neil.babu19@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Riya Gupta', 'riya.gupta20@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Siddharth Rao', 'siddharth.rao21@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Aarohi Iyer', 'aarohi.iyer22@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Karan Sharma', 'karan.sharma23@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Navya Reddy', 'navya.reddy24@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ansh Kumar', 'ansh.kumar25@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ishaan Mehta', 'ishaan.mehta26@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Pooja Verma', 'pooja.verma27@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Raghav Singh', 'raghav.singh28@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Aditi Babu', 'aditi.babu29@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Viha Gupta', 'viha.gupta30@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Krish Rao', 'krish.rao31@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Naina Iyer', 'naina.iyer32@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ritesh Sharma', 'ritesh.sharma33@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Megha Reddy', 'megha.reddy34@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Dev Kumar', 'dev.kumar35@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ananya Mehta', 'ananya.mehta36@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Shiv Verma', 'shiv.verma37@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Rashmi Singh', 'rashmi.singh38@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Kabir Babu', 'kabir.babu39@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Anika Gupta', 'anika.gupta40@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Aryan Rao', 'aryan.rao41@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Diya Iyer', 'diya.iyer42@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Rohan Sharma', 'rohan.sharma43@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Isha Reddy', 'isha.reddy44@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Arnav Kumar', 'arnav.kumar45@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Saanvi Mehta', 'saanvi.mehta46@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Ayaan Verma', 'ayaan.verma47@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Tara Singh', 'tara.singh48@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Neil Babu', 'neil.babu49@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Anvi Gupta', 'anvi.gupta50@gitam.edu', 'student', (SELECT organisation_id FROM organisations WHERE code='GU01'));


-- =======================================
-- Courses (10)
-- =======================================
INSERT INTO courses (name, code, organisation_id)
VALUES
    ('Computer Networks', 'CSEN3001', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Data Structures', 'CSEN2001', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Database Systems', 'CSEN3002', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Operating Systems', 'CSEN3003', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Digital Electronics', 'EECE2010', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Microprocessors', 'EECE3001', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Signals and Systems', 'EECE2002', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Software Engineering', 'CSEN4001', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Artificial Intelligence', 'CSEN4002', (SELECT organisation_id FROM organisations WHERE code='GU01')),
    ('Embedded Systems', 'EECE4001', (SELECT organisation_id FROM organisations WHERE code='GU01'));


-- =======================================
-- Classes / Sections for each course
-- =======================================

-- Computer Networks - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Computer Networks - A', (SELECT course_id FROM courses WHERE code='CSEN3001'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Data Structures - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Data Structures - A', (SELECT course_id FROM courses WHERE code='CSEN2001'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Database Systems - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Database Systems - A', (SELECT course_id FROM courses WHERE code='CSEN3002'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Operating Systems - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Operating Systems - A', (SELECT course_id FROM courses WHERE code='CSEN3003'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Digital Electronics - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Digital Electronics - A', (SELECT course_id FROM courses WHERE code='EECE2010'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Microprocessors - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Microprocessors - A', (SELECT course_id FROM courses WHERE code='EECE3001'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Signals and Systems - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Signals and Systems - A', (SELECT course_id FROM courses WHERE code='EECE2002'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Software Engineering - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Software Engineering - A', (SELECT course_id FROM courses WHERE code='CSEN4001'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Artificial Intelligence - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Artificial Intelligence - A', (SELECT course_id FROM courses WHERE code='CSEN4002'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));

-- Embedded Systems - 1 class
INSERT INTO classes (name, course_id, organisation_id)
VALUES ('Embedded Systems - A', (SELECT course_id FROM courses WHERE code='EECE4001'),
        (SELECT organisation_id FROM organisations WHERE code='GU01'));


-- =======================================
-- Schedule assignments for classes
-- =======================================

-- For simplicity, 2 rooms per floor: SB 101, SB 102, VB 201, VB 202, etc.
-- day_of_week: 1=Monday ... 5=Friday

-- Class: Computer Networks - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Computer Networks - A'),
           1, '08:00-08:50', 'SB101',
           (SELECT person_id FROM people WHERE name='Arun Kumar')
       );

-- Data Structures - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Data Structures - A'),
           1, '09:00-09:50', 'SB102',
           (SELECT person_id FROM people WHERE name='Priya Sharma')
       );

-- Database Systems - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Database Systems - A'),
           2, '08:00-08:50', 'VB201',
           (SELECT person_id FROM people WHERE name='Ravi Verma')
       );

-- Operating Systems - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Operating Systems - A'),
           2, '09:00-09:50', 'VB202',
           (SELECT person_id FROM people WHERE name='Sonal Reddy')
       );

-- Digital Electronics - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Digital Electronics - A'),
           3, '08:00-08:50', 'SB201',
           (SELECT person_id FROM people WHERE name='Vikas Joshi')
       );

-- Microprocessors - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Microprocessors - A'),
           3, '09:00-09:50', 'SB202',
           (SELECT person_id FROM people WHERE name='Anjali Mehta')
       );

-- Signals and Systems - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Signals and Systems - A'),
           4, '08:00-08:50', 'VB301',
           (SELECT person_id FROM people WHERE name='Suresh Babu')
       );

-- Software Engineering - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Software Engineering - A'),
           4, '09:00-09:50', 'VB302',
           (SELECT person_id FROM people WHERE name='Neha Gupta')
       );

-- Artificial Intelligence - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Artificial Intelligence - A'),
           5, '08:00-08:50', 'SB301',
           (SELECT person_id FROM people WHERE name='Manoj Singh')
       );

-- Embedded Systems - A
INSERT INTO schedules (class_id, day_of_week, slot, location, teacher_id)
VALUES (
           (SELECT class_id FROM classes WHERE name='Embedded Systems - A'),
           5, '09:00-09:50', 'SB302',
           (SELECT person_id FROM people WHERE name='Kavya Iyer')
       );


-- =======================================
-- Assign students to classes and courses
-- =======================================

-- Step 1: Map students to courses (at least 3 per student)
DO $$
DECLARE
student RECORD;
    course_ids UUID[];
    i INT;
BEGIN
FOR student IN SELECT person_id FROM people WHERE role='student' LOOP
-- pick 3 random courses for the student
SELECT array_agg(course_id) INTO course_ids FROM (
                                                     SELECT course_id FROM courses ORDER BY random() LIMIT 3
                                                 ) sub;

FOR i IN 1..array_length(course_ids, 1) LOOP
            INSERT INTO student_courses (student_id, course_id)
            VALUES (student.person_id, course_ids[i])
            ON CONFLICT DO NOTHING;
END LOOP;
END LOOP;
END $$;

-- Step 2: Assign students to classes without time conflicts
DO $$
DECLARE
student RECORD;
    cls RECORD;
    assigned_slots TEXT[];
BEGIN
FOR student IN SELECT person_id FROM people WHERE role='student' LOOP
        assigned_slots := ARRAY[]::TEXT[];

-- get all classes of student's courses
FOR cls IN
SELECT c.class_id, s.day_of_week, s.slot
FROM classes c
         JOIN schedules s ON c.class_id = s.class_id
         JOIN student_courses sc ON sc.course_id = c.course_id
WHERE sc.student_id = student.person_id
ORDER BY random()
    LOOP
            -- only assign if no slot conflict
            IF NOT (cls.day_of_week || '-' || cls.slot = ANY (assigned_slots)) THEN
INSERT INTO student_classes (student_id, class_id)
VALUES (student.person_id, cls.class_id)
ON CONFLICT DO NOTHING;

-- mark slot as assigned
assigned_slots := array_append(assigned_slots, cls.day_of_week || '-' || cls.slot);
END IF;
END LOOP;
END LOOP;
END $$;
