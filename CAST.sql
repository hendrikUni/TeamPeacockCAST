
CREATE SCHEMA CAST_TEST;

USE CAST_TEST; 

CREATE TABLE Accounts ( 
    AccountID int auto_increment Not Null, 
    Name varchar(100) Not Null, 
    Department varchar(36), 
    Promotion varchar(100), 
    UniversityEntry date, 
    PublicationsTotal int, 
    PublicationsAtUni varchar(100), 
    Academicemployment varchar(100) Not Null, 
    PRIMARY KEY (AccountID) 
 ); 

CREATE TABLE Research ( 
    ResearchID int AUTO_INCREMENT NOT NULL, 
    ResearchName VARCHAR(100) NOT NULL, 
    Topic VARCHAR(100), 
    StudyIntegration BOOL, 
	Datatype DOUBLE, 
	AcademicIntegrity VARCHAR(100), 
	EthicsMeasure VARCHAR(100), 
	AcademicProgram VARCHAR(100), 
    PRIMARY KEY (ResearchID) 
); 

CREATE TABLE ResearchPartners ( 
    ResearchPartnerID int AUTO_INCREMENT NOT NULL, 
    ResearchPartnerName VARCHAR(100) NOT NULL, 
    Position VARCHAR(3), 
    PRIMARY KEY (ResearchPartnerID) 
); 

CREATE TABLE Degrees ( 
    DegreeID int AUTO_INCREMENT NOT NULL, 
    DegreeName VARCHAR(100) NOT NULL, 
    Semester VARCHAR(50), 
    PRIMARY KEY (DegreeID) 
); 

CREATE TABLE ThirdPartySupports ( 
    ThirdPartySupportID int AUTO_INCREMENT NOT NULL, 
    ThirdPartySupportName VARCHAR(100) NOT NULL, 
    PRIMARY KEY (ThirdPartySupportID) 
); 

CREATE TABLE Engagements ( 
	DegreeID int, 
	ThirdPartySupportID int, 
    FOREIGN KEY (DegreeID) REFERENCES Degrees(DegreeID), 
    FOREIGN KEY (ThirdPartySupportID) REFERENCES ThirdPartySupports(ThirdPartySupportID) 
); 

CREATE TABLE Projects 
( 
    ProjectID int not null auto_increment, 
    PartnerID int not null, 
    ProjectName varchar(100) not null, 
    InPlanning bool, 
    DateStart datetime, 
    DateEnd datetime, 
    DateSubmission date, 
    DateDecision date, 
    Department varchar(100), 
    ThirdPartySupport varchar(100), 
    Funding int, 
    ResponsibleForFunding varchar(100), 
    Editor varchar(100), 
    ScientificOutput varchar(100), 
    Speaker varchar(100), 
    Category varchar(100), 
    PRIMARY KEY (ProjectID), 
    FOREIGN KEY	(PartnerID) REFERENCES ResearchPartners(ResearchPartnerID) 
); 

CREATE TABLE Fundings (  
	AccountID int,  
	ProjectID int, 
	Year Date,  
	National DOUBLE, 
	State DOUBLE,  
	OrganizationsOrEU DOUBLE,  
	DFG DOUBLE,  
	Buisnesses DOUBLE,  
	OtherFunders DOUBLE,  
	FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),  
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) 
); 

 CREATE TABLE Publications( 
    AccountID int Not Null, 
    PublicationID int auto_increment Not Null, 
    Name varchar(100) Not Null, 
    Year int, 
    Ranking int, 
    PublicationIndex int, 
    PRIMARY KEY (PublicationID), 
    FOREIGN KEY(AccountID) references Accounts(AccountID) 
 ); 
 