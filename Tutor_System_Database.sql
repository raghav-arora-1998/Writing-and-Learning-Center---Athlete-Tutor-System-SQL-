CREATE DATABASE tutor_system;
USE tutor_system;
#DROP DATABASE tutor_system;


CREATE TABLE locations (
location_id INT AUTO_INCREMENT,
location_name VARCHAR(100),
location_type VARCHAR(50),
delivery_type VARCHAR(50),
PRIMARY KEY (location_id)
);

CREATE TABLE managers(
manager_id INT AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(100),
PRIMARY KEY (manager_id)
);

CREATE TABLE coaches (
coach_id INT AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(100),
sport VARCHAR(100),
manager_id INT,
PRIMARY KEY (coach_id),
FOREIGN KEY (manager_id) REFERENCES managers (manager_id)
);

CREATE TABLE athletes (
athlete_id INT AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(100),
gpa FLOAT,
gender VARCHAR(20),
sport VARCHAR(100),
academic_year INT,
required BOOLEAN,
coach_id INT,
PRIMARY KEY (athlete_id),
FOREIGN KEY (coach_id) REFERENCES coaches (coach_id)
);

CREATE TABLE tutors (
tutor_id INT AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(100),
subject_name VARCHAR(50),
PRIMARY KEY (tutor_id)
);

CREATE TABLE subjects (
subject_id INT AUTO_INCREMENT,
subject_name VARCHAR(50),
class_number INT,
tutor_id INT,
PRIMARY KEY (subject_id),
FOREIGN KEY (tutor_id) REFERENCES tutors (tutor_id)
);

CREATE TABLE employees ( 
employee_id INT AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(100),
manager_id INT,
PRIMARY KEY (employee_id),
FOREIGN KEY (manager_id) REFERENCES managers (manager_id)
);

CREATE TABLE appointments (
appointment_id INT AUTO_INCREMENT,
scheduled_time TIME,
employee_id INT,
location_id INT,
completed VARCHAR(50),
PRIMARY KEY (appointment_id),
FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
FOREIGN KEY (location_id) REFERENCES locations (location_id)
);

CREATE TABLE athlete_tutor (
athlete_id INT,
tutor_id INT,
PRIMARY KEY (athlete_id, tutor_id),
FOREIGN KEY (athlete_id) REFERENCES athletes (athlete_id),
FOREIGN KEY (tutor_id) REFERENCES tutors (tutor_id)
);

CREATE TABLE athlete_tutor_subject_appointments (
athlete_id INT,
tutor_id INT,
subject_id INT,
appointment_id INT,
PRIMARY KEY (athlete_id, tutor_id, subject_id, appointment_id),
FOREIGN KEY (athlete_id) REFERENCES athletes (athlete_id),
FOREIGN KEY (tutor_id) REFERENCES tutors (tutor_id),
FOREIGN KEY (subject_id) REFERENCES subjects (subject_id),
FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id)
);


#####################################################################################################################################################################
#POPULATING


SELECT * FROM locations;

INSERT INTO locations VALUES(NULL, "Library","computer_lab","in_person");
INSERT INTO locations VALUES(NULL, "Yakitutu","classroom","inPerson");
INSERT INTO locations VALUES(NULL, "Cerro","classroom","in_person");
INSERT INTO locations VALUES(NULL, "PCV","computer_lab","in_person");
INSERT INTO locations VALUES(NULL, "online","online","online");
INSERT INTO locations VALUES(NULL, "Library","office","in_person");
INSERT INTO locations VALUES(NULL, "Cerro","computer_lab","in_person");
INSERT INTO locations VALUES(NULL, "PCV","classroom","in_person");
INSERT INTO locations VALUES(NULL, "Library","classroom","in_person");
INSERT INTO locations VALUES(NULL, "online","online","online");



SELECT * FROM managers;

INSERT INTO managers VALUES(NULL, "Jeff","Schmidt","JScmidty5@hotmail.com");
INSERT INTO managers VALUES(NULL, "Berry","McCaulkner","BigBerry72@gmail.com");
INSERT INTO managers VALUES(NULL, "Anaita","Agoodgrade","faliure9078@gmail.com");



