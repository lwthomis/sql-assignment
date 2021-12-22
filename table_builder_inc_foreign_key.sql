CREATE TABLE `Courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `course_professor_id` int NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_id_UNIQUE` (`course_id`),
  KEY `course_professor_id_idx` (`course_professor_id`),
  CONSTRAINT `course_professor_id` FOREIGN KEY (`course_professor_id`) REFERENCES `Professors` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Grades` (
  `grade_id` int NOT NULL AUTO_INCREMENT,
  `grade_percent` int NOT NULL,
  `grade_course_id` int NOT NULL,
  `grade_student_id` int NOT NULL,
  `grade_professor_id` int NOT NULL,
  PRIMARY KEY (`grade_id`),
  UNIQUE KEY `grade_id_UNIQUE` (`grade_id`),
  KEY `grade_student_id_idx` (`grade_student_id`),
  KEY `grade_professor_id_idx` (`grade_professor_id`),
  KEY `grade_course_id_idx` (`grade_course_id`),
  CONSTRAINT `grade_course_id` FOREIGN KEY (`grade_course_id`) REFERENCES `Courses` (`course_id`),
  CONSTRAINT `grade_professor_id` FOREIGN KEY (`grade_professor_id`) REFERENCES `Professors` (`professor_id`),
  CONSTRAINT `grade_student_id` FOREIGN KEY (`grade_student_id`) REFERENCES `Students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Professors` (
  `professor_id` int NOT NULL AUTO_INCREMENT,
  `professor_fname` varchar(25) NOT NULL,
  `professor_lname` varchar(25) NOT NULL,
  `professor_email` varchar(45) NOT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE KEY `professor_email_UNIQUE` (`professor_email`),
  UNIQUE KEY `professor_id_UNIQUE` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `student_fname` varchar(25) NOT NULL,
  `student_lname` varchar(25) NOT NULL,
  `student_email` varchar(45) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_id_UNIQUE` (`student_id`),
  UNIQUE KEY `student_email_UNIQUE` (`student_email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci