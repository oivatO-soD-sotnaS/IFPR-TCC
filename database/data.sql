USE `intellecta`;

-- Inserting Users
INSERT INTO `User` (`id_user`, `full_name`, `email`, `password`, `status`, `created_at`, `changed_at`, `profile_picture_url`) VALUES
-- Admins
('11111111-1111-1111-1111-111111111111', 'Admin One', 'admin1@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-01 08:00:00', '2023-01-01 08:00:00', 'https://example.com/profiles/admin1.jpg'),
('22222222-2222-2222-2222-222222222222', 'Admin Two', 'admin2@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-02 09:00:00', '2023-01-02 09:00:00', 'https://example.com/profiles/admin2.jpg'),

-- Teachers
('33333333-3333-3333-3333-333333333333', 'Professor Smith', 'prof.smith@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-03 10:00:00', '2023-01-03 10:00:00', 'https://example.com/profiles/smith.jpg'),
('44444444-4444-4444-4444-444444444444', 'Professor Johnson', 'prof.johnson@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-04 11:00:00', '2023-01-04 11:00:00', 'https://example.com/profiles/johnson.jpg'),
('55555555-5555-5555-5555-555555555555', 'Professor Williams', 'prof.williams@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-05 12:00:00', '2023-01-05 12:00:00', 'https://example.com/profiles/williams.jpg'),

-- Students
('66666666-6666-6666-6666-666666666666', 'Student Alice', 'alice@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-06 13:00:00', '2023-01-06 13:00:00', 'https://example.com/profiles/alice.jpg'),
('77777777-7777-7777-7777-777777777777', 'Student Bob', 'bob@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-07 14:00:00', '2023-01-07 14:00:00', 'https://example.com/profiles/bob.jpg'),
('88888888-8888-8888-8888-888888888888', 'Student Charlie', 'charlie@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-08 15:00:00', '2023-01-08 15:00:00', 'https://example.com/profiles/charlie.jpg'),
('99999999-9999-9999-9999-999999999999', 'Student Dana', 'dana@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-09 16:00:00', '2023-01-09 16:00:00', 'https://example.com/profiles/dana.jpg'),
('00000000-0000-0000-0000-000000000001', 'Student Evan', 'evan@example.com', '$2a$10$somehashedpassword', 'active', '2023-01-10 17:00:00', '2023-01-10 17:00:00', 'https://example.com/profiles/evan.jpg');

-- Inserting Institutes
INSERT INTO `Institute` (`id_institute`, `name`, `email`, `phone_number`, `description`, `thumbnail_url`, `banner_url`, `id_user`) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Tech University', 'contact@techuni.edu', '+1 555-123-4567', 'Leading technology university with focus on computer science and engineering.', 'https://example.com/institutes/techuni-thumb.jpg', 'https://example.com/institutes/techuni-banner.jpg', '11111111-1111-1111-1111-111111111111'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Business School', 'info@business.edu', '+1 555-987-6543', 'Premier institution for business and management education.', 'https://example.com/institutes/business-thumb.jpg', 'https://example.com/institutes/business-banner.jpg', '22222222-2222-2222-2222-222222222222');

