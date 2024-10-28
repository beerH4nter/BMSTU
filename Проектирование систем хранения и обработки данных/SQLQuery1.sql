--CREATE TABLE patient(
--	id INT IDENTITY PRIMARY KEY,
--	surname NVARCHAR(50) NOT NULL,
--	name NVARCHAR(50) NOT NULL,
--	lastname NVARCHAR(50),
--	passport_series INT NOT NULL,
--	passport_number INT NOT NULL,
--	date_of_birth DATE NOT NULL,
--	CMIP_number INT NOT NULL,

--	CONSTRAINT ck_patient_passport_series CHECK(len(passport_series) = 4),
--	CONSTRAINT ck_patient_passport_number CHECK(len(passport_number) = 6),
--)

--CREATE TABLE clinics(
--	id INT IDENTITY PRIMARY KEY,
--	name NVARCHAR(50) NOT NULL,
--	address NVARCHAR(100) NOT NULL
--)


--CREATE TABLE medical_card(
--	id INT IDENTITY PRIMARY KEY,
--	patient_id INT NOT NULL,
--	clinic_id INT NOT NULL,

--	CONSTRAINT fk_medical_card_patient_id FOREIGN KEY (patient_id) REFERENCES patient(id),
--	CONSTRAINT fk_medical_card_clinic_id FOREIGN KEY (clinic_id) REFERENCES clinics(id)
--)

--CREATE TABLE tests(
--	id INT IDENTITY PRIMARY KEY,
--	name NVARCHAR(50) NOT NULL, 
--	completion_time NVARCHAR(20) NOT NULL,
--	medical_card_id INT NOT NULL,
--	result NVARCHAR(100),

--	CONSTRAINT fk_tests_medical_card FOREIGN KEY (medical_card_id) REFERENCES medical_card(id)
--)

--CREATE TABLE doctors(
--	id INT IDENTITY PRIMARY KEY,
--	surname NVARCHAR(50) NOT NULL,
--	name NVARCHAR(50) NOT NULL,
--	lastname NVARCHAR(50),
--	specialization NVARCHAR(50) NOT NULL,
--	position NVARCHAR(50) NOT NULL,
--	clinic_id INT NOT NULL,

--	CONSTRAINT fk_doctors_clinic_id FOREIGN KEY (clinic_id) REFERENCES clinics(id)
--)

--CREATE TABLE appointment(
--	id INT IDENTITY PRIMARY KEY,
--	clinic_id INT NOT NULL,
--	test_id INT DEFAULT NULL,
--	doctor_id INT DEFAULT NULL,
--	medical_card_id	INT NOT NULL,
--	date DATE NOT NULL,
--	time TIME NOT NULL,
--	is_expired BIT NOT NULL,
--	is_canceled BIT NOT NULL,
--	office INT NOT NULL,

--	CONSTRAINT fk_appointment_clinic_id FOREIGN KEY (clinic_id) REFERENCES clinics(id),
--	CONSTRAINT fk_appointment_doctor_id FOREIGN KEY (doctor_id) REFERENCES doctors(id),
--	CONSTRAINT fk_appointment_test_id FOREIGN KEY (test_id) REFERENCES tests(id),
--	CONSTRAINT fk_appointment_medical_card_id FOREIGN KEY (medical_card_id) REFERENCES medical_card(id),
--	CONSTRAINT ck_appointment_doctor_id CHECK((doctor_id != NULL AND test_id = NULL) OR (doctor_id = NULL AND test_id != NULL))
--)


--CREATE TABLE medical_history(
--	id INT IDENTITY PRIMARY KEY,
--	desease_name NVARCHAR(100) NOT NULL,
--	date_start DATE NOT NULL,
--	date_end DATE NOT NULL,
--	is_sick_leave BIT NOT NULL,
--	medical_card_id INT NOT NULL,

--	CONSTRAINT fk_medical_history_medical_card_id FOREIGN KEY (medical_card_id) REFERENCES medical_card(id),
--	CONSTRAINT ck_medical_history_date_start CHECK((date_start < date_end) AND (date_start < CAST(GETDATE() AS DATE)) AND (date_end < CAST(GETDATE() AS DATE)))
--)

