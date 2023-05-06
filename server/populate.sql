CREATE DATABASE IF NOT EXISTS ClaimSystem;
USE ClaimSystem;

DROP TABLE IF EXISTS ProjectExpenseClaims;
DROP TABLE IF EXISTS Currency;
DROP TABLE IF EXISTS EmployeeProjects;
DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;



CREATE TABLE Department (
    DepartmentCode varchar(20) NOT NULL,
    DepartmentName varchar(50) NOT NULL,

    PRIMARY KEY (DepartmentCode)
);

CREATE TABLE Employee (
    EmployeeID int NOT NULL,
    SupervisorID int,
    DepartmentCode varchar(20) NOT NULL,
    EmployeePassword varchar(255) NOT NULL,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    BankAccountNumber varchar(50) NOT NULL,
    
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (SupervisorID) REFERENCES Employee(EmployeeID),
    FOREIGN Key (DepartmentCode) REFERENCES Department(DepartmentCode)
);

CREATE TABLE Projects (
	ProjectID int NOT NULL,
	ProjectName varchar(100) NOT NULL,
    ProjectStatus varchar(255) NOT NULL,
    ProjectBudget float NOT NULL,
    ProjectLeadID int NOT NULL,
    
	PRIMARY KEY (ProjectID),
	FOREIGN KEY (ProjectLeadID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE EmployeeProjects (
    ProjectID int NOT NULL,
    EmployeeID int NOT NULL,
	
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    CONSTRAINT UC_EP UNIQUE (ProjectID,EmployeeID)
);

CREATE TABLE Currency (
    CurrencyID varchar(50) NOT NULL,
    ExchangeRate float NOT NULL,

    PRIMARY KEY (CurrencyID)
);


CREATE TABLE ProjectExpenseClaims (
    ClaimID int NOT NULL,
    ProjectID int NOT NULL,
    EmployeeID int NOT NULL,
    CurrencyID varchar(50) NOT NULL,
    ExpenseDate DATETIME NOT NULL,
    Amount float NOT NULL,
    Purpose varchar(255) NOT NULL,
    ChargeToDefaultDept boolean,
    AlternativeDeptCode varchar(255),
    ClaimStatus varchar(20),
    LastEditedClaimDate DATETIME,

    PRIMARY KEY (ClaimID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CurrencyID) REFERENCES Currency(CurrencyID),

    CONSTRAINT CheckClaimStatus CHECK (ClaimStatus IN ('pending', 'approved', 'rejected')),
    CONSTRAINT CheckEditedClaimDate CHECK (ExpenseDate <= LastEditedClaimDate)
);


SHOW TABLES