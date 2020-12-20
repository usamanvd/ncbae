CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE DATABASE ncbae;

CREATE TABLE courses(
    id uuid DEFAULT uuid_generate_v4 (),
    course_name VARCHAR(30) NOT NULL,
    course_code VARCHAR(25) UNIQUE NOT NULL,
    course_type VARCHAR(7) NOT NULL CHECK(course_type = 'Regular' OR course_type = 'Weekend'),
    fee VARCHAR(50) NOT NULL,
    genre VARCHAR(25) NOT NULL,
    start_yr INTEGER NOT NULL,
    end_yr INTEGER NOT NULL
);
CREATE TABLE teachers(
    id uuid DEFAULT uuid_generate_v4 (),
    teacher_name VARCHAR(35) NOT NULL,
    gender VARCHAR(8) NOT NULL CHECK(gender = 'Male' OR gender = 'Female' OR gender = 'Other'),
    qualification VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(35) UNIQUE NOT NULL,
    course_name VARCHAR(40) NOT NULL,
    course_code VARCHAR(25) REFERENCES courses(course_code) NOT NULL,
    subject_name VARCHAR(40) NOT NULL,
    profile_pic TEXT NOT NULL

);
CREATE TABLE students(
    id uuid DEFAULT uuid_generate_v4 (),
    roll_no VARCHAR(20) UNIQUE NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    father_name VARCHAR(50) NOT NULL,
    gender VARCHAR(8) NOT NULL CHECK(gender = 'Male' OR gender = 'Female' OR gender = 'Other'),
    course_type VARCHAR(7) NOT NULL CHECK(course_type = 'Regular' OR course_type = 'Weekend'),
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(35) UNIQUE NOT NULL,
    student_address VARCHAR(100) NOT NULL,
    course_name VARCHAR(30) NOT NULL,
    start_yr INTEGER NOT NULL,
    end_yr INTEGER NOT NULL,
    course_code VARCHAR(25) REFERENCES courses(course_code) NOT NULL,
    profile_pic TEXT NOT NULL
);
INSERT INTO teachers(
    teacher_name,
    gender,
    qualification,
    phone,
    email,
    course_name,
    course_code,
    subject_name,
    profile_pic
) VALUES (
    'Mabroor',
    'Male',
    'full stack dev',
    '123456789',
    'mabroorr@gmail.com',
    'Computer Science',
    'CS-2019',
    'Intro to Database',
    ''
);
INSERT INTO courses(
    course_name,
    course_code, 
    course_type, 
    fee, 
    genre, 
    start_yr, 
    end_yr
) VALUES(
    'Database',
    'CS-2019',
    'Regular',
    '350000',
    'science',
    '2000',
    '2004'

);
INSERT INTO students(
    roll_no,
    student_name,
    father_name,
    gender,
    course_type,
    phone,
    email,
    student_address,
    course_name,
    start_yr,
    end_yr,
    course_code,
    profile_pic
    
) VALUES(
    '123334',
    'Usama binn',
    'naveed',
    'Male',
    'Regular',
    '1234444455545',
    'usamabin@gmail.com',
    'bsfkusf usnsufsianfje nsufnkn',
    'database',
    '2001',
    '2005',
    'CS-2019',
    ''
);