--CREATE TABLE ambulance_calls(
--	id INT IDENTITY PRIMARY KEY,
--	date DATE NOT NULL,
--	time TIME NOT NULL,
--	is_hospitalized BIT NOT NULL,
--	medical_card_id INT NOT NULL,

--	CONSTRAINT fk_ambulancr_calls_medical_card_id FOREIGN KEY (medical_card_id) REFERENCES medical_card(id),
--	CONSTRAINT ck_ambulance_calls_date CHECK(date < CAST(GETDATE() AS DATE))

--)

--CREATE TABLE hospitalizations(
--	id INT IDENTITY PRIMARY KEY,
--	date DATE NOT NULL,
--	clinic_d INT NOT NULL,
--	medical_card_id INT NOT NULL,

--	CONSTRAINT fk_hospitalizations_medical_card_id FOREIGN KEY (medical_card_id) REFERENCES medical_card(id),
--	CONSTRAINT ck_hospitalizations_date CHECK(date < CAST(GETDATE() AS DATE))

--)

--INSERT INTO patient
--VALUES ('Gubin', 'Egor', 'Vyacheslavovich', 1234, 123456, '23-10-2023', 12345678);
--INSERT INTO patient
--VALUES ('Lee', 'Roman', 'Vladiclavovich', 4321, 654321, '25-11-2023', 87654321);
--INSERT INTO patient
--VALUES ('Echin', 'Ilya', 'Valerievich', 1234, 123456, '12-10-2023', 12345678);
--INSERT INTO patient
--VALUES ('Volkov', 'Alexandr', 'Dmitrievich', 1234, 123456, '05-07-2023', 12345678);
--INSERT INTO patient
--VALUES ('Ivanov', 'Roman', 'Igorevich', 1234, 654321, '23-10-2023', 12345678);
--INSERT INTO patient
--VALUES ('Sidorov', 'Igor', 'Stepanovich', 1234, 123456, '11-12-2023', 12345678);
--INSERT INTO patient
--VALUES ('Smirnov', 'Alexey', 'Uryevich', 1234, 123456, '23-10-2023', 12345678);
--INSERT INTO patient
--VALUES ('Sobolev', 'Ilya', 'Vladimirovich', 4321, 123456, '26-10-2023', 12345678);
--INSERT INTO patient
--VALUES ('Golubev', 'Stepan', 'Kirilovich', 1234, 123456, '23-11-2023', 12345678);
--INSERT INTO patient
--VALUES ('Kochin', 'Nikita', 'Vyacheslavovich', 1234, 654321, '28-10-2023', 12345678);

--INSERT INTO clinics
--VALUES ('Bolnica N3', 'Gagarina 6');
--INSERT INTO clinics
--VALUES ('Bolnica N5', 'Kirova 3');
--INSERT INTO clinics
--VALUES ('Bolnica N9', 'Moskovskaya 9');

--INSERT INTO medical_card
--VALUES (1, 1);
--INSERT INTO medical_card
--VALUES (2, 1);
--INSERT INTO medical_card
--VALUES (3, 2);
--INSERT INTO medical_card
--VALUES (4, 3);
--INSERT INTO medical_card
--VALUES (5, 1);
--INSERT INTO medical_card
--VALUES (6, 2);
--INSERT INTO medical_card
--VALUES (7, 2);
--INSERT INTO medical_card
--VALUES (8, 3);
--INSERT INTO medical_card
--VALUES (9, 1);
--INSERT INTO medical_card
--VALUES (10, 3);

