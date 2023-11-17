-- Хранилище хабов

-- Хранилище хаба: Hub_Applicants
CREATE TABLE Hub_Applicants (
    Hub_ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

-- Хранилище хаба: Hub_LicenseTypes
CREATE TABLE Hub_LicenseTypes (
    Hub_LicenseTypeID INT PRIMARY KEY,
    TypeName VARCHAR(255),
    Description TEXT
);

-- Хранилище хаба: Hub_LicenseCategories
CREATE TABLE Hub_LicenseCategories (
    Hub_CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

-- Хранилище хаба: Hub_DrivingSchools
CREATE TABLE Hub_DrivingSchools (
    Hub_SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

-- Хранилище хаба: Hub_Instructors
CREATE TABLE Hub_Instructors (
    Hub_InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    HireDate DATE
);

-- Хранилище хаба: Hub_TrainingCourses
CREATE TABLE Hub_TrainingCourses (
    Hub_CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    DurationInHours INT
);

-- Хранилище хаба: Hub_Applications
CREATE TABLE Hub_Applications (
    Hub_ApplicationID INT PRIMARY KEY,
    ApplicationDate DATE
);

-- Хранилище хаба: Hub_Lessons
CREATE TABLE Hub_Lessons (
    Hub_LessonID INT PRIMARY KEY,
    LessonDate DATETIME
);

-- Хранилище хаба: Hub_Exams
CREATE TABLE Hub_Exams (
    Hub_ExamID INT PRIMARY KEY,
    ExamDate DATETIME
);

-- Хранилище хаба: Hub_ExamResults
CREATE TABLE Hub_ExamResults (
    Hub_ResultID INT PRIMARY KEY,
    Grade VARCHAR(10)
);

-- Хранилище хаба: Hub_TrafficPolice
CREATE TABLE Hub_TrafficPolice (
    Hub_PoliceID INT PRIMARY KEY,
    PoliceName VARCHAR(255),
    Location VARCHAR(255)
);

-- Хранилище брошенных

-- Хранилище брошенного: Satellite_Applicants
CREATE TABLE Satellite_Applicants (
    Satellite_ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    Hub_ApplicantID INT,
    FOREIGN KEY (Hub_ApplicantID) REFERENCES Hub_Applicants(Hub_ApplicantID)
);

-- Хранилище брошенного: Satellite_LicenseTypes
CREATE TABLE Satellite_LicenseTypes (
    Satellite_LicenseTypeID INT PRIMARY KEY,
    TypeName VARCHAR(255),
    Description TEXT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    Hub_LicenseTypeID INT,
    FOREIGN KEY (Hub_LicenseTypeID) REFERENCES Hub_LicenseTypes(Hub_LicenseTypeID)
);

-- Хранилище брошенного: Satellite_LicenseCategories
CREATE TABLE Satellite_LicenseCategories (
    Satellite_CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    Hub_CategoryID INT,
    FOREIGN KEY (Hub_CategoryID) REFERENCES Hub_LicenseCategories(Hub_CategoryID)
);

-- Хранилище брошенного: Satellite_DrivingSchools
CREATE TABLE Satellite_DrivingSchools (
    Satellite_SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    Hub_SchoolID INT,
    FOREIGN KEY (Hub_SchoolID) REFERENCES Hub_DrivingSchools(Hub_SchoolID)
);

-- Хранилище брошенного: Satellite_Instructors
CREATE TABLE Satellite_Instructors (
    Satellite_InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    HireDate DATE,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    Hub_InstructorID INT,
    FOREIGN KEY (Hub_InstructorID) REFERENCES Hub_Instructors(Hub_InstructorID)
);

-- Хранилище брошенного: Satellite_TrainingCourses
CREATE TABLE Satellite_TrainingCourses (
    Satellite_CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    DurationInHours INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    Hub_CourseID INT,
    FOREIGN KEY (Hub_CourseID) REFERENCES Hub_TrainingCourses(Hub_CourseID)
);

-- Хранилище связей

-- 1. Applications с Applicants
CREATE TABLE Link_ApplicationToApplicant (
    Link_ApplicationToApplicantID INT PRIMARY KEY,
    Hub_ApplicationID INT,
    Hub_ApplicantID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ApplicationID) REFERENCES Hub_Applications(Hub_ApplicationID),
    FOREIGN KEY (Hub_ApplicantID) REFERENCES Hub_Applicants(Hub_ApplicantID)
);

-- 2. Applications с LicenseTypes
CREATE TABLE Link_ApplicationToLicenseType (
    Link_ApplicationToLicenseTypeID INT PRIMARY KEY,
    Hub_ApplicationID INT,
    Hub_LicenseTypeID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ApplicationID) REFERENCES Hub_Applications(Hub_ApplicationID),
    FOREIGN KEY (Hub_LicenseTypeID) REFERENCES Hub_LicenseTypes(Hub_LicenseTypeID)
);

-- 3. Applications с LicenseCategories
CREATE TABLE Link_ApplicationToCategory (
    Link_ApplicationToCategoryID INT PRIMARY KEY,
    Hub_ApplicationID INT,
    Hub_CategoryID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ApplicationID) REFERENCES Hub_Applications(Hub_ApplicationID),
    FOREIGN KEY (Hub_CategoryID) REFERENCES Hub_LicenseCategories(Hub_CategoryID)
);

