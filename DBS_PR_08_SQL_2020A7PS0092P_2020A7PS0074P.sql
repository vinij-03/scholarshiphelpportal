CREATE DATABASE scholarship;
USE scholarship;

CREATE TABLE `scholarship`.`Snames` (
  `s_Id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `s_name` VARCHAR(100) NOT NULL,
  `amount` INT NOT NULL,
  `available_no` INT NOT NULL,
PRIMARY KEY (`s_Id`),
UNIQUE INDEX `s_Id_UNIQUE` (`s_Id` ASC) VISIBLE);

INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('MK Gandhi scholarship', '5000', '5');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('APJ Abdul kalam scholarship', '4500', '7');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('CV Raman fellowship', '4200', '6');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Swami Vivekananda scholarship', '6500', '6');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Ramanujan scholarship', '3500', '2');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Homi Bhabha fellowship', '4580', '4');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('SN Bose scholarship', '4400', '5');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Swaminanthan fellowship', '5200', '4');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Vikram Sarabhai fellowship', '5100','5');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('DRDO fellowship', '3600', '8');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('NTSE scholarship', '4600', '7');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Narendra Modi scholarship', '5400', '3');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Manmohan scholarship', '3110', '9');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Aditya Birla scholarship', '3240', '10');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('HC Verma scholarship', '3150', '12');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('MAKE IN INDIA scholarship', '4500', '4');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Aatmanirbhar scholarship', '4400', '3');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Kisaan scholarship', '3400', '6');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Smritirachna scholarship', '2500', '9');
INSERT INTO `scholarship`.`Snames` (`s_name`, `amount`, `available_no`) VALUES ('Kalayog scholarship', '3700', '8');


CREATE TABLE `scholarship`.`User_credentials` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
PRIMARY KEY (`username`),
UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);

INSERT INTO `scholarship`.`User_credentials`(`username`, `password`) VALUES ('archaj02', 'archaj0202');
INSERT INTO `scholarship`.`User_credentials`(`username`, `password`) VALUES ('sarthak01', 'sarthak0101');
INSERT INTO `scholarship`.`User_credentials`(`username`, `password`) VALUES ('priya04', 'priya0404');


CREATE TABLE `scholarship`.`Students` (
    `stu_Id` INT NOT NULL AUTO_INCREMENT,
    `stu_name` VARCHAR(45) NOT NULL,
    `gender` ENUM('FEMALE','MALE'),
    `caste` ENUM('GEN','SC','ST','OBC'),
    `parental_income(in lac)` DECIMAL(4,2) UNSIGNED NULL,
    `state` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`stu_Id`));

INSERT INTO `scholarship`.`Students`(`stu_Id`, `stu_name`, `gender`, `caste`, `parental_income(in lac)`, `state`) VALUES ('1','archaj02', 'Archaj Jain', 'MALE', 'OBC','7.50','AP');
INSERT INTO `scholarship`.`Students`(`stu_Id`, `stu_name`, `gender`, `caste`, `parental_income(in lac)`, `state`) VALUES ('2','sarthak01', 'Sarthak Sinha', 'MALE','GEN','7.80','Rajasthan');
INSERT INTO `scholarship`.`Students`(`stu_Id`, `stu_name`, `gender`, `caste`, `parental_income(in lac)`, `state`) VALUES ('3','priya04', 'Priya Saini', 'FEMALE', 'OBC','5.50','UP');


CREATE TABLE `scholarship`.`Stu_user` (
  `stu_Id` INT NOT NULL AUTO_INCREMENT ,
  `username` varchar(45) NOT NULL,
 PRIMARY KEY (`stu_Id`),
 FOREIGN KEY (username) REFERENCES User_credentials(`username`),
 FOREIGN KEY (stu_Id) REFERENCES Students(`stu_Id`));

INSERT INTO `scholarship`.`Stu_user`(`stu_Id`,`username`) VALUES ('1','archaj02');
INSERT INTO `scholarship`.`Stu_user`(`stu_Id`,`username`) VALUES ('2','sarthak01');
INSERT INTO `scholarship`.`Stu_user`(`stu_Id`,`username`) VALUES ('3','priya04');






CREATE TABLE `scholarship`.`Eligibility` (
    `s_Id` INT  NOT NULL,
    `gender` ENUM('FEMALE','MALE'),
    `caste` ENUM('GEN','SC','ST','OBC'),
    `parental_income(in lac)` DECIMAL(4,2)  NULL,
    `state` VARCHAR(45) NULL,
    PRIMARY KEY (`s_Id`),
    FOREIGN KEY (`s_Id`) REFERENCES Snames(`s_Id`),
    FOREIGN KEY (`gender`,`caste`,`parental_income(in lac)`,`state`) REFERENCES Students(`gender`,`caste`,`parental_income(in lac)`,`state`));

INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('1','MALE','OBC','8.50','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('2','FEMALE','GEN','7.50','Telangana');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('3','MALE','SC','10.50','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('4','FEMALE','OBC','6.50','UP');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('5','MALE','GEN','9.50','MP');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('6','FEMALE','GEN','8.50','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('7','MALE','ST','8.50','Maharashtra');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('8','FEMALE','GEN','7.00','Maharashtra');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('9','MALE','SC','8.50','Punjab');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('10','FEMALE','GEN','8.00','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('11','MALE','GEN','8.50','Haryana');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('12','MALE','GEN','8.25','HP');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('13','MALE','OBC','9.50','AP');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('14','FEMALE','GEN','8.50','Bihar');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('15','MALE','GEN','8.00','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('16','FEMALE','SC','8.50','Gujarat');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('17','MALE','GEN','8.50','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('18','FEMALE','GEN','8.50','Kerala');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('19','MALE','SC','7.00','Rajasthan');
INSERT INTO `scholarship`.`Eligibility`(`s_Id`,`gender`,`caste`,`parental_income(in lac)`,`state`) VALUES ('20','MALE','GEN','7.50','TN');




CREATE TABLE `scholarship`.`Stu_school` (
   `stu_Id` INT  NOT NULL,
   `percentage` DECIMAL(4,2) NULL,
   FOREIGN KEY (stu_Id) REFERENCES Students(`stu_Id`));

INSERT INTO `scholarship`.`Stu_school` (`stu_Id`,`percentage`) VALUES ('1','93.00');




CREATE TABLE `scholarship`.`Stu_college` (
   `stu_Id` INT NOT NULL,
   `gpa` DECIMAL(3,2)  NULL,
   FOREIGN KEY (stu_Id) REFERENCES Students(`stu_Id`));

INSERT INTO `scholarship`.`Stu_college` (`stu_Id`,`gpa`) VALUES ('2','8.50');
INSERT INTO `scholarship`.`Stu_college` (`stu_Id`,`gpa`) VALUES ('3','9.50');


CREATE TABLE `scholarship`.`School_eligibility` (
   `s_Id` INT Unsigned NOT NULL,
   `reqd_percentage` DECIMAL(4,2) NOT NULL,
   FOREIGN KEY (s_Id) REFERENCES Snames(`s_Id`));

INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('1','80.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('3','85.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('5','83.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('8','87.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('9','88.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('12','87.50');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('13','90.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('17','92.00');
INSERT INTO `scholarship`.`School_eligibility` (`s_Id`,`reqd_percentage`) VALUES ('19','93.00');



CREATE TABLE `scholarship`.`College_eligibility` (
   `s_Id` INT UNSIGNED NOT NULL,
   `reqd_gpa` DECIMAL(3,2) NOT NULL,
   FOREIGN KEY (s_Id) REFERENCES Snames(`s_Id`));

INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('2','8.00');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('4','9.00');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('6','8.50');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('7','8.25');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('10','9.25');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('11','8.65');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('14','8.15');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('15','7.75');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('16','8.95');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('18','9.25');
INSERT INTO `scholarship`.`College_eligibility` (`s_Id`,`reqd_gpa`) VALUES ('20','9.50');


CREATE TABLE `scholarship`.`Takes` (
  `stu_Id` INT NOT NULL,
  `s_Id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`stu_Id`, `s_Id`),
  FOREIGN KEY (`s_Id`) REFERENCES Snames(`s_Id`),
  FOREIGN KEY (`stu_Id`) REFERENCES Students(`stu_Id`));