--INSERT INTO tests
--VALUES ('krov', '2 dnya', 1, 'Norma');
--INSERT INTO tests (name, completion_time, medical_card_id)
--VALUES ('krov', '2 dnya', 2);
--INSERT INTO tests
--VALUES ('Mocha', '1 den', 2, 'Ploho');
--INSERT INTO tests
--VALUES ('Rentgen legkih', '1 den', 3, 'Norma');
--INSERT INTO tests
--VALUES ('krov', '2 dnya', 4, 'Norma');
--INSERT INTO tests
--VALUES ('krov', '2 dnya', 1, 'Norma');
--INSERT INTO tests
--VALUES ('Rentgen legkih', '1 den', 5, 'Ploho');
--INSERT INTO tests (name, completion_time, medical_card_id)
--VALUES ('krov', '2 dnya', 8);
--INSERT INTO tests
--VALUES ('Mocha', '1 den', 7, 'Norma');
--INSERT INTO tests
--VALUES ('krov', '2 dnya', 1, 'Norma');
--INSERT INTO tests
--VALUES ('Uzi', '2 dnya', 8, 'Ploho');
--INSERT INTO tests (name, completion_time, medical_card_id)
--VALUES ('krov', '2 dnya', 3);
--INSERT INTO tests
--VALUES ('krov', '2 dnya', 5, 'Ploho');
--INSERT INTO tests(name, completion_time, medical_card_id)
--VALUES ('Rentgen legkih', '1 den', 8);
--INSERT INTO tests(name, completion_time, medical_card_id)
--VALUES ('Rentgen legkih', '1 den', 6);
--INSERT INTO tests(name, completion_time, medical_card_id)
--VALUES ('Mocha', '1 den', 10);
--INSERT INTO tests
--VALUES ('Uzi', '2 dnya', 2, 'Norma');

--INSERT INTO doctors
--VALUES ('Sokolovskiy','Alexander','Mikhailovich','Pediatr','Vrach-pediatr',1)
--INSERT INTO doctors
--VALUES ('Egorov','Egor','Egorovich','Hirurg','Vrach-hirurg',2)
--INSERT INTO doctors
--VALUES ('Ermolenko','Anastasiya','Igorevna','Momolog','Vrach-momlog',1)
--INSERT INTO doctors
--VALUES ('Bosov','Boss','Bossovich','Ginecolog','Glavniy-vrach',3)
--INSERT INTO doctors
--VALUES ('Kimov','Roman','Alexeevich','Stomatolog','Vrach-stomatolog',2)
--INSERT INTO doctors
--VALUES ('Kashin','Anton','Vladiclavovich','Rentgenolog','Zaveduyushiy otdeleniem',2)
--INSERT INTO doctors
--VALUES ('Vlasov','Sergey','Petrovich','Urolog','Vrach-urolog',1)


--INSERT INTO appointment 
--VALUES (1,2,NULL,1,'19-04-2024','14:15:00',1,0,303)

--INSERT INTO appointment 
--VALUES (2,NULL,2,3,'19-11-2024','09:30:00',0,0,205)

--INSERT INTO appointment 
--VALUES (1,1,NULL,2,'13-12-2023','08:00:00',0,1,201)

--INSERT INTO appointment 
--VALUES (3,NULL,4,8,'19-12-2024','11:15:00',0,0,101)

--INSERT INTO appointment 
--VALUES (1,4,NULL,3,'15-04-2024','10:15:00',1,0,105)


--INSERT INTO appointment 
--VALUES (3,12,NULL,3,'15-05-2024','13:15:00',0,1,203)


--INSERT INTO appointment 
--VALUES (2,6,NULL,1,'18-04-2024','10:20:00',1,0,105)


--INSERT INTO appointment 
--VALUES (1,3,NULL,2,'15-03-2024','08:15:00',1,0,202)


--INSERT INTO appointment 
--VALUES (2,5,NULL,4,'19-04-2024','14:15:00',1,0,303)


--INSERT INTO appointment 
--VALUES (3,7,NULL,5,'11-10-2024','12:15:00',1,0,105)


--INSERT INTO appointment 
--VALUES (2,8,NULL,8,'08-08-2024','08:00:00',0,1,205)


--INSERT INTO appointment 
--VALUES (3,14,NULL,8,'25-11-2024','11:20:00',0,0,105)


--INSERT INTO appointment 
--VALUES (3,15,NULL,6,'19-12-2024','14:15:00',0,0,105)


