-- Таблица: Applicants
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

-- Таблица: LicenseTypes
CREATE TABLE LicenseTypes (
    LicenseTypeID INT PRIMARY KEY,
    TypeName VARCHAR(255),
    Description TEXT
);

-- Таблица: LicenseCategories
CREATE TABLE LicenseCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    Description TEXT
);

-- Таблица: DrivingSchools
CREATE TABLE DrivingSchools (
    SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    TrafficPoliceID INT,
    FOREIGN KEY (TrafficPoliceID) REFERENCES TrafficPolice(PoliceID)
);

-- Таблица: Instructors
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    LicenseTypeID INT,
    HireDate DATE,
    TrafficPoliceID INT,
    FOREIGN KEY (LicenseTypeID) REFERENCES LicenseTypes(LicenseTypeID),
    FOREIGN KEY (TrafficPoliceID) REFERENCES TrafficPolice(PoliceID)
);

-- Таблица: TrainingCourses
CREATE TABLE TrainingCourses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    DurationInHours INT
);

-- Таблица: Applications
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    ApplicantID INT,
    LicenseTypeID INT,
    CategoryID INT,
    ApplicationDate DATE,
    TrafficPoliceID INT,
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID),
    FOREIGN KEY (LicenseTypeID) REFERENCES LicenseTypes(LicenseTypeID),
    FOREIGN KEY (CategoryID) REFERENCES LicenseCategories(CategoryID),
    FOREIGN KEY (TrafficPoliceID) REFERENCES TrafficPolice(PoliceID)
);

-- Таблица: Lessons
CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY,
    InstructorID INT,
    CourseID INT,
    LessonDate DATETIME,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    FOREIGN KEY (CourseID) REFERENCES TrainingCourses(CourseID)
);

-- Таблица: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    InstructorID INT,
    CourseID INT,
    ExamDate DATETIME,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    FOREIGN KEY (CourseID) REFERENCES TrainingCourses(CourseID)
);

-- Таблица: ExamResults
CREATE TABLE ExamResults (
    ResultID INT PRIMARY KEY,
    ExamID INT,
    ApplicantID INT,
    Grade VARCHAR(10),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

-- Таблица: TrafficPolice
CREATE TABLE TrafficPolice (
    PoliceID INT PRIMARY KEY,
    PoliceName VARCHAR(255),
    Location VARCHAR(255)
);
