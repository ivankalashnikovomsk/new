create database Training;

create table Trainee (
trainee_id int(10) unsigned COMMENT 'Primary key: unique trainee ID.',
name varchar(255) COMMENT 'Name of trainee.',
email varchar(255) COMMENT 'Email of trainee.',
PRIMARY KEY (trainee_id)
);

create table Course (
course_id int(10) unsigned COMMENT 'Primary key: unique course ID.',
name varchar(255) COMMENT 'Name of course.',
description varchar(255) COMMENT 'Description of course.',
PRIMARY KEY (course_id)
);

create table History (
history_id int(10) unsigned COMMENT 'Primary key: unique history ID.',
trainee_id int(10) unsigned COMMENT 'Trainee ID.',
course_id int(10) unsigned COMMENT 'Course ID.',
cstart int(11) unsigned COMMENT 'Timestamp for when course was started.',
cend int(11) COMMENT 'Timestamp for when course was finished.',
status tinyint(4) COMMENT 'Whether the course was passed(1) or not(0).',
PRIMARY KEY (history_id)
);

INSERT INTO `trainee`(`trainee_id`, `name`, `email`)
VALUES (1,'Иванов','ivanov@pochta.ru');
INSERT INTO `trainee`(`trainee_id`, `name`, `email`)
VALUES (2,'Петров','petrov@pochta.ru');
INSERT INTO `trainee`(`trainee_id`, `name`, `email`)
VALUES (3,'Сидоров','sidorov@pochta.ru');
INSERT INTO `trainee`(`trainee_id`, `name`, `email`)
VALUES (4,'Герасимов','gerasimov@pochta.ru');
INSERT INTO `trainee`(`trainee_id`, `name`, `email`)
VALUES (5,'Сергеев','sergeev@pochta.ru');


INSERT INTO `course`(`course_id`, `name`, `description`)
VALUES (1,'HTML','Введение в HTML');
INSERT INTO `course`(`course_id`, `name`, `description`)
VALUES (2,'JS','Введение в JS');
INSERT INTO `course`(`course_id`, `name`, `description`)
VALUES (3,'CSS','Введение в CSS');
INSERT INTO `course`(`course_id`, `name`, `description`)
VALUES (4,'PHP','Введение в PHP');
INSERT INTO `course`(`course_id`, `name`, `description`)
VALUES (5,'SQL','Введение в SQL');


/* данные для проверки "выведите список стажёров (trainee name, trainee email, course name, history end)
которые успешно прошли курс PHP (course name=PHP) в прошлом месяце
(сравнить history end);"*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (1,1,4,201906,201907,1);/*прошел php в позапрошлом*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (2,2,4,201907,201908,1);/*прошел php в прошлом*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (3,3,4,201907,201908,0);/*не прошел php в прошлом*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (4,4,1,201907,201908,1);/*прошел html в прошлом*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (5,5,2,201908,201909,0);/*не прошел js в текущем*/
/*итого id [2] */


/*данные для проверки  "для каждого из всех возможных курсов выведите количество успешных
прохождений (course name, quantity) в текущем месяце (сравнить history start);"*/

INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (6,1,1,201906,201907,1); /*прошел html в 07, начал в 06*/ 
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (7,2,2,201909,201909,1);/*прошел js в 09, начал в 09*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (8,3,3,201909,201909,0); /*не прошел css в 09, начал в 09*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (9,4,4,201908,201909,1); /*прошел PHP в 09, начал в 08*/
INSERT INTO `History`(`history_id`, `trainee_id`, `course_id`,`cstart`, `cend`, `status`)
VALUES (10,5,5,201909,201909,1); /*прошел sql в 09, начал в 09*/
/*итого должно быть id[7,10], quantity =2*/ 

/* SELECT запрос на прошедших php в прошлом месяце
  trainee.name,
  trainee.email,
  history.cend,
  course.name
FROM history
  INNER JOIN course
    ON history.course_id = course.course_id
  INNER JOIN trainee
    ON history.trainee_id = trainee.trainee_id
WHERE history.cend = 201908
AND history.status = 1
AND course.name = 'php'*/