--INSERT INTO appointment 
--VALUES (2,16,NULL,10,'30-11-2024','14:15:00',0,0,203)


--INSERT INTO appointment 
--VALUES (1,9,NULL,7,'18-04-2024','14:15:00',1,0,303)


--INSERT INTO appointment 
--VALUES (3,10,NULL,1,'12-09-2024','12:15:00',1,0,303)


--INSERT INTO appointment 
--VALUES (2,11,NULL,8,'19-07-2024','13:30:00',1,0,200)


--INSERT INTO appointment 
--VALUES (2,17,NULL,2,'10-04-2024','13:00:00',1,0,200)


--INSERT INTO appointment 
--VALUES (1,13,NULL,5,'01-04-2024','10:15:00',1,0,102)


--INSERT INTO appointment 
--VALUES (1,NULL,1,1,'01-11-2024','14:00:00',0,0,108)


--INSERT INTO appointment 
--VALUES (3,NULL,4,8,'19-04-2024','14:15:00',0,1,101)


--INSERT INTO appointment 
--VALUES (2,NULL,6,5,'07-11-2024','10:15:00',0,0,206)


--INSERT INTO appointment 
--VALUES (1,NULL,7,10,'19-04-2024','14:15:00',1,0,201)


--INSERT INTO appointment 
--VALUES (2,NULL,5,3,'15-11-2024','11:20:00',0,0,303)


--INSERT INTO appointment 
--VALUES (2,NULL,2,7,'19-04-2024','14:15:00',1,0,209)


--INSERT INTO appointment 
--VALUES (1,NULL,3,9,'30-11-2024','13:15:00',0,1,303)


--INSERT INTO medical_history
--VALUES ('Bronhit','12-12-2023','25-12-2023',1,1)
--INSERT INTO medical_history
--VALUES ('Gastrit','12-12-2023','25-12-2023',0,2)
--INSERT INTO medical_history
--VALUES ('Diareya','12-12-2023','25-12-2023',1,3)
--INSERT INTO medical_history
--VALUES ('Krasnuha','12-12-2023','25-12-2023',0,4)
--INSERT INTO medical_history
--VALUES ('Leykemiya','12-12-2023','25-12-2023',1,5)
--INSERT INTO medical_history
--VALUES ('Lishay','12-12-2023','25-12-2023',0,6)
--INSERT INTO medical_history
--VALUES ('Diatez','12-12-2023','25-12-2023',1,7)
--INSERT INTO medical_history
--VALUES ('Angina','12-12-2023','25-12-2023',0,8)
--INSERT INTO medical_history
--VALUES ('Alcgeymer','12-12-2023','25-12-2023',1,9)
--INSERT INTO medical_history
--VALUES ('Ottit','12-12-2023','25-12-2023',0,10)


--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',0,1)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',1,2)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',0,3)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',1,4)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',0,5)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',1,6)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',0,7)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',1,8)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',0,9)
--INSERT INTO ambulance_calls
--VALUES ('12-12-2022','17:22:00',1,10)


--INSERT INTO hospitalizations
--VALUES ('12-12-2022',1,2)
--INSERT INTO hospitalizations
--VALUES ('12-12-2022',2,4)
--INSERT INTO hospitalizations
--VALUES ('12-12-2022',3,6)
--INSERT INTO hospitalizations
--VALUES ('12-12-2022',1,8)
--INSERT INTO hospitalizations
--VALUES ('12-12-2022',2,10)


SELECT p.surname, p.name, a.date, a.time, c.name, c.address, t.name, d.position FROM appointment a
JOIN medical_card mc ON a.medical_card_id = mc.id
JOIN patient p ON p.id = mc.patient_id
JOIN clinics c ON mc.clinic_id = c.id
JOIN tests t ON a.test_id = t.id
JOIN doctors d ON a.doctor_id = d.id
WHERE a.is_expired = 0 
AND a.is_canceled = 0
AND mc.patient_id = 8
ORDER BY a.date DESC





