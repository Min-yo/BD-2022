CREATE TABLE students (
    full_name varchar primary key,
    age int not null,
    bith_date int not null,
    gender varchar not null,
    average_grade int not null,
    info_about_yourself text,
    need_dorm boolean not null,
    add_info text
);

CREATE TABLE instructors(
    full_name varchar primary key,
    languages varchar not null,
    work expirience text not null,
    remote_lessons boolean not null
);

CREATE TABLE lesson_participants(
    lesson_title varchar not null,
    teaching_instructor varchar not null foreign key REFERENCES instructors(full_name),
    studying_students varchar,
    room_number int not null
);