SELECT * FROM coaches;

INSERT INTO coaches VALUES(NULL, "Jack","Dirkson","JDillaDirks43@yahoo.co.uk","football",1);
INSERT INTO coaches VALUES(NULL, "Jeffrey","Dahmer","Justonephoto@gmail.com","track",1);
INSERT INTO coaches VALUES(NULL, "Hunt","Forseer","Hunt4you@gmail.com","basketball",2);
INSERT INTO coaches VALUES(NULL, "Dingus","McCrinkleberry","Crinkleberries@gmail.com","tennis",2);
INSERT INTO coaches VALUES(NULL, "Danger","Ismymiddlename","dangy543@gmail.com","soccer",3);
INSERT INTO coaches VALUES(NULL, "Whistle","Stevenson","whistleofficial@yahoo.com","tennis",3);
INSERT INTO coaches VALUES(NULL, "Large","Tallon","bodybuildingislyf@bodybuilders.com","track",3);
INSERT INTO coaches VALUES(NULL, "Boy","Tall","broomsarelife@hotmail.com","basketball",2);
INSERT INTO coaches VALUES(NULL, "Bradley","Silversprings","BSilverSprings69@SilverspringsCorp.com","soccer",3);



SELECT * FROM athletes;

INSERT INTO athletes VALUES(NULL, "Joe","Smith","Jsmith@calpoly.edu",2.2,"M","football",2,TRUE,1);
INSERT INTO athletes VALUES(NULL, "Hilbert","Freud","Hfreud@calpoly.edu",3.8,"M","football",1,TRUE,1);
INSERT INTO athletes VALUES(NULL, "Susy","Que","SQue@calpoly.edu",3.9,"F","tennis",1,TRUE,4);
INSERT INTO athletes VALUES(NULL, "Molly","Stevens","Mstevens@calpoly.edu",2.9,"F","soocer",3,TRUE,5);
INSERT INTO athletes VALUES(NULL, "Sally","Aniston","Saniston@calpoly.edu",3.1,"F","tennis",1,TRUE,4);
INSERT INTO athletes VALUES(NULL, "Rasa","Bokok","Rbokok@calpoly.edu",0.001,"M","football",6,TRUE,1);
INSERT INTO athletes VALUES(NULL, "Jill","McFry","Jmcfry@calpoly.edu",3.9,"F","track",2,FALSE,2);
INSERT INTO athletes VALUES(NULL, "Ryan","Hilda","Rhilda@calpoly.edu",3.2,"M","track",1,TRUE,7);
INSERT INTO athletes VALUES(NULL, "Steph","Hamilton","Shamilton@calpoly.edu",3.7,"F","tennis",1,TRUE,4);
INSERT INTO athletes VALUES(NULL, "Brian","Peterson","Bpeterson@calpoly.edu",3.1,"M","track",1,TRUE,7);
INSERT INTO athletes VALUES(NULL, "Samantha","Sanderson","Ssanderson@calpoly.edu",3.4,"F","basketball",1,TRUE,3);
INSERT INTO athletes VALUES(NULL, "John","John","Jjohn@calpoly.edu",3.1,"M","basketball",1,TRUE,8);
INSERT INTO athletes VALUES(NULL, "Jill","Jamma","Jjamma@calpoly.edu",3.4,"F","soccer",1,TRUE,5);
INSERT INTO athletes VALUES(NULL, "Mike","Siloque","Msiloque@calpoly.edu",2.8,"M","soccer",2,TRUE,9);
INSERT INTO athletes VALUES(NULL, "Jill","Jamma","Jjamma@calpoly.edu",3.4,"F","soccer",1,TRUE,5);
INSERT INTO athletes VALUES(NULL, "Nico","Benson","Nbenson@calpoly.edu",3.9,"M","soccer",1,TRUE,5);
INSERT INTO athletes VALUES(NULL, "Jill","Jamma","Jjamma@calpoly.edu",3.4,"F","soccer",1,TRUE,5);
INSERT INTO athletes VALUES(NULL, "Molly","Tintle","Mtintle@calpoly.edu",3.5,"F","basketball",3,FALSE,3);
INSERT INTO athletes VALUES(NULL, "Bill","Withers","Bwithers@calpoly.edu",2.7,"M","football",4,TRUE,1);
INSERT INTO athletes VALUES(NULL, "Chungus","Lee","Clee@calpoly.edu",3.2,"M","football",1,TRUE,1);

