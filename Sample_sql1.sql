-- Sample_sql1.sql
-- Author: TreeTree Chess@github https://github.com/Treetreechess

-- Table: STUDENT
CREATE TABLE STUDENT (
    SID CHAR(6) PRIMARY KEY, 
    SNAME VARCHAR (255) NOT NULL, 
    CLASS CHAR (2) NOT NULL, 
    CNO INT NOT NULL, 
    SEX CHAR(1) NOT NULL, 
    DOB DATE
    );

INSERT INTO STUDENT (SID, SNAME, CLASS, CNO, SEX, DOB) VALUES 
('000001', 'Abby Chan', '1A', 1, 'F', '2000-01-01'),
('000002', 'Ada Chan', '1A', 2, 'F', '2000-02-09'),
('010122', 'Chris Wong', '1A', 5, 'F', '2011-02-01'),
('010142', 'Nico Lin', '1C', 7, 'M', '2011-08-21'),
('010133', 'Amy Chan', '2D', 12, 'F', '2010-03-06'),
('010001', 'Chan Tai Man', '2B', 20, 'M', '2005-07-31'),
('034005', 'Ma Ming', '2B', 21, 'M', '2004-02-15'),
('010193', 'Chris Wong', '3A', 2, 'M', '2002-10-31');

-- Table: CONTACT
CREATE TABLE CONTACT(
    SID CHAR (6) PRIMARY KEY,
    PHONE CHAR (8),
    EMAIL VARCHAR (255),
    FOREIGN KEY(SID) REFERENCES STUDENT(SID),
    CHECK(EMAIL LIKE '%@%')
    );

INSERT INTO CONTACT (SID, PHONE, EMAIL) VALUES 
('000001', '13331333', 'abbyc@ict.org'),
('000002', '13331333', 'adda@fun.ict'),
('010122', '11112222', 'chriswong1@abc123.com'),
('010142', '22332233', 'nicolin1@abc123.com'),
('010133', '00770055', 'amychan1@abc123.com'),
('010001', '73797300', 'rock@asdf.xyz'),
('010193', '46649999', 'wong333@good.info');

-- Table: RESULT
CREATE TABLE RESULT(
SID CHAR (6) PRIMARY KEY,
MARK REAL NOT NULL,
FOREIGN KEY(SID) REFERENCES STUDENT(SID)
);

INSERT INTO RESULT (SID, MARK) VALUES 
('000001', 55.0),
('000002', 99.0),
('010122', 19.4),
('010142', 34.8),
('010133', -97.5),
('010001', 67.3),
('034005', 22.8),
('010193', 40.0);

-- Table: TEACHER
CREATE TABLE TEACHER (
    TID CHAR(4) PRIMARY KEY, 
    TNAME VARCHAR (255) NOT NULL,
    SEX CHAR(1) NOT NULL, 
    DOB DATE
    );

INSERT INTO TEACHER (TID,TNAME,SEX,DOB) VALUES 
('0001', 'Henry Chan','M','1999-04-27'),
('0002', 'Ken Yan','M','1976-09-22'),
('0003', 'Lily Ng','F','2001-03-02'),
('0004', 'Roy Cheung','M','1977-12-11'),
('0006', 'Jane Au','F','1998-07-22'),
('0015', 'Tammy Yuen','F','1991-08-06');

-- Table: CLUB
CREATE TABLE CLUB (
    CID CHAR(3) PRIMARY KEY, 
    CNAME VARCHAR (255) NOT NULL UNIQUE, 
    TIC_TID CHAR(4) NOT NULL,
    FOREIGN KEY(TIC_TID) REFERENCES TEACHER(TID)
    );

INSERT INTO CLUB (CID,CNAME,TIC_TID) VALUES 
('A01', 'Dance Club','0004'),
('B02', 'Drama Club','0015'),
('D18', 'IT Club','0002'),
('G30', 'Chess Club','0001'),
('F20', 'Ukelele Club','0004'),
('A05', 'Sports Club','0006');

-- Table: CLUB_ENROL
CREATE TABLE CLUB_ENROL (
    CID CHAR(3) NOT NULL,
    SID CHAR(6) NOT NULL,
    FOREIGN KEY(CID) REFERENCES CLUB(CID),
    FOREIGN KEY(SID) REFERENCES STUDENT(SID)
    );

INSERT INTO CLUB_ENROL (CID,SID) VALUES 
('A01', '000001'),
('B02', '010122'),
('A01', '000002');

-- Table: CLASS
CREATE TABLE CLASS (
    CLASS CHAR (2) PRIMARY KEY,
    ROOM CHAR(3) NOT NULL UNIQUE,
    CTEACHER_TID CHAR(4) NOT NULL UNIQUE,
    FOREIGN KEY(CTEACHER_TID) REFERENCES TEACHER(TID)
    );

INSERT INTO CLASS VALUES 
('1A', '101','0003'),
('1C', '202','0001'),
('2D', '112','0002'),
('3A', '213','0006');

-- Table: SUBJECT
CREATE TABLE SUBJECT (
    SUBID CHAR(2) PRIMARY KEY, 
    SUBNAME VARCHAR (128) NOT NULL UNIQUE
    );

INSERT INTO SUBJECT VALUES 
('01', 'English Lang.'),
('02', 'Chinese Lang.'),
('03', 'Maths.'),
('04', 'ICT'),
('05', 'BAFS'),
('06', 'Physics');

-- Table: SUBJECT_TEACH
CREATE TABLE SUBJECT_TEACH (
    SUBID CHAR(2) NOT NULL,
    TID CHAR(4) NOT NULL,
    FOREIGN KEY(SUBID) REFERENCES SUBJECT(SUBID),
    FOREIGN KEY(TID) REFERENCES TEACHER(TID)
    );

INSERT INTO SUBJECT_TEACH VALUES 
('01', '0001'),
('02', '0001'),
('01', '0006'),
('04', '0004'),
('03', '0002'),
('01', '0003'),
('05', '0003'),
('06', '0004');

-- Table: SUBJECT_TAKE
CREATE TABLE SUBJECT_TEACH (
    SUBID CHAR(2) NOT NULL,
    SID CHAR(6) NOT NULL,
    FOREIGN KEY(SUBID) REFERENCES SUBJECT(SUBID),
    FOREIGN KEY(SID) REFERENCES STUDENT(SID)
    );

INSERT INTO SUBJECT_TAKE VALUES 
('01', '000001'),
('03', '000002'),
('02', '000002'),
('04', '034005'),
('02', '010122');