-- Inserting InstitutionUser relationships
INSERT INTO `InstitutionUser` (`id_institute_user`, `id_institute`, `id_user`, `role`, `joined_at`) VALUES
-- Tech University admins
('cccccccc-cccc-cccc-cccc-cccccccccccc', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'admin', '2023-01-01 08:00:00'),
('dddddddd-dddd-dddd-dddd-dddddddddddd', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', 'teacher', '2023-01-03 10:00:00'),
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', 'teacher', '2023-01-04 11:00:00'),
('ffffffff-ffff-ffff-ffff-ffffffffffff', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '66666666-6666-6666-6666-666666666666', 'student', '2023-01-06 13:00:00'),
('11111111-1111-1111-1111-111111111112', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '77777777-7777-7777-7777-777777777777', 'student', '2023-01-07 14:00:00'),
('11111111-1111-1111-1111-111111111113', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '88888888-8888-8888-8888-888888888888', 'student', '2023-01-08 15:00:00'),

-- Business School admins
('22222222-2222-2222-2222-222222222223', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'admin', '2023-01-02 09:00:00'),
('33333333-3333-3333-3333-333333333334', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '55555555-5555-5555-5555-555555555555', 'teacher', '2023-01-05 12:00:00'),
('44444444-4444-4444-4444-444444444445', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '99999999-9999-9999-9999-999999999999', 'student', '2023-01-09 16:00:00'),
('55555555-5555-5555-5555-555555555556', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '00000000-0000-0000-0000-000000000001', 'student', '2023-01-10 17:00:00');

-- Inserting Classes
INSERT INTO `Class` (`id_class`, `name`, `description`, `thumbnail_url`, `banner_url`, `id_institute`) VALUES
-- Tech University classes
('66666666-6666-6666-6666-666666666661', 'CS101', 'Introduction to Computer Science', 'https://example.com/classes/cs101-thumb.jpg', 'https://example.com/classes/cs101-banner.jpg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),
('77777777-7777-7777-7777-777777777771', 'CS201', 'Data Structures and Algorithms', 'https://example.com/classes/cs201-thumb.jpg', 'https://example.com/classes/cs201-banner.jpg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),
('88888888-8888-8888-8888-888888888881', 'CS301', 'Database Systems', 'https://example.com/classes/cs301-thumb.jpg', 'https://example.com/classes/cs301-banner.jpg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),

-- Business School classes
('99999999-9999-9999-9999-999999999991', 'MBA101', 'Principles of Management', 'https://example.com/classes/mba101-thumb.jpg', 'https://example.com/classes/mba101-banner.jpg', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb'),
('00000000-0000-0000-0000-000000000011', 'MBA201', 'Financial Accounting', 'https://example.com/classes/mba201-thumb.jpg', 'https://example.com/classes/mba201-banner.jpg', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb');

-- Inserting ClassUser relationships
INSERT INTO `ClassUser` (`id_class_user`, `id_class`, `id_user`, `joined_at`) VALUES
-- CS101 students
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaab', '66666666-6666-6666-6666-666666666661', '66666666-6666-6666-6666-666666666666', '2023-01-15 09:00:00'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', '66666666-6666-6666-6666-666666666661', '77777777-7777-7777-7777-777777777777', '2023-01-15 09:00:00'),

-- CS201 students
('cccccccc-cccc-cccc-cccc-cccccccccccd', '77777777-7777-7777-7777-777777777771', '77777777-7777-7777-7777-777777777777', '2023-01-15 10:00:00'),
('dddddddd-dddd-dddd-dddd-ddddddddddde', '77777777-7777-7777-7777-777777777771', '88888888-8888-8888-8888-888888888888', '2023-01-15 10:00:00'),

-- CS301 students
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeef', '88888888-8888-8888-8888-888888888881', '66666666-6666-6666-6666-666666666666', '2023-01-15 11:00:00'),
('ffffffff-ffff-ffff-ffff-fffffffffff0', '88888888-8888-8888-8888-888888888881', '88888888-8888-8888-8888-888888888888', '2023-01-15 11:00:00'),

-- MBA101 students
('11111111-1111-1111-1111-111111111114', '99999999-9999-9999-9999-999999999991', '99999999-9999-9999-9999-999999999999', '2023-01-16 09:00:00'),
('22222222-2222-2222-2222-222222222225', '99999999-9999-9999-9999-999999999991', '00000000-0000-0000-0000-000000000001', '2023-01-16 09:00:00'),

-- MBA201 students
('33333333-3333-3333-3333-333333333336', '00000000-0000-0000-0000-000000000011', '00000000-0000-0000-0000-000000000001', '2023-01-16 10:00:00');

-- Inserting Disciplines
INSERT INTO `Discipline` (`id_discipline`, `name`, `description`, `thumbnail_url`, `banner_url`, `id_institute`, `id_user`) VALUES
-- Tech University disciplines
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'Computer Science', 'Fundamentals of computing and programming', 'https://example.com/disciplines/cs-thumb.jpg', 'https://example.com/disciplines/cs-banner.jpg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'Algorithms', 'Study of efficient algorithms and data structures', 'https://example.com/disciplines/algo-thumb.jpg', 'https://example.com/disciplines/algo-banner.jpg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444'),
('cccccccc-cccc-cccc-cccc-cccccccccccd', 'Database Systems', 'Design and implementation of database systems', 'https://example.com/disciplines/db-thumb.jpg', 'https://example.com/disciplines/db-banner.jpg', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333'),

-- Business School disciplines
('dddddddd-dddd-dddd-dddd-ddddddddddde', 'Management', 'Principles of business management', 'https://example.com/disciplines/mgmt-thumb.jpg', 'https://example.com/disciplines/mgmt-banner.jpg', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '55555555-5555-5555-5555-555555555555'),
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeef', 'Finance', 'Financial accounting and corporate finance', 'https://example.com/disciplines/fin-thumb.jpg', 'https://example.com/disciplines/fin-banner.jpg', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '55555555-5555-5555-5555-555555555555');

-- Inserting DisciplineClass relationships
INSERT INTO `DisciplineClass` (`id_discipline_class`, `id_class`, `id_discipline`) VALUES
-- Tech University
('ffffffff-ffff-ffff-ffff-fffffffffff1', '66666666-6666-6666-6666-666666666661', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac'),
('00000000-0000-0000-0000-000000000012', '77777777-7777-7777-7777-777777777771', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc'),
('11111111-1111-1111-1111-111111111115', '88888888-8888-8888-8888-888888888881', 'cccccccc-cccc-cccc-cccc-cccccccccccd'),

-- Business School
('22222222-2222-2222-2222-222222222226', '99999999-9999-9999-9999-999999999991', 'dddddddd-dddd-dddd-dddd-ddddddddddde'),
('33333333-3333-3333-3333-333333333337', '00000000-0000-0000-0000-000000000011', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeef');

-- Inserting Materials
INSERT INTO `Material` (`id_material`, `title`, `file_url`, `created_at`, `changed_at`, `id_discipline`) VALUES
-- Computer Science materials
('44444444-4444-4444-4444-444444444448', 'Introduction to Programming', 'https://example.com/materials/prog-intro.pdf', '2023-02-01 09:00:00', '2023-02-01 09:00:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac'),
('55555555-5555-5555-5555-555555555559', 'Python Basics', 'https://example.com/materials/python-basics.pdf', '2023-02-02 10:00:00', '2023-02-02 10:00:00', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac'),

-- Algorithms materials
('66666666-6666-6666-6666-666666666660', 'Sorting Algorithms', 'https://example.com/materials/sorting-algos.pdf', '2023-02-03 11:00:00', '2023-02-03 11:00:00', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc'),
('77777777-7777-7777-7777-777777777771', 'Graph Theory', 'https://example.com/materials/graph-theory.pdf', '2023-02-04 12:00:00', '2023-02-04 12:00:00', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc'),

-- Database materials
('88888888-8888-8888-8888-888888888882', 'SQL Basics', 'https://example.com/materials/sql-basics.pdf', '2023-02-05 13:00:00', '2023-02-05 13:00:00', 'cccccccc-cccc-cccc-cccc-cccccccccccd'),

-- Management materials
('99999999-9999-9999-9999-999999999993', 'Management Principles', 'https://example.com/materials/mgmt-principles.pdf', '2023-02-06 14:00:00', '2023-02-06 14:00:00', 'dddddddd-dddd-dddd-dddd-ddddddddddde'),

-- Finance materials
('00000000-0000-0000-0000-000000000014', 'Accounting Basics', 'https://example.com/materials/accounting-basics.pdf', '2023-02-07 15:00:00', '2023-02-07 15:00:00', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeef');

-- Inserting Assignments
INSERT INTO `Assignment` (`id_assignment`, `title`, `description`, `deadline`, `attachment`, `id_discipline`) VALUES
-- Computer Science assignments
('11111111-1111-1111-1111-111111111116', 'Programming Exercise 1', 'Write a simple calculator program in Python', '2023-03-01', 'https://example.com/assignments/prog-ex1.pdf', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac'),
('22222222-2222-2222-2222-222222222227', 'Midterm Project', 'Develop a small application with GUI', '2023-03-15', 'https://example.com/assignments/midterm-proj.pdf', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac'),

-- Algorithms assignments
('33333333-3333-3333-3333-333333333338', 'Sorting Implementation', 'Implement and compare sorting algorithms', '2023-03-05', 'https://example.com/assignments/sorting-impl.pdf', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc'),
('44444444-4444-4444-4444-444444444449', 'Graph Algorithms', 'Implement Dijkstra and Prim algorithms', '2023-03-20', 'https://example.com/assignments/graph-algos.pdf', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc'),

-- Database assignments
('55555555-5555-5555-5555-555555555550', 'Database Design', 'Design a database schema for a library', '2023-03-10', 'https://example.com/assignments/db-design.pdf', 'cccccccc-cccc-cccc-cccc-cccccccccccd'),

-- Management assignments
('66666666-6666-6666-6666-666666666661', 'Case Study Analysis', 'Analyze a management case study', '2023-03-08', 'https://example.com/assignments/case-study.pdf', 'dddddddd-dddd-dddd-dddd-ddddddddddde'),

-- Finance assignments
('77777777-7777-7777-7777-777777777772', 'Financial Statements', 'Prepare financial statements for a sample company', '2023-03-12', 'https://example.com/assignments/fin-statements.pdf', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeef');

-- Inserting Submissions
INSERT INTO `Submission` (`id_submission`, `id_assignment`, `id_user`, `submitted_at`, `file`, `grade`, `concept`, `feedback`) VALUES
-- Alice's submissions
('88888888-8888-8888-8888-888888888883', '11111111-1111-1111-1111-111111111116', '66666666-6666-6666-6666-666666666666', '2023-02-28 14:30:00', 'https://example.com/submissions/alice-ex1.zip', 9.5, 'Excellent', 'Great job! Code is well structured.'),
('99999999-9999-9999-9999-999999999994', '22222222-2222-2222-2222-222222222227', '66666666-6666-6666-6666-666666666666', '2023-03-14 16:45:00', 'https://example.com/submissions/alice-midterm.zip', 8.0, 'Good', 'Good implementation but needs better documentation.'),

-- Bob's submissions
('00000000-0000-0000-0000-000000000015', '11111111-1111-1111-1111-111111111116', '77777777-7777-7777-7777-777777777777', '2023-02-28 15:20:00', 'https://example.com/submissions/bob-ex1.zip', 7.5, 'Good', 'Works well but could be more efficient.'),
('11111111-1111-1111-1111-111111111117', '33333333-3333-3333-3333-333333333338', '77777777-7777-7777-7777-777777777777', '2023-03-04 11:10:00', 'https://example.com/submissions/bob-sorting.zip', 8.5, 'Very Good', 'Good comparison analysis.'),

-- Charlie's submissions
('22222222-2222-2222-2222-222222222228', '33333333-3333-3333-3333-333333333338', '88888888-8888-8888-8888-888888888888', '2023-03-05 09:30:00', 'https://example.com/submissions/charlie-sorting.zip', 9.0, 'Excellent', 'Very efficient implementations.'),
('33333333-3333-3333-3333-333333333339', '55555555-5555-5555-5555-555555555550', '88888888-8888-8888-8888-888888888888', '2023-03-09 17:00:00', 'https://example.com/submissions/charlie-dbdesign.pdf', 8.0, 'Good', 'Good design but missing some constraints.'),

-- Dana's submissions
('44444444-4444-4444-4444-444444444450', '66666666-6666-6666-6666-666666666661', '99999999-9999-9999-9999-999999999999', '2023-03-07 14:15:00', 'https://example.com/submissions/dana-case.pdf', 9.5, 'Excellent', 'Very thorough analysis.'),

-- Evan's submissions
('55555555-5555-5555-5555-555555555551', '66666666-6666-6666-6666-666666666661', '00000000-0000-0000-0000-000000000001', '2023-03-08 10:00:00', 'https://example.com/submissions/evan-case.pdf', 7.0, 'Satisfactory', 'Needs more depth in recommendations.'),
('66666666-6666-6666-6666-666666666662', '77777777-7777-7777-7777-777777777772', '00000000-0000-0000-0000-000000000001', '2023-03-11 13:45:00', 'https://example.com/submissions/evan-financials.xlsx', 8.5, 'Very Good', 'Well prepared with minor calculation errors.');

-- Inserting ForumMessages
INSERT INTO `ForumMessage` (`id_message`, `id_discipline`, `content`, `created_at`, `changed_at`) VALUES
-- Computer Science forum
('77777777-7777-7777-7777-777777777773', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'Hello everyone! I have a question about the first programming assignment. Can we use functions we haven\'t covered in class yet?', '2023-02-10 13:25:00', '2023-02-10 13:25:00'),
('88888888-8888-8888-8888-888888888884', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac', 'Yes, you can use any Python features you want as long as they help solve the problem correctly.', '2023-02-10 14:30:00', '2023-02-10 14:30:00'),

-- Algorithms forum
('99999999-9999-9999-9999-999999999995', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'For the sorting assignment, should we implement all algorithms from scratch or can we use built-in functions for parts of them?', '2023-02-15 11:20:00', '2023-02-15 11:20:00'),
('00000000-0000-0000-0000-000000000016', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc', 'You should implement the core algorithms yourself. You can use built-in functions for auxiliary operations like generating random numbers.', '2023-02-15 12:45:00', '2023-02-15 12:45:00'),

-- Management forum
('11111111-1111-1111-1111-111111111118', 'dddddddd-dddd-dddd-dddd-ddddddddddde', 'For the case study, how many references should we include?', '2023-02-20 09:15:00', '2023-02-20 09:15:00'),
('22222222-2222-2222-2222-222222222229', 'dddddddd-dddd-dddd-dddd-ddddddddddde', 'At least 5 academic references are required for full marks.', '2023-02-20 10:30:00', '2023-02-20 10:30:00');

-- Inserting Events
INSERT INTO `Event` (`id_event`, `title`, `description`, `event_date`, `created_at`, `changed_at`) VALUES
-- Institutional Events
('33333333-3333-3333-3333-333333333340', 'Orientation Day', 'Welcome event for new students', '2023-01-20 09:00:00', '2023-01-05 10:00:00', '2023-01-05 10:00:00'),
('44444444-4444-4444-4444-444444444451', 'Career Fair', 'Annual career fair with top companies', '2023-04-15 10:00:00', '2023-01-10 11:00:00', '2023-01-10 11:00:00'),

-- Discipline Events
('55555555-5555-5555-5555-555555555552', 'Guest Lecture: AI in Industry', 'Special lecture by industry expert on AI applications', '2023-02-28 14:00:00', '2023-01-15 12:00:00', '2023-01-15 12:00:00'),
('66666666-6666-6666-6666-666666666663', 'Midterm Review Session', 'Review session before the midterm exam', '2023-03-10 16:00:00', '2023-01-20 13:00:00', '2023-01-20 13:00:00'),

-- User Events
('77777777-7777-7777-7777-777777777774', 'Study Group Meeting', 'Study group for the algorithms class', '2023-03-05 18:00:00', '2023-02-01 14:00:00', '2023-02-01 14:00:00'),
('88888888-8888-8888-8888-888888888885', 'Project Deadline Reminder', 'Reminder for the database project deadline', '2023-03-09 23:59:00', '2023-02-05 15:00:00', '2023-02-05 15:00:00');

-- Inserting Institutional Events
INSERT INTO `InstitutionalEvent` (`id_institutional_event`, `id_event`, `id_institute`) VALUES
('99999999-9999-9999-9999-999999999996', '33333333-3333-3333-3333-333333333340', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa'),
('00000000-0000-0000-0000-000000000017', '44444444-4444-4444-4444-444444444451', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb');

-- Inserting Discipline Events
INSERT INTO `DisciplineEvent` (`id_discipline_event`, `id_event`, `id_discipline`) VALUES
('11111111-1111-1111-1111-111111111119', '55555555-5555-5555-5555-555555555552', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaac'),
('22222222-2222-2222-2222-222222222230', '66666666-6666-6666-6666-666666666663', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbc');

-- Inserting User Events
INSERT INTO `UserEvent` (`id_user_event`, `id_event`, `id_user`) VALUES
('33333333-3333-3333-3333-333333333341', '77777777-7777-7777-7777-777777777774', '77777777-7777-7777-7777-777777777777'),
('44444444-4444-4444-4444-444444444452', '88888888-8888-8888-8888-888888888885', '88888888-8888-8888-8888-888888888888');