SELECT * FROM tutors;

INSERT INTO tutors VALUES (NULL,"Bill","Boeson","Bboeson@calpoly.edu","math");
INSERT INTO tutors VALUES (NULL,"Ryan","Clarke","RClarke@calpoly.edu","history");
INSERT INTO tutors VALUES (NULL,"Ben","Brier","Bbrier@calpoly.edu","english");
INSERT INTO tutors VALUES (NULL,"Steve","Stevson","Sstevson@calpoly.edu","social sciences");
INSERT INTO tutors VALUES (NULL,"John","James","Jjames@calpoly.edu","polysci");
INSERT INTO tutors VALUES (NULL,"John","Doe","Jdoe@calpoly.edu","compsci");
INSERT INTO tutors VALUES (NULL,"Jill","Doe","Jdoe2@calpoly.edu","econometrics");
INSERT INTO tutors VALUES (NULL,"Sally","Mcsallyson","Smcsallyson@calpoly.edu","business");
INSERT INTO tutors VALUES (NULL,"Brit","Briterstan","Bbriterstan@calpoly.edu","math");
INSERT INTO tutors VALUES (NULL,"Sean","McVay","Smcvay@calpoly.edu","buiness");



SELECT * FROM subjects;

INSERT INTO subjects VALUES (NULL, "econometrics", 300,7);
INSERT INTO subjects VALUES (NULL, "business", 303,10);
INSERT INTO subjects VALUES (NULL, "math", 456,1);
INSERT INTO subjects VALUES (NULL, "polysci", 311,5);
INSERT INTO subjects VALUES (NULL, "business", 300,8);
INSERT INTO subjects VALUES (NULL, "history", 300,2);
INSERT INTO subjects VALUES (NULL, "compsci", 427,6);
INSERT INTO subjects VALUES (NULL, "english", 300,3);
INSERT INTO subjects VALUES (NULL, "math", 303,9);
INSERT INTO subjects VALUES (NULL, "social sciences", 300,4);



SELECT * FROM employees;

INSERT INTO employees VALUES (NULL, "Stevey","Stevenson","Sstevenson@calpoly.edu",1);
INSERT INTO employees VALUES (NULL, "Shannon","Sharpe","Ssharpe@calpoly.edu",1);
INSERT INTO employees VALUES (NULL, "Bob","Bobella","Bbobella@calpoly.edu",2);
INSERT INTO employees VALUES (NULL, "Carly","Shante","Cshante@calpoly.edu",2);
INSERT INTO employees VALUES (NULL, "Johny","Silverglide","Jsilverglide@calpoly.edu",3);



SELECT * FROM appointments;

