CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE DATABASE ncbae;

CREATE TABLE courses(
    id uuid DEFAULT uuid_generate_v4 (),
    course_name VARCHAR(60) NOT NULL,
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
    teacher_type VARCHAR(10) NOT NULL CHECK(teacher_type = 'Permanent' OR teacher_type = 'Visiting'),
    qualification VARCHAR(150) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    course_name VARCHAR(60) NOT NULL,
    course_code VARCHAR(25) REFERENCES courses(course_code) NOT NULL,
    subject_name VARCHAR(50) NOT NULL,
    profile_pic TEXT NOT NULL

);
CREATE TABLE students(
    id uuid DEFAULT uuid_generate_v4 (),
    roll_no VARCHAR(20) UNIQUE NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    father_name VARCHAR(50) NOT NULL,
    gender VARCHAR(8) NOT NULL CHECK(gender = 'Male' OR gender = 'Female' OR gender = 'Other'),
    course_type VARCHAR(7) NOT NULL CHECK(course_type = 'Regular' OR course_type = 'Weekend'),
    phone VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    student_address VARCHAR(200) NOT NULL,
    course_name VARCHAR(60) NOT NULL,
    start_yr INTEGER NOT NULL,
    end_yr INTEGER NOT NULL,
    course_code VARCHAR(25) REFERENCES courses(course_code) NOT NULL,
    profile_pic TEXT NOT NULL
);