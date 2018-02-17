CREATE TABLE `Student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnrollmentDate` datetime NOT NULL,
  `FirstMidName` text NOT NULL,
  `LastName` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `Course` (
  `CourseID` int(11) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Title` text NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Enrollment` (
  `EnrollmentID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) NOT NULL,
  `Grade` int(11) DEFAULT NULL,
  `StudentID` int(11) NOT NULL,
  PRIMARY KEY (`EnrollmentID`),
  KEY `IX_Enrollment_CourseID` (`CourseID`),
  KEY `IX_Enrollment_StudentID` (`StudentID`),
  CONSTRAINT `FK_Enrollment_Course_CourseID` FOREIGN KEY (`CourseID`) REFERENCES `Course` (`CourseID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Enrollment_Student_StudentID` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
