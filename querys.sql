-- faculty table
create database resource_mangement;

use resource_mangement;

create table facultyCred(
    id varchar(16) primary key, 
    pass varchar(255) not null 
);

-- example values 
insert into facultyCred(id,pass) values("15FCS01","$2a$12$VUSD44Y.asCx7B6fZd0au.AGyHeWueLaLyiCMjgweVV1M4oDh0NRK"); -- fac_0011
insert into facultyCred(id,pass) values("15FCS02","$2a$12$XmbhYXwVbMluDx6KPY5uKuyk2/fTAFv4iBB76If31SmeqjTwhAXY6"); -- chocho_79

select * from facultyCred where id = ?;


-------------------------------------------------------------------------------------------------------------------------------------

-- admin table

create table adminCred(
    id varchar(16) primary key,
    pass varchar(255) not null 
);
insert into adminCred(id,pass) values("admin","$2a$12$GItZp0K210risZyDfRuYVO1DOxYRIhpRN6QM7RY29RA8qsd2xNyXu"); -- admin

-------------------------------------------------------------------------------------------------------------------------------------

-- student table

create table studentCred(
    id varchar(16) primary key,
    pass varchar(255) not null 
);
insert into studentCred(id,pass) values("22ucs622","$2a$12$CABFTzxYI2l6IPu2Y2r9De89bs5kXrZQ085vG2A45Ktb45egaAvQq"); -- iamstd@123


CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    noteDate DATE NOT NULL,
    hour INT NOT NULL CHECK (hour BETWEEN 1 AND 5),
    student_id VARCHAR(16) NOT NULL,
    attenSts ENUM('Present', 'Absent') NOT NULL, 
    CONSTRAINT FK_student_id FOREIGN KEY (student_id)
        REFERENCES studentCred(id) 
        ON DELETE CASCADE
);






SELECT course_enrolled.student_id FROM faculty JOIN Faculty_course_Assigned ON faculty.faculty_id = Faculty_course_Assigned.faculty_id JOIN course ON Faculty_course_Assigned.course_id = course.course_id JOIN class ON Faculty_course_Assigned.class_id = class.class_id JOIN course_enrolled ON course.course_id = course_enrolled.course_id WHERE faculty.faculty_id = '01ccs123';