INSERT INTO appointments VALUES (NULL, 90000,1,2,TRUE);
INSERT INTO appointments VALUES (NULL, 110000,2,4,TRUE);
INSERT INTO appointments VALUES (NULL, 113000,1,1,TRUE);
INSERT INTO appointments VALUES (NULL, 140000,3,4,TRUE);
INSERT INTO appointments VALUES (NULL, 110000,4,4,TRUE);
INSERT INTO appointments VALUES (NULL, 120000,5,1,FALSE);
INSERT INTO appointments VALUES (NULL, 150000,2,9,TRUE);
INSERT INTO appointments VALUES (NULL, 100000,4,7,TRUE);
INSERT INTO appointments VALUES (NULL, 113000,5,3,FALSE);
INSERT INTO appointments VALUES (NULL, 163000,3,2,TRUE);
INSERT INTO appointments VALUES (NULL, 100000,1,2,TRUE);
INSERT INTO appointments VALUES (NULL, 113000,2,7,TRUE);
INSERT INTO appointments VALUES (NULL, 63000,1,9,TRUE);
INSERT INTO appointments VALUES (NULL, 160000,3,3,FALSE);
INSERT INTO appointments VALUES (NULL, 170000,4,8,TRUE);
INSERT INTO appointments VALUES (NULL, 190000,5,5,FALSE);
INSERT INTO appointments VALUES (NULL, 180000,2,3,TRUE);
INSERT INTO appointments VALUES (NULL, 150000,4,6,FALSE);
INSERT INTO appointments VALUES (NULL, 230000,5,4,FALSE);
INSERT INTO appointments VALUES (NULL, 173000,3,2,TRUE);


SELECT * FROM athlete_tutor;

INSERT INTO athlete_tutor VALUES (1,4);
INSERT INTO athlete_tutor VALUES (2,2);
INSERT INTO athlete_tutor VALUES (3,3);
INSERT INTO athlete_tutor VALUES (4,1);
INSERT INTO athlete_tutor VALUES (5,6);
INSERT INTO athlete_tutor VALUES (6,5);
INSERT INTO athlete_tutor VALUES (7,7);
INSERT INTO athlete_tutor VALUES (8,9);
INSERT INTO athlete_tutor VALUES (9,10);
INSERT INTO athlete_tutor VALUES (10,8);
INSERT INTO athlete_tutor VALUES (11,4);
INSERT INTO athlete_tutor VALUES (12,2);
INSERT INTO athlete_tutor VALUES (13,3);
INSERT INTO athlete_tutor VALUES (14,1);
INSERT INTO athlete_tutor VALUES (15,6);
INSERT INTO athlete_tutor VALUES (16,5);
INSERT INTO athlete_tutor VALUES (17,7);
INSERT INTO athlete_tutor VALUES (18,9);
INSERT INTO athlete_tutor VALUES (19,10);
INSERT INTO athlete_tutor VALUES (20,8);


SELECT * FROM athlete_tutor_subject_appointments ORDER BY athlete_id DESC;

INSERT INTO athlete_tutor_subject_appointments VALUES (9,10,5,9);
INSERT INTO athlete_tutor_subject_appointments VALUES (1,4,10,1);
INSERT INTO athlete_tutor_subject_appointments VALUES (3,3,8,3);
INSERT INTO athlete_tutor_subject_appointments VALUES (7,7,2,7);
INSERT INTO athlete_tutor_subject_appointments VALUES (10,8,5,10);
INSERT INTO athlete_tutor_subject_appointments VALUES (2,2,6,2);
INSERT INTO athlete_tutor_subject_appointments VALUES (6,5,4,4);
INSERT INTO athlete_tutor_subject_appointments VALUES (4,1,3,5);
INSERT INTO athlete_tutor_subject_appointments VALUES (5,6,7,6);
INSERT INTO athlete_tutor_subject_appointments VALUES (8,9,3,8);
INSERT INTO athlete_tutor_subject_appointments VALUES (11,9,3,11);
INSERT INTO athlete_tutor_subject_appointments VALUES (12,4,10,12);
INSERT INTO athlete_tutor_subject_appointments VALUES (13,3,8,13);
INSERT INTO athlete_tutor_subject_appointments VALUES (14,7,2,14);
INSERT INTO athlete_tutor_subject_appointments VALUES (15,8,5,15);
INSERT INTO athlete_tutor_subject_appointments VALUES (16,2,6,16);
INSERT INTO athlete_tutor_subject_appointments VALUES (17,5,4,17);
INSERT INTO athlete_tutor_subject_appointments VALUES (18,1,3,18);
INSERT INTO athlete_tutor_subject_appointments VALUES (19,6,7,19);
INSERT INTO athlete_tutor_subject_appointments VALUES (20,9,3,20);