-- 4. Applications с TrafficPolice
CREATE TABLE Link_ApplicationToTrafficPolice (
    Link_ApplicationToTrafficPoliceID INT PRIMARY KEY,
    Hub_ApplicationID INT,
    Hub_PoliceID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ApplicationID) REFERENCES Hub_Applications(Hub_ApplicationID),
    FOREIGN KEY (Hub_PoliceID) REFERENCES Hub_TrafficPolice(Hub_PoliceID)
);

-- 5. Applicants с ExamResults
CREATE TABLE Link_ApplicantToExamResult (
    Link_ApplicantToExamResultID INT PRIMARY KEY,
    Hub_ApplicantID INT,
    Hub_ResultID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ApplicantID) REFERENCES Hub_Applicants(Hub_ApplicantID),
    FOREIGN KEY (Hub_ResultID) REFERENCES Hub_ExamResults(Hub_ResultID)
);

-- 6. LicenseTypes c Instructors
CREATE TABLE Link_LicenseTypeToInstructor (
    Link_LicenseTypeToInstructorID INT PRIMARY KEY,
    Hub_LicenseTypeID INT,
    Hub_InstructorID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_LicenseTypeID) REFERENCES Hub_LicenseTypes(Hub_LicenseTypeID),
    FOREIGN KEY (Hub_InstructorID) REFERENCES Hub_Instructors(Hub_InstructorID)
);

-- 7. TrafficPolice c Instructors
CREATE TABLE Link_TrafficPoliceToInstructor (
    Link_TrafficPoliceToInstructorID INT PRIMARY KEY,
    Hub_PoliceID INT,
    Hub_InstructorID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_PoliceID) REFERENCES Hub_TrafficPolice(Hub_PoliceID),
    FOREIGN KEY (Hub_InstructorID) REFERENCES Hub_Instructors(Hub_InstructorID)
);

-- 8. TrafficPolice c DrivingSchool
CREATE TABLE Link_TrafficPoliceToDrivingSchool (
    Link_TrafficPoliceToDrivingSchoolID INT PRIMARY KEY,
    Hub_PoliceID INT,
    Hub_SchoolID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_PoliceID) REFERENCES Hub_TrafficPolice(Hub_PoliceID),
    FOREIGN KEY (Hub_SchoolID) REFERENCES Hub_DrivingSchools(Hub_SchoolID)
);

-- 9. ExamResults c Exams
CREATE TABLE Link_ExamResultToExam (
    Link_ExamResultToExamID INT PRIMARY KEY,
    Hub_ResultID INT,
    Hub_ExamID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ResultID) REFERENCES Hub_ExamResults(Hub_ResultID),
    FOREIGN KEY (Hub_ExamID) REFERENCES Hub_Exams(Hub_ExamID)
);

-- 10. Instructors c Exams
CREATE TABLE Link_InstructorToExam (
    Link_InstructorToExamID INT PRIMARY KEY,
    Hub_InstructorID INT,
    Hub_ExamID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_InstructorID) REFERENCES Hub_Instructors(Hub_InstructorID),
    FOREIGN KEY (Hub_ExamID) REFERENCES Hub_Exams(Hub_ExamID)
);

-- 11. Instructors c Lessons
CREATE TABLE Link_InstructorToLesson (
    Link_InstructorToLessonID INT PRIMARY KEY,
    Hub_InstructorID INT,
    Hub_LessonID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_InstructorID) REFERENCES Hub_Instructors(Hub_InstructorID),
    FOREIGN KEY (Hub_LessonID) REFERENCES Hub_Lessons(Hub_LessonID)
);

-- 12. Exams c TrainingCourses
CREATE TABLE Link_ExamToCourse (
    Link_ExamToCourseID INT PRIMARY KEY,
    Hub_ExamID INT,
    Hub_CourseID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_ExamID) REFERENCES Hub_Exams(Hub_ExamID),
    FOREIGN KEY (Hub_CourseID) REFERENCES Hub_TrainingCourses(Hub_CourseID)
);

-- 13. Lessons c TrainingCourses
CREATE TABLE Link_LessonToCourse (
    Link_LessonToCourseID INT PRIMARY KEY,
    Hub_LessonID INT,
    Hub_CourseID INT,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    FOREIGN KEY (Hub_LessonID) REFERENCES Hub_Lessons(Hub_LessonID),
    FOREIGN KEY (Hub_CourseID) REFERENCES Hub_TrainingCourses(Hub_CourseID)
);