INSERT INTO `scholarship`.`Takes` (`stu_Id`, `s_Id`) VALUES ('1', '13');
INSERT INTO `scholarship`.`Takes` (`stu_Id`, `s_Id`) VALUES ('2', '15');
INSERT INTO `scholarship`.`Takes` (`stu_Id`, `s_Id`) VALUES ('3', '4');

/* 
sql queries:-
checking login condition :-
      mycursor.execute("SET autocommit = 0;")
        mycursor.execute("START TRANSACTION")
        mycursor.execute("select * from user_credentials where username=%s and password=%s",(username_info,password_info))
        then commit or rollback acc to condition
getting registration:-
      mycursor.execute("SET autocommit = 0;")
        mycursor.execute("START TRANSACTION")
        mycursor.execute("insert into user_credentials values(%s,%s)",credential)
        mycursor.execute("insert into Students values(%s,%s,%s,%s,%s,%s)",detail)
        mycursor.execute("insert into Stu_user values(%s,%s)",(stu_Id,username_info))
        then commit or rollback acc to condition
Student and college part:-
      mycursor.execute("SET autocommit = 0;")
        mycursor.execute("START TRANSACTION")
        mycursor.execute("Insert into Stu_school values(%s,%s)",(stu_id,marks))
        mycursor.execute("COMMIT")
      
      mycursor.execute("SET autocommit = 0;")
        mycursor.execute("START TRANSACTION")
        mycursor.execute("Insert into Stu_college values(%s,%s)",(stu_id,marks))
        mycursor.execute("COMMIT")
checking for available scholarships on basis of state:-
      cursor1.execute("SET autocommit = 0;")
        cursor1.execute("START TRANSACTION")
        cursor1.execute("select * from Snames 
                        where s_Id in
                         (select s_Id from Eligibility as e
                          natural join Students as s natural join 
                          Stu_school natural join Stu_college natural join 
                          School_eligibility natural join College_eligibility 
                          where e.gender = s.gender and e.caste=s.caste 
                          and e.`parental_income(in lac)`>=s.`parental_income(in lac)` 
                          and e.state = s.state 
                          and ((percentage is not null and percentage >= reqd_percentage)or(gpa is not null and gpa >= reqd_gpa)) and stu_Id=%s)",(stu_id))
similar for all scholrships